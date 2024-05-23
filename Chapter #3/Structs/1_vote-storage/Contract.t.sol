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
        (Contract.Choices choice, address voter) = myContract.vote();
        assertEq(uint(choice), uint(Contract.Choices.Yes), "it should set the vote to Yes");
        assertEq(voter, votingAddr, "it should set the voter to the msg.sender");
    }

    function testVoteNo() public {
        myContract.createVote(Contract.Choices.No);
        (Contract.Choices choice, address voter) = myContract.vote();
        assertEq(uint(choice), uint(Contract.Choices.No), "it should set the vote to No");
        assertEq(voter, votingAddr, "it should set the voter to the msg.sender");
    }
}