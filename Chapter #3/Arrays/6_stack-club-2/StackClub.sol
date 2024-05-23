// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address[] public members;
    
    error Forbidden();

    constructor() {
        members.push(msg.sender);
    }

    function isMember(address _addr) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (_addr == members[i]) {
                return true;
            }
        }

        return false;
    }

    modifier inMembersGroup {
        if (!isMember(msg.sender)) {
            revert Forbidden();
        }
        _;
    }

    function addMember(address _addr) external inMembersGroup {
        members.push(_addr);
    }

    function removeLastMember() external inMembersGroup {
        members.pop();
    }
}