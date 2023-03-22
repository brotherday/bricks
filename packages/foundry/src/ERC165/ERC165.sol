// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// @note ID => 0x01ffc9a7
interface BricksERC165 {
  function supportsInterface(bytes4 interfaceId) external view returns (bool);
}