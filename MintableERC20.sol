// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./DetailedERC20.sol";

contract MintableERC20 is DetailedERC20 {
    uint256 public _totalsupply;
    uint256 public _circulatingSupply;
    address Owner;

    modifier OnlyOwner() {
        require(msg.sender == Owner, "Caller is Not an Owner");
        _;
    }

    modifier isValidMint(uint256 amount) {
        require(
            (amount + _circulatingSupply) <= _totalsupply,
            "Amount Exceeds Total Supply"
        );
        _;
    }

    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply,
        uint256 totalSupply,
        uint8 Decimals
    ) DetailedERC20(name, symbol, Decimals) {
        require(
            initialSupply <= totalSupply,
            "Initial Supply Cannot Exceed Total Supply"
        );
        _totalsupply = totalSupply;
        _mint(msg.sender, initialSupply);
        _circulatingSupply = initialSupply;
        
        Owner = msg.sender;
    }

    function mint(uint256 amount) public isValidMint(amount) OnlyOwner {
        _mint(msg.sender, amount);
        _circulatingSupply += amount;
    }

    function tranferOwnership(address NewOwner) public OnlyOwner{
        Owner = NewOwner;

    }
    
}
