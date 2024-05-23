 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function double(uint _value) public pure returns(uint d) {
        d = _value * 2;
    }
}
