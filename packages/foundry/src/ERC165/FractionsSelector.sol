pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "./ERC165.sol";

contract FractionsSelector {
    function ERC165ID() external pure returns (bytes4) {
        return type(BricksERC165).interfaceId;
    }

    function IERC72ID() external pure returns (bytes4) {
        return type(IERC721).interfaceId;
    }

    function IERC1155ID() external pure returns (bytes4) {
        return type(IERC1155).interfaceId;
    }
}
