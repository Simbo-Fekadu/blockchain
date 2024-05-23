// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Contract.sol";

contract ContractTest is Test {
    Contract public myContract;
    address a1 = address(2);
    address a2 = address(3);

    function setUp() public {
        myContract = new Contract();
    }

    function testUnacquainted() public {
        assertEq(uint(myContract.connections(a1, a2)), uint(Contract.ConnectionTypes.Unacquainted));
        assertEq(uint(myContract.connections(a2, a1)), uint(Contract.ConnectionTypes.Unacquainted));
    }

    function testConnectingBoth() public {
        vm.prank(a1);
        myContract.connectWith(a2, Contract.ConnectionTypes.Friend);
        vm.prank(a2);
        myContract.connectWith(a1, Contract.ConnectionTypes.Friend);

        assertEq(uint(myContract.connections(a1, a2)), uint(Contract.ConnectionTypes.Friend));
        assertEq(uint(myContract.connections(a2, a1)), uint(Contract.ConnectionTypes.Friend));
    }

    function testConnectingOne() public {
        vm.prank(a1);
        myContract.connectWith(a2, Contract.ConnectionTypes.Family);

        assertEq(uint(myContract.connections(a1, a2)), uint(Contract.ConnectionTypes.Family));
        assertEq(uint(myContract.connections(a2, a1)), uint(Contract.ConnectionTypes.Unacquainted));
    }
}