// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;

    function setUp() public {
        myContract = new Contract();
    }

    function testSum1() public {
        uint256[5] memory arr = [uint(1), 1, 1, 1, 1];
        assertEq(myContract.sum(arr), 5);
    }

    function testSum2() public {
        uint256[5] memory arr = [uint(1), 2, 3, 4, 5];
        assertEq(myContract.sum(arr), 15);
    }
}