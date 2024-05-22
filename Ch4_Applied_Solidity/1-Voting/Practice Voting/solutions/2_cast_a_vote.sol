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

    function castVote(uint proposalId, bool vote) external {
        if (vote == true) {
            proposals[proposalId].yesCount += 1;
        } else {
            proposals[proposalId].noCount += 1;
        }
    }
}
