// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FuyoCoin is ERC20 {
 

    constructor() ERC20("FuyoCoin", "FUYOCOIN"){

    }


    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }


}
