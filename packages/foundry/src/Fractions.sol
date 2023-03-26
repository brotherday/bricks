// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Fractions is ERC20 {
    string constant FRACTION_VERIFICATION = "BRICKS-FRACTIONAL-NFTS";

    constructor(
        string memory name_,
        string memory symbol_,
        uint256 initialSupply,
        address receiver
    ) ERC20(name_, symbol_) {
        _mint(receiver, initialSupply);
    }

    function burn(address account, uint256 amount) external {
        super._burn(account, amount);
    }
}
