// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    function newProposal(address target, bytes calldata data) external {
        Proposal memory initialProposal = Proposal({
            target: target,
            data: data,
            yesCount: 0,
            noCount: 0
        });

        proposals.push(initialProposal);
    }

    mapping(uint => mapping(address => bool)) public votes;
    mapping(uint => mapping(address => bool)) public hasVoted;

    function castVote(uint proposalId, bool vote) external {
        if (hasVoted[proposalId][msg.sender]) {
            bool prevVote = votes[proposalId][msg.sender];

            if (vote != prevVote) {
                if (prevVote) {
                    proposals[proposalId].yesCount -= 1;
                    proposals[proposalId].noCount += 1;
                } else {
                    proposals[proposalId].yesCount += 1;
                    proposals[proposalId].noCount -= 1;
                }
                votes[proposalId][msg.sender] = vote;
            } else {
                if (prevVote) {
                    proposals[proposalId].yesCount -= 1;
                } else {
                    proposals[proposalId].noCount -= 1;
                }
                hasVoted[proposalId][msg.sender] = false;
            }
        } else {
            if (vote == true) {
                proposals[proposalId].yesCount += 1;
            } else {
                proposals[proposalId].noCount += 1;
            }
            hasVoted[proposalId][msg.sender] = true;
            votes[proposalId][msg.sender] = vote;
        }
    }
}
