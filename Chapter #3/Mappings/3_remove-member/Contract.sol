// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    mapping(address => bool) public members;

    function addMember(address _addr) external {
        members[_addr] = true;
    }

    function isMember(address _addr) external view returns (bool) {
        return members[_addr];
    }

    function removeMember(address _addr) external {
        members[_addr] = false;
    }
}