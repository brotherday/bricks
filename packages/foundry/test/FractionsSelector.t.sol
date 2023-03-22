// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ERC165/FractionsSelector.sol";

contract FractionsSelectorTest is Test {
    FractionsSelector FS;

    function setUp() public {
        FS = new FractionsSelector();
    }

    function testGetID() public view returns (bytes4) {
        bytes4 value = FS.ifractionsID();
        console.logBytes4(value);
    }
}