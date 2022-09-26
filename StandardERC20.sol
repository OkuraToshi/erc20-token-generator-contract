// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract StandardERC20 is ERC20, ReentrancyGuard {
    uint256 public _totalsupply;
    
   
    constructor(
        string memory name,
        string memory symbol,
        uint256 totalSupply
    ) ERC20(name, symbol) {
        _totalsupply = totalSupply;
        _mint(msg.sender, _totalsupply);
        
    }
}
