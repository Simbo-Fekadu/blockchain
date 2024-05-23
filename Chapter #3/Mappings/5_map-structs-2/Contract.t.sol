// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    address addr1 = address(2);
    address addr2 = address(3);

    function setUp() public {
        myContract = new Contract();

        vm.prank(addr1);
        myContract.createUser();

        vm.prank(addr2);
        myContract.createUser();
    }

    function testInitialUsers() public {
        (uint balance, bool isActive) = myContract.users(addr1);
        assertEq(balance, 100, "expect initial user balance to be 100");
        assertEq(isActive, true, "expect user to be set to active initially");
    }

    function testTransfer() public {
        vm.prank(addr2);
        myContract.transfer(addr1, 50);

        (uint balance,) = myContract.users(addr1);
        assertEq(balance, 150, "expect a transfer to increase recipients balance");

        (uint balance2,) = myContract.users(addr2);
        assertEq(balance2, 50, "expect a transfer to increase recipients balance");
    }

    function testTransferTooMuch() public {
        vm.prank(addr2);
        vm.expectRevert();
        myContract.transfer(addr1, 150);
    }

    function testTransferToInactive() public {
        vm.prank(addr2);
        vm.expectRevert();
        myContract.transfer(address(4), 50);
    }
}