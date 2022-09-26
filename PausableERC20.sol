// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract PausableERC20 is ERC20Pausable, ReentrancyGuard {
    uint256 public _totalsupply;
    address Owner;
    uint8 public _decimals;
    modifier OnlyOwner() {
        require(msg.sender == Owner, "Caller is Not an Owner");
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
        Owner = msg.sender;
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
    function burn(uint256 amount) public {

        _burn(_msgSender(), amount);
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
    }

    function tranferOwnership(address NewOwner) public OnlyOwner{
        
        Owner = NewOwner;
    }

}
