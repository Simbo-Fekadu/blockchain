// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint amount);

    constructor(address _arbiter, address _beneficiary) payable {
        require(msg.value > 0, "Initial deposit must be greater than 0");

        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    modifier onlyArbiter() {
        require(msg.sender == arbiter, "Only the arbiter can call this function");
        _;
    }

    function approve() external onlyArbiter {
        uint amount = address(this).balance;
        payable(beneficiary).transfer(amount);
        emit Approved(amount);
    }
}
