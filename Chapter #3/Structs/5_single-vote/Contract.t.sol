// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    address votingAddr = address(2);

    function setUp() public {
        vm.startPrank(votingAddr);
        myContract = new Contract();
    }

    function testVoteYes() public {
        myContract.createVote(Contract.Choices.Yes);
        assertEq(myContract.hasVoted(votingAddr), true, "it should register the address as having voted");
        vm.expectRevert();
        myContract.createVote(Contract.Choices.Yes);
    }

    function testVoteNo() public {
        myContract.createVote(Contract.Choices.No);
        assertEq(myContract.hasVoted(votingAddr), true, "it should register the address as having voted");
        vm.expectRevert();
        myContract.createVote(Contract.Choices.No);
    }
}