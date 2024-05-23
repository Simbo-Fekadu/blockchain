// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    uint256[] arr;

    function setUp() public {
        myContract = new Contract();
    }

    function testSum1() public {
        arr.push(5);
        assertEq(myContract.sum(arr), 5);
    }

    function testSum2() public {
        arr.push(1);
        arr.push(1);
        arr.push(1);
        assertEq(myContract.sum(arr), 3);
    }

    function testSum3() public {
        arr.push(5);
        arr.push(5);
        arr.push(5);
        arr.push(5);
        arr.push(5);
        assertEq(myContract.sum(arr), 25);
    }
}