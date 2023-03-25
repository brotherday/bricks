// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/BricksCore.sol";
import "../src/Fractions.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../src/Vault.sol";
import "./mocks/MockERC721.sol";
import "./mocks/MockERC20.sol";
import "../src/transparent_proxy/TransparentUpgradeableProxy.sol";
import "../src/transparent_proxy/ProxyAdmin.sol";
import "../src/Pool.sol";

contract PoolTest is Test {
    BricksCore public bricksCore;
    Vault public vault;
    MockERC721 public mockERC721;
    MockERC20 public mockERC20;
    ProxyAdmin public proxyAdmin;
    TransparentUpgradeableProxy public transparentUpgradeableProxy;

    Pool public pool;

    uint256 public constant TOTAL_FRACTIONS_NUMBER = 8;
    address public nonOwner = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    string public name = "F-MockERC721#0";
    string public symbol = "FM#0";

    uint256 public constant AMOUNT_TO_DEPOSIT_IN_POOL = 4;
    uint256 public constant UNIT_PRICE = 1000;

    uint256 public constant AMOUNT_TO_BUY = 1;

    function setUp() public {
        bricksCore = new BricksCore();
        proxyAdmin = new ProxyAdmin();
        transparentUpgradeableProxy = new TransparentUpgradeableProxy(
            address(bricksCore),
            address(proxyAdmin),
            abi.encodeWithSignature("intialize()")
        );
        bricksCore = BricksCore(address(transparentUpgradeableProxy));
        pool = new Pool(address(bricksCore));

        mockERC721 = new MockERC721();
        mockERC20 = new MockERC20();
    }

    receive() external payable {}

    function approveAndFraction() internal returns (address) {
        mockERC721.approve(address(bricksCore), 0);
        address fractions =
            bricksCore.fraction(address(mockERC721), 0, TOTAL_FRACTIONS_NUMBER, name, symbol, address(this));

        return fractions;
    }

    function approveAndDeposit() internal returns (address) {
        address fractions = approveAndFraction();

        IERC20(fractions).approve(address(pool), AMOUNT_TO_DEPOSIT_IN_POOL);
        pool.deposit(fractions, AMOUNT_TO_DEPOSIT_IN_POOL, UNIT_PRICE);

        return fractions;
    }

    function testDepositTransferTokensFromOwnerToPool() public {
        address fractions = approveAndDeposit();

        assertEq(IERC20(fractions).balanceOf(address(pool)), AMOUNT_TO_DEPOSIT_IN_POOL);
    }

    function testDepositIncreasefractionsAvailableAmount() public {
        address fractions = approveAndDeposit();

        assertEq(pool.fractionsAvailableAmount(fractions), AMOUNT_TO_DEPOSIT_IN_POOL);
    }

    function testDepositSETFractionsUnitPrices() public {
        address fractions = approveAndDeposit();

        assertEq(pool.fractionsUnitPrice(fractions), UNIT_PRICE);
    }

    function testCannotDepositNonFractionsToken() public {
        mockERC20.approve(address(pool), AMOUNT_TO_DEPOSIT_IN_POOL);
        vm.expectRevert("specified address is not a Fractions contract address");

        pool.deposit(address(mockERC20), AMOUNT_TO_DEPOSIT_IN_POOL, UNIT_PRICE);
    }

    function testCannotDepositNonOwner() public {
        address fractions = approveAndDeposit();

        vm.startPrank(nonOwner);
        MockERC721 mockERC721Two = new MockERC721();
        mockERC721Two.approve(address(bricksCore), 0);
        address fractionsTwo =
            bricksCore.fraction(address(mockERC721Two), 0, TOTAL_FRACTIONS_NUMBER, name, symbol, nonOwner);
        IERC20(fractions).approve(address(pool), AMOUNT_TO_DEPOSIT_IN_POOL);
        vm.stopPrank();

        vm.expectRevert("Only original owner can call this function");
        pool.deposit(fractionsTwo, AMOUNT_TO_DEPOSIT_IN_POOL, UNIT_PRICE);
    }

    function testBuyDecreasesFractionsAvailableAmount() public {
        address fractions = approveAndDeposit();

        vm.prank(address(1));
        vm.deal(address(1), 1 ether);

        pool.buy{value: UNIT_PRICE}(fractions, AMOUNT_TO_BUY);
        assertEq(pool.fractionsAvailableAmount(fractions), AMOUNT_TO_DEPOSIT_IN_POOL - AMOUNT_TO_BUY);
    }

    function testBuyTransferFractionsToBuyer() public {
        address fractions = approveAndDeposit();

        vm.prank(address(1));
        vm.deal(address(1), 1 ether);

        pool.buy{value: UNIT_PRICE}(fractions, AMOUNT_TO_BUY);
        assertEq(IERC20(fractions).balanceOf(address(1)), AMOUNT_TO_BUY);
    }

    function testBuyTransferIncreasesOwnersBalances() public {
        address fractions = approveAndDeposit();

        vm.prank(address(1));
        vm.deal(address(1), 1 ether);

        pool.buy{value: UNIT_PRICE}(fractions, AMOUNT_TO_BUY);
        assertEq(pool.ownersBalances(address(this)), UNIT_PRICE);
    }

    function testCannotBuyWithInsufficientFunds() public {
        address fractions = approveAndDeposit();

        vm.prank(address(1));
        vm.deal(address(1), 1 ether);

        vm.expectRevert("insufficient fund");
        pool.buy{value: 999}(fractions, AMOUNT_TO_BUY);
    }

    function testCannotBuyAnAmountThatExceedsBalance() public {
        address fractions = approveAndDeposit();

        vm.prank(address(1));
        vm.deal(address(1), 1 ether);

        vm.expectRevert("amount exceeds balance");
        pool.buy{value: UNIT_PRICE * 5}(fractions, 5);
    }

    function testWithdrawSetsBalanceToZero() public {
        address fractions = approveAndDeposit();

        uint256 initialBalance = address(this).balance;

        vm.startPrank(address(1));
        vm.deal(address(1), 1 ether);

        pool.buy{value: UNIT_PRICE}(fractions, AMOUNT_TO_BUY);

        vm.stopPrank();
        pool.withdraw(fractions);
        assertEq(address(this).balance, initialBalance + UNIT_PRICE);
    }

    function testCannotWithdrawNonOwner() public {
        address fractions = approveAndDeposit();

        vm.startPrank(address(1));
        vm.deal(address(1), 1 ether);

        pool.buy{value: UNIT_PRICE}(fractions, AMOUNT_TO_BUY);
        vm.expectRevert("Only original owner can withdraw funds");
        pool.withdraw(fractions);
    }
}
