// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/FuyoCoin.sol";

contract TestFuyoCoin is Test {

    FuyoCoin c;
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        c = new FuyoCoin();
    }

    function testMint() public {
        c.mint(address(this), 100);
        assertEq(c.balanceOf(address(this)), 100, "ok");
        assertEq(c.balanceOf(0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57), 0, "ok");


        c.mint(0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57, 100);
        assertEq(c.balanceOf(0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57), 100, "ok");
    }

    function testTransfer() public {
        c.mint(address(this), 500);
        c.transfer(0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57, 250);
        assertEq(c.balanceOf(0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57), 250, "ok");
        assertEq(c.balanceOf(address(this)), 250, "ok");
    }

    function testApproval() public {
        c.mint(address(this), 500);
        c.approve(0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57, 300);
        vm.prank(0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57);
        c.transferFrom(address(this),0x46DD15aa87C53a2B01c11A71377f0B655Ed65958, 250);
        
        assertEq(c.balanceOf(0x46DD15aa87C53a2B01c11A71377f0B655Ed65958), 250, "ok");
        assertEq(c.balanceOf(address(this)), 250, "ok");
        assertEq(c.allowance(address(this),0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57), 50, "ok");
    }

    function testTransferEmit() public {
        c.mint(address(this), 100);

        vm.expectEmit(true, true, false, true);
        emit Transfer(address(this), 0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57, 50);

        c.transfer(0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57, 50);
    }

    function testApprovalEmit() public {
        c.mint(address(this), 100);

        vm.expectEmit(true, true, false, true);
        emit Approval(address(this),0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57, 50);

        c.approve(0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57, 50);
        vm.prank(0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57);
        c.transferFrom(address(this), 0x21D6247c34358651C6D1af35E0ccdC9d0dD70e57, 50);
    }

}