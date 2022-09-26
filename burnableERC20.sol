// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract BurnableERC20 is ERC20Burnable {
    uint256 public _totalsupply;
    address Owner;
    uint8 public _decimals;
   
   modifier OnlyOwner(){
        require(msg.sender == Owner,"Caller is Not an Owner" );
        _;
    }

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals_,
        uint256 totalSupply
    ) ERC20(name, symbol) {
        _totalsupply = totalSupply;
        _decimals = decimals_;
        _mint(msg.sender, _totalsupply);
        
    }

    function tranferOwnership(address NewOwner) public OnlyOwner{
        Owner = NewOwner;

    }


}
