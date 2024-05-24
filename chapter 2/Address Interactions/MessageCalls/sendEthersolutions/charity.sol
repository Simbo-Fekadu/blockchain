 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    address public owner;
    address public charityAddress;
    mapping(address => uint) public tips;

    constructor(address _charityAddress) {
        owner = msg.sender;
        charityAddress = _charityAddress;
    }

    receive() external payable {
        console.log("Received ether:", msg.value);
    }

    function tip() public payable {
        tips[msg.sender] += msg.value;
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Transfer to owner failed");
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        uint amount = tips[owner];
        require(amount > 0, "No funds to withdraw");
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Withdrawal failed");
        tips[owner] = 0;
    }

    function donate() public {
        uint contractBalance = address(this).balance;
        require(contractBalance > 0, "No funds to donate");
        (bool success, ) = charityAddress.call{value: contractBalance}("");
        require(success, "Donation transfer failed");
    }
}