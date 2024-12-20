// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.28;

import "forge-std/Test.sol";

import "../src/Contract.sol";

contract TestContract is Test {
    Contract c;

    function setUp() public {
        c = new Contract();
    }

    function testIncrease () public {
        c.increaseCount();
        c.increaseCount();
        c.increaseCount();

        assertEq(uint(8), c.getCount(), "ok");
    }

    function testDecrease () public {
        c.decreaseCount();
        c.decreaseCount();
        c.decreaseCount();

        assertEq(uint(2), c.getCount(), "ok");
    }


}
