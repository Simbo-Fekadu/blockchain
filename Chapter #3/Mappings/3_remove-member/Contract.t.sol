// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    address member1 = address(2);
    address member2 = address(3);

    function setUp() public {
        myContract = new Contract();
        myContract.addMember(member1);
        myContract.addMember(member2);
    }

    function testMembers() public {
        assertEq(myContract.isMember(member1), true);
        assertEq(myContract.isMember(member2), true);
    }

    function testRemoval() public {
        myContract.removeMember(member1);
        assertEq(myContract.isMember(member1), false);
        assertEq(myContract.isMember(member2), true);

        myContract.removeMember(member2);
        assertEq(myContract.isMember(member1), false);
        assertEq(myContract.isMember(member2), false);
    }
}