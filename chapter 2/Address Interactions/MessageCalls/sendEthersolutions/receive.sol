// receive ether
 
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        console.log("Received ether:", msg.value);
    }
}