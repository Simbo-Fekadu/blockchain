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
        Contract.Vote memory vote = myContract.createVote(Contract.Choices.Yes);
        assertEq(uint(vote.choice), uint(Contract.Choices.Yes), "it should set the vote to Yes");
        assertEq(vote.voter, votingAddr, "it should set the voter to the msg.sender");
    }

    function testVoteNo() public {
        Contract.Vote memory vote = myContract.createVote(Contract.Choices.No);
        assertEq(uint(vote.choice), uint(Contract.Choices.No), "it should set the vote to No");
        assertEq(vote.voter, votingAddr, "it should set the voter to the msg.sender");
    }
}