steps to create your own ERC20 token:

step 1: initialize a forge project
forge init --template https://github.com/foundry-rs/forge-template hello_template

step 2: install openzepplin's erc20 implementation
npm install @openzeppelin/contracts

step 3: create a file named remappings.txt in the root folder and paste this
@openzeppelin/contracts/=node_modules/@openzeppelin/contracts

step 4: write this in the Contract.sol file:
// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SHINU is ERC20 { 

    constructor () ERC20("SHINU", "SHINU") {

    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

}

done :]
