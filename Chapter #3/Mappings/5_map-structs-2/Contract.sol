// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    error UserAlreadyCreated();
    error UserNotActive();
    error NotEnoughFunds();

    function createUser() external {
        if (users[msg.sender].isActive) {
            revert UserAlreadyCreated();
        }

        users[msg.sender] = User(100, true);
    }

    function transfer(address _recipient, uint _amount) external {
        if (!users[msg.sender].isActive || !users[_recipient].isActive) {
            revert UserNotActive();
        }
        if (users[msg.sender].balance < _amount) {
            revert NotEnoughFunds();
        }

        users[msg.sender].balance -= _amount;
        users[_recipient].balance += _amount;
    }
}