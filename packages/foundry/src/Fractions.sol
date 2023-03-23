// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./ERC165/ERC165.sol";
import "./IFractionsId.sol";
import "./IFractions.sol";

contract Fractions is ERC20, IFractions, IFractionsId {
    string constant FRACTION_VERIFICATION = "BRICKS-FRACTIONAL-NFTS";

    constructor(string memory name_, string memory symbol_, uint256 initialSupply, address receiver)
        ERC20(name_, symbol_)
    {
        _mint(receiver, initialSupply);
    }

    function fractionalNFTS() external pure returns (bytes32) {
        return keccak256(abi.encodePacked(FRACTION_VERIFICATION));
    }

    function burn(address account, uint256 amount) external {
        super._burn(account, amount);
    }

    function supportsInterface(bytes4 interfaceID) external pure returns (bool) {
        return interfaceID == FRACTIONS_INTERFACE_ID;
    }
}
