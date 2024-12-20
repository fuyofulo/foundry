// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.28;

contract Contract { 

    uint count = 5;

    constructor () {

    }

    function increaseCount () public {
        count += 1;
    }

    function decreaseCount () public {
        count -= 1;
    }

    function getCount () public view returns (uint) {
        return count;
    }

}
