// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;
    // Stored helper var if a vote was not casted
    Vote internal NULL_VOTE = Vote(Choices(0), address(0));

    error VoteAlreadyCasted();
    error VoteNotFound();

    function createVote(Choices choice) external {
        if (hasVoted(msg.sender)) {
            revert VoteAlreadyCasted();
        }
        votes.push(Vote(choice, msg.sender));
    }

    function changeVote(Choices _choice) external {
        Vote storage vote = findVote(msg.sender);
        if (vote.voter != msg.sender) {
            revert VoteNotFound();
        }

        vote.choice = _choice;
    }

    function hasVoted(address _addr) public view returns (bool) {
        Vote storage vote = findVote(_addr);
        if (_addr == vote.voter) {
            return true;
        }

        return false;
    }

    function findChoice(address _addr) external view returns (Choices) {
        Vote storage vote = findVote(_addr);
        if (_addr == vote.voter) {
            return vote.choice;
        }
        // Undefined case
        return Choices.No;
    }

    function findVote(address _addr) internal view returns (Vote storage) {
        for (uint i = 0; i < votes.length; i++) {
            if (_addr == votes[i].voter) {
                return votes[i];
            }
        }

        return NULL_VOTE;
    }
}