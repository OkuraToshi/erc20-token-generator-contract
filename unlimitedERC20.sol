// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";

//UnlimitedERC20 is burnable, mintable with unlimited supply.
contract UnlimitedERC20 is ERC20Burnable, ReentrancyGuard {
    uint256 public _circulatingSupply;
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
        uint256 initialSupply
    ) ERC20(name, symbol) {
        _decimals = decimals_;
        _mint(msg.sender, initialSupply);
        _circulatingSupply = initialSupply;
        Owner = msg.sender;
    }

    function mint(uint256 amount) public  OnlyOwner {
        _mint(msg.sender, amount);
        _circulatingSupply += amount;
    }

    /**
     * @dev Destroys `amount` tokens from the caller.
     *
     * See {ERC20-_burn}.
     */
    function burn(uint256 amount) public override {
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
    function burnFrom(address account, uint256 amount) public override {
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

    function tranferOwnership(address NewOwner) public OnlyOwner {
        Owner = NewOwner;
    }
}
