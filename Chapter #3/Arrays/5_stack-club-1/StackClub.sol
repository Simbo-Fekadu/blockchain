// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address[] public members;

    function addMember(address _addr) external {
        members.push(_addr);
    }

    function isMember(address _addr) external view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (_addr == members[i]) {
                return true;
            }
        }

        return false;
    }
}