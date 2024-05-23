// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    address member1 = address(2);
    address member2 = address(3);
    address nonMember1 = address(4);
    address nonMember2 = address(5);

    function setUp() public {
        myContract = new Contract();
        myContract.addMember(member1);
        myContract.addMember(member2);
    }

    function testMembers() public {
        assertEq(myContract.members(member1), true);
        assertEq(myContract.members(member2), true);
    }

    function testNonMembers() public {
        assertEq(myContract.members(nonMember1), false);
        assertEq(myContract.members(nonMember2), false);
    }
}