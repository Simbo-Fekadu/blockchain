// SPDX-License-Identifier:  MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    function winningNumber(string calldata secretMessage) external view returns(uint) {
        console.log(secretMessage);
        return 0; //read return value from log message
    }
}
