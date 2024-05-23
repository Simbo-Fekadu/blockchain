 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function double(uint _value) public pure returns(uint d) {
        d = _value * 2;
    }

    function double(uint _val1, uint _val2) external pure returns(uint, uint) {
        return (double(_val1), double(_val2));
    }
}
