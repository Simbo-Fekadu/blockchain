// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Hero {
    bool public alerted;

    function alert() external {
        alerted = true;
    }
}