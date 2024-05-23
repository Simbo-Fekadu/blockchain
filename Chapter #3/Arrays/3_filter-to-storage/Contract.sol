// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    uint[] public evenNumbers;

    function filterEven(uint[] calldata _values) external {
        for (uint i = 0; i < _values.length; i++) {
            if (_values[i] % 2 == 0) {
                evenNumbers.push(_values[i]);
            }
        }
    }
}