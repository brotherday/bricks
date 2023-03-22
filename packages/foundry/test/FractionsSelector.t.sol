// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ERC165/FractionsSelector.sol";

contract FractionsSelectorTest is Test {
    FractionsSelector FS;

    function setUp() public {
        FS = new FractionsSelector();
    }

    function testFractions() public view {
        bytes4 value = FS.IFractionsID();

        console.logBytes4(value);
    }

    function test165() public view {
        bytes4 value = FS.ERC165ID();

        console.logBytes4(value);
    }

    function test721ID() public view {
        bytes4 value = FS.IERC72ID();

        console.logBytes4(value);
    }

    function test1155ID() public view {
        bytes4 value = FS.IERC1155ID();

        console.logBytes4(value);
    }
}
