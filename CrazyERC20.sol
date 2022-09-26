// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";


//CrazyERC20 is burnable, mintable,recoverable and pausable with unlimited supply.
contract CrazyERC20 is ERC20Pausable {
    uint256 public _circulatingSupply;
    address Owner;
    uint8 public _decimals;

   modifier OnlyOwner(){
        require(msg.sender == Owner,"Caller is Not an Owner" );
        _;
    }

    constructor(string memory name,string memory symbol, uint256 initialSupply, uint8 decimals_) ERC20(name, symbol){

        _decimals = decimals_;
        _mint(msg.sender,initialSupply);
        _circulatingSupply = initialSupply;
        Owner = msg.sender;
    
    }

    function mint(uint amount) public OnlyOwner{
        _mint(msg.sender, amount);
        _circulatingSupply += amount;
    }
    //pause the token transfer when invoked.
    function Pause() external OnlyOwner {
        
        _pause();
    }

    //Resume the token transfer when invoked.
    function UnPause() external OnlyOwner {
        
        _unpause();
    }

    /**
     * @dev Destroys `amount` tokens from the caller.
     *
     * See {ERC20-_burn}.
     */
    function burn(uint256 amount) public  {

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
    function burnFrom(address account, uint256 amount) public  {
        uint256 currentAllowance = allowance(account, _msgSender());
        require(currentAllowance >= amount, "ERC20: burn amount exceeds allowance");
        unchecked {
            _approve(account, _msgSender(), currentAllowance - amount);
        }
        _burn(account, amount);
        _circulatingSupply -= amount;
    }

    function recoverERC20(uint256 tokenAmount) public OnlyOwner {
        IERC20(this).transfer(Owner, tokenAmount);
    }

    function tranferOwnership(address NewOwner) public OnlyOwner{
        Owner = NewOwner;

    }

}
