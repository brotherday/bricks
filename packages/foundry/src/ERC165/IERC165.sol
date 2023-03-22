pragma solidity ^0.8.0;

interface ERC165 {
  function supportsInterface(bytes4 interfaceId) external view returns (bool);
}