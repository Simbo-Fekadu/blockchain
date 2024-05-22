// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

contract Warrior is Hero(200) { }

contract Mage is Hero(50) { }