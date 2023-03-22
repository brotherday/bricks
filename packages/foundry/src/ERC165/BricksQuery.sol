pragma solidity ^0.8.0;

contract BricksQuery {
    bytes4 constant INVALID_ID = 0xffffffff;
    bytes4 constant ERC165_ID = 0x01ffc9a7;
    bytes4 constant IFRACTIONS_ID = 0x7d8d2ffd;

    function doesContractImplementInterface(
        address _contract,
        bytes4 _interfaceId
    ) public view returns (bool) {
        uint256 success;
        uint256 result;

        (success, result) = noThrowCall(_contract, ERC165_ID);
        if ((success == 0) || (result == 0)) {
            return false;
        }

        // (success, result) = noThrowCall(_contract, IFRACTIONS_ID);
        // if ((success == 0) || (result == 0)) {
        //     return false;
        // }

        (success, result) = noThrowCall(_contract, INVALID_ID);
        if ((success == 0) || (result != 0)) {
            return false;
        }

        (success, result) = noThrowCall(_contract, _interfaceId);
        if ((success == 1) || (result == 1)) {
            return true;
        }

        return false;
    }

    function noThrowCall(
        address _contract,
        bytes4 _interfaceId
    ) internal view returns (uint256 success, uint256 result) {
        bytes4 erc165ID = ERC165_ID;

        assembly {
            let x := mload(0x40) // Find empty storage location using "free memory pointer"
            mstore(x, erc165ID) // Place signature at beginning of empty storage
            mstore(add(x, 0x04), _interfaceId) // Place first argument directly next to signature

            success := staticcall(
                30000, // 30k gas
                _contract, // To addr
                x, // Inputs are stored at location x
                0x24, // Inputs are 36 bytes long
                x, // Store output over input (saves space)
                0x20
            ) // Outputs are 32 bytes long

            result := mload(x) // Load the result
        }
    }
}