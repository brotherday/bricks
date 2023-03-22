pragma solidity ^0.8.0;

import "../IFractions.sol";

contract FractionsSelector {
    function ifractionsID() external pure returns (bytes4) {
        IFractions IF;
        return IF.burn.selector;
    }
}