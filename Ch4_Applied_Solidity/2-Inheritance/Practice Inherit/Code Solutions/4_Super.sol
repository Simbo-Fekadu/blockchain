// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

contract Warrior is Hero(200) { 
    function attack(Enemy enemy) public override {
        enemy.takeAttack(Hero.AttackTypes.Brawl);
        Hero.attack(enemy);
    }
}

contract Mage is Hero(50) { 
    function attack(Enemy enemy) public override {
        enemy.takeAttack(Hero.AttackTypes.Spell);
        super.attack(enemy);
    }
}