// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./BricksCore.sol";

contract Pool {
    BricksCore bricksCore;

    constructor(address bricksCoreAddress) {
        bricksCore = BricksCore(bricksCoreAddress);
    }

    mapping(address => uint256) public fractionsAvailableAmount;
    mapping(address => uint256) public fractionsUnitPrice;

    mapping(address => uint256) public ownersBalances;

    modifier onlyFractionsContract(address fractionsContractAddress) {
        require(
            bricksCore.getFractionsInitialized(fractionsContractAddress) == true,
            "specified address is not a Fractions contract address"
        );
        _;
    }

    function deposit(address fractionsContractAddress, uint256 amount, uint256 unitPrice)
        external
        onlyFractionsContract(fractionsContractAddress)
    {
        (,, address originalOwner) = bricksCore.getStoredOriginal(fractionsContractAddress);
        require(msg.sender == originalOwner, "Only original owner can call this function");

        bool success = IERC20(fractionsContractAddress).transferFrom(msg.sender, address(this), amount);
        require(success, "transfer failed");

        fractionsAvailableAmount[fractionsContractAddress] += amount;
        fractionsUnitPrice[fractionsContractAddress] = unitPrice;
    }

    function buy(address fractionsContractAddress, uint256 amount)
        external
        payable
        onlyFractionsContract(fractionsContractAddress)
    {
        uint256 price = fractionsUnitPrice[fractionsContractAddress];
        require(msg.value >= price * amount, "insufficient fund");

        require(amount <= fractionsAvailableAmount[fractionsContractAddress], "amount exceeds balance");

        fractionsAvailableAmount[fractionsContractAddress] -= amount;

        bool success = IERC20(fractionsContractAddress).transfer(msg.sender, amount);
        require(success, "transfer failed");

        (,, address originalOwner) = bricksCore.getStoredOriginal(fractionsContractAddress);
        ownersBalances[originalOwner] += msg.value;
    }

    function withdraw(address fractionsContractAddress) external onlyFractionsContract(fractionsContractAddress) {
        (,, address originalOwner) = bricksCore.getStoredOriginal(fractionsContractAddress);
        require(msg.sender == originalOwner, "Only original owner can withdraw funds");
        uint256 balance = ownersBalances[msg.sender];
        ownersBalances[msg.sender] = 0;
        (bool success,) = msg.sender.call{value: balance}("");
        require(success, "Transfer failed.");
    }
}
