// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./DetailedERC20.sol";


//CommonERC20 is burnable, mintable and Detailed ERC20. 
contract CommonERC20 is DetailedERC20 {
    uint256 public _totalsupply;
    uint256 private RemainingSupply;
    address Owner;
    uint256 public _circulatingSupply;


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
        uint8 decimals_,
        uint256 initialSupply,
        uint256 totalSupply
    ) DetailedERC20(name, symbol, decimals_) {
        _totalsupply = totalSupply;
        _mint(msg.sender, initialSupply);
         _circulatingSupply = initialSupply;
        RemainingSupply = totalSupply - initialSupply;
        Owner = msg.sender;
        // _paused = false;

    }

    function mint(uint256 amount) public isValidMint(amount) OnlyOwner {
        
        _mint(msg.sender, amount);
        _circulatingSupply += amount;
    }

    function burn(uint256 amount) public {

        _burn(_msgSender(), amount);
        _circulatingSupply -= amount;
    }

    /**
     * @dev Destroys `amount` tokens from `account`, deducting from the caller's
     * allowance.
     *
     * See {ERC20-_burn} and {ERC20-allowance}.
     *
     * Requirements:
     *
     * - the caller must have allowance for ``accounts``'s tokens of at least
     * `amount`.
     */
    function burnFrom(address account, uint256 amount) public {
        
        uint256 currentAllowance = allowance(account, _msgSender());
        require(
            currentAllowance >= amount,
            "ERC20: burn amount exceeds allowance"
        );
        unchecked {
            _approve(account, _msgSender(), currentAllowance - amount);
        }
        _burn(account, amount);
        _circulatingSupply -= amount;
    }

    function tranferOwnership(address NewOwner) public OnlyOwner{
        Owner = NewOwner;

    }
    
}
