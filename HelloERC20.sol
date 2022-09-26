// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


// Most basic Welcome ERC20 generator with a fixed supply of 10K which will be minted at the time of Deployment
// Takes only name and symbol of erc20

contract HelloERC20 is ERC20 {
   uint256 public  _totalsupply = 10000 * 1e18;
   

    constructor(string memory name,string memory symbol) ERC20(name, symbol){
        _mint(msg.sender,_totalsupply);
    }

}