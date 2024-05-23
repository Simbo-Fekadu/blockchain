// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    address addr1 = address(2);

    function setUp() public {
        myContract = new Contract();
    }

    function testCreateUser() public {
        vm.startPrank(addr1);

        myContract.createUser();
        (uint balance, bool isActive) = myContract.users(addr1);
        assertEq(balance, 100, "expect initial user balance to be 100");
        assertEq(isActive, true, "expect user to be set to active initially");

        vm.expectRevert();
        myContract.createUser();
    }
}