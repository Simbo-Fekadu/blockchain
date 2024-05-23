// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address hero) external {
        (bool success, ) = hero.call("randomData");

        require(success, "Fallback call failed");
    }
}