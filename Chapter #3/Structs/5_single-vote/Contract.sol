// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    error VoteAlreadyCasted();

    function createVote(Choices choice) external {
        if (hasVoted(msg.sender)) {
            revert VoteAlreadyCasted();
        }
        votes.push(Vote(choice, msg.sender));
    }

    function hasVoted(address _addr) public view returns (bool) {
        Vote memory vote = findVote(_addr);
        if (_addr == vote.voter) {
            return true;
        }

        return false;
    }

    function findChoice(address _addr) external view returns (Choices) {
        Vote memory vote = findVote(_addr);
        if (_addr == vote.voter) {
            return vote.choice;
        }
        // Undefined case
        return Choices.No;
    }

    function findVote(address _addr) internal view returns (Vote memory) {
        for (uint i = 0; i < votes.length; i++) {
            if (_addr == votes[i].voter) {
                return votes[i];
            }
        }

        return Vote(Choices(0), address(0));
    }
}