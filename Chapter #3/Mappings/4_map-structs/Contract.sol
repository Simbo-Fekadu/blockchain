// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    error UserAlreadyCreated();

    function createUser() external {
        if (users[msg.sender].isActive) {
            revert UserAlreadyCreated();
        }

        users[msg.sender] = User(100, true);
    }
}