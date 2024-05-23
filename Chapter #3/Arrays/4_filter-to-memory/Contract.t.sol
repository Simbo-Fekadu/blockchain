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

    function testFilter1() public {
        arr.push(1);
        arr.push(2);
        arr.push(4);
        uint[] memory newArr = myContract.filterEven(arr);
        assertEq(newArr.length, 2);
        assertEq(newArr[0], 2);
        assertEq(newArr[1], 4);
    }

    function testFilter2() public {
        arr.push(1);
        arr.push(12);
        arr.push(302);
        arr.push(7);
        arr.push(10);
        uint[] memory newArr = myContract.filterEven(arr);
        assertEq(newArr.length, 3);
        assertEq(newArr[0], 12);
        assertEq(newArr[1], 302);
        assertEq(newArr[2], 10);
    }
}