// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// @note ID => 0x7d8d2ffd
interface IFractions {
    function fractionalNFTS() external pure returns (bytes32);

    function burn(address account, uint256 amount) external;
    
    function supportsInterface(bytes4 interfaceID) external pure returns (bool);
}
