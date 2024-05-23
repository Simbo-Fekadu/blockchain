// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	constructor() payable {
		require(msg.value >= 1 ether, "Not enough ether sent");
	}
}