// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./BricksCore.sol";

contract Pool {
    BricksCore bricksCore;

    constructor(address bricksCoreAddress) {
        bricksCore = BricksCore(bricksCoreAddress);
    }

    mapping(address => uint256) public fractionsBalances;
    mapping(address => uint256) public fractionsUnitPrice;

    function deposit(address fractionsContractAddress, uint256 amount, uint256 unitPrice) external {
        require(
            bricksCore.getFractionsInitialized(fractionsContractAddress) == true,
            "specified address is not a Fractions contract address"
        );

        (,, address originalOwner) = bricksCore.getStoredOriginal(fractionsContractAddress);
        require(msg.sender == originalOwner, "Only Original can call this function");

        IERC20(fractionsContractAddress).transferFrom(msg.sender, address(this), amount);

        fractionsBalances[fractionsContractAddress] += amount;
        fractionsUnitPrice[fractionsContractAddress] = unitPrice;
    }
}
