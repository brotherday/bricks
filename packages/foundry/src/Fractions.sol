// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./ERC165/ERC165.sol";
import "./IFractionsId.sol";
import "./IFractions.sol";

contract Fractions is ERC20Votes, IFractions, IFractionsId {
    string constant FRACTION_VERIFICATION = "BRICKS-FRACTIONAL-NFTS";

    constructor(string memory name_, string memory symbol_, uint256 initialSupply, address receiver)
        ERC20(name_, symbol_)
        ERC20Permit(name_)
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

    // The functions below are overrides required by Solidity.

    function _afterTokenTransfer(address from, address to, uint256 amount) internal override(ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount) internal override(ERC20Votes) {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount) internal override(ERC20Votes) {
        super._burn(account, amount);
    }
}
