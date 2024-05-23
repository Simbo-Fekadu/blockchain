// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    function sum(uint[5] calldata _values) external pure returns(uint) {
        uint res;
        for (uint i = 0; i < _values.length; i++) {
            res += _values[i];
        }

        return res;
    }
}