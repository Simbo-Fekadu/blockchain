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
        Contract.Choices choice = myContract.findChoice(votingAddr);
        assertEq(uint(choice), uint(Contract.Choices.Yes), "it should find the voting choice for the voter");
    }

    function testVoteNo() public {
        myContract.createVote(Contract.Choices.No);
        assertEq(myContract.hasVoted(votingAddr), true, "it should register the address as having voted");
        Contract.Choices choice = myContract.findChoice(votingAddr);
        assertEq(uint(choice), uint(Contract.Choices.No), "it should find the voting choice for the voter");
    }
}