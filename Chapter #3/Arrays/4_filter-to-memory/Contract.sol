// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    function filterEven(uint[] calldata _values) external pure returns (uint[] memory) {
        uint size;
        for (uint i = 0; i < _values.length; i++) {
            if (_values[i] % 2 == 0) {
                size++;
            }
        }

        uint[] memory evenNumbers = new uint[](size);
        uint index;
        for (uint i = 0; i < _values.length; i++) {
            if (_values[i] % 2 == 0) {
                evenNumbers[index++] = _values[i];
            }
        }

        return evenNumbers;
    }
}