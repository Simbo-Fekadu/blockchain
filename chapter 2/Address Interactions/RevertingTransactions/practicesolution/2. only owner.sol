
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	address owner;

	constructor() payable {
		owner = msg.sender;
		require(msg.value >= 1 ether, "Not enough ether sent");
	}

	function withdraw() public {
		require(msg.sender == owner);
		payable(msg.sender).transfer(address(this).balance);
	}
}