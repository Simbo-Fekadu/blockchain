// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./StackClub.sol";

contract StackClubTest is Test {
    StackClub public stackClub;
    address member1 = address(2);
    address member2 = address(3);
    address nonMember1 = address(4);
    address nonMember2 = address(5);

    function setUp() public {
        stackClub = new StackClub();
        stackClub.addMember(member1);
        stackClub.addMember(member2);
    }

    function testMembers() public {
        assertEq(stackClub.isMember(member1), true);
        assertEq(stackClub.isMember(member2), true);
    }

    function testNonMembers() public {
        assertEq(stackClub.isMember(nonMember1), false);
        assertEq(stackClub.isMember(nonMember2), false);
    }

    function testAddAsNonMember() public {
        vm.startPrank(nonMember1);

        vm.expectRevert();
        stackClub.addMember(address(6));

        vm.expectRevert();
        stackClub.removeLastMember();
    }

    function testRemoveLastMember() public {
        stackClub.removeLastMember();
        assertEq(stackClub.isMember(member1), true);
        assertEq(stackClub.isMember(member2), false);

        stackClub.removeLastMember();
        assertEq(stackClub.isMember(member1), false);
        assertEq(stackClub.isMember(member2), false);
    }
}