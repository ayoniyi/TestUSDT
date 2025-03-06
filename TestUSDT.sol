// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title TestUSDT
 
 * This is a simplified version of USDT for testing purposes only
 */
contract TestUSDT is ERC20, ERC20Burnable, Ownable {
    // Decimals for USDT (real USDT uses 6 decimals)
    uint8 private constant _decimals = 6;
    
    /**
     * @dev Constructor that gives the msg.sender an initial supply of tokens
     */
    constructor() ERC20("Test USDT", "TUSDT") Ownable(msg.sender) {
        // Mint 1,000,000 TUSDT to the contract deployer (with 6 decimals)
        _mint(msg.sender, 1_000_000 * (10 ** _decimals));
    }
    
    /**
     * @dev Override the decimals function to return 6 instead of the default 18
     */
    function decimals() public pure override returns (uint8) {
        return _decimals;
    }
    
    /**
     * @dev Mint new tokens (only owner can call this function)
     * @param to The address that will receive the minted tokens
     * @param amount The amount of tokens to mint
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
    /**
     * @dev Function to allow users to get test tokens (faucet functionality)
     * Limited to 1000 tokens per request to prevent abuse
     */
    function requestTokens() external {
        uint256 amount = 1000 * (10 ** _decimals); // 1000 TUSDT
        _mint(msg.sender, amount);
    }
} 