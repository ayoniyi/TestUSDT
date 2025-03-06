# TestUSDT Contract

A test USDT (Tether) implementation for the Sepolia testnet, designed for testing and development purposes. This contract provides a simplified version of USDT with built-in faucet functionality.

## Deployed Contract

- **Network**: Sepolia Testnet
- **Contract Address**: `0x99c05dF1a35F4C5656Ea042d1caEfcD4F97aEDb4`
- **Verify Status**: Verified on Etherscan
- **Etherscan Link**: [View on Etherscan](https://sepolia.etherscan.io/address/0x99c05dF1a35F4C5656Ea042d1caEfcD4F97aEDb4#code)

## Features

- **ERC20 Compliant**: Implements the standard ERC20 interface
- **Burnable**: Includes token burning functionality through ERC20Burnable
- **Ownable**: Implements ownership controls for administrative functions
- **6 Decimals**: Matches real USDT's decimal places (6 instead of standard 18)
- **Built-in Faucet**: Allows users to request test tokens
- **Minting Capability**: Owner can mint additional tokens

## Contract Details

### Token Information

- **Name**: Test USDT
- **Symbol**: TUSDT
- **Decimals**: 6
- **Initial Supply**: 1,000,000 TUSDT

### Key Functions

#### `requestTokens()`

- Public function that allows anyone to request test tokens
- Mints 1,000 TUSDT to the caller's address
- No cooldown period (for simplicity)
- Usage: `contract.requestTokens()`

#### `mint(address to, uint256 amount)`

- Admin function to mint new tokens
- Only callable by contract owner
- Parameters:
  - `to`: Recipient address
  - `amount`: Amount to mint (in base units)
- Usage: `contract.mint(recipientAddress, amount)`

#### `burn(uint256 amount)` and `burnFrom(address account, uint256 amount)`

- Inherited from ERC20Burnable
- Allows token holders to burn their tokens
- `burnFrom` requires prior approval

## Development Setup

1. Clone the repository

```bash
git clone <repository-url>
cd <repository-name>
```

2. Install dependencies

```bash
# Install base dependencies
npm install

# Install required Hardhat plugins and dependencies
npm install --save-dev "@nomicfoundation/hardhat-chai-matchers@^2.0.0" "@nomicfoundation/hardhat-ethers@^3.0.0" "@nomicfoundation/hardhat-ignition-ethers@^0.15.0" "@nomicfoundation/hardhat-network-helpers@^1.0.0" "@nomicfoundation/hardhat-verify@^2.0.0" "@typechain/ethers-v6@^0.5.0" "@typechain/hardhat@^9.0.0" "@types/chai@^4.2.0" "@types/mocha@>=9.1.0" "chai@^4.2.0" "ethers@^6.4.0" "hardhat-gas-reporter@^1.0.8" "solidity-coverage@^0.8.1" "ts-node@>=8.0.0" "typechain@^8.3.0" "typescript@>=4.5.0"
```

3. Create .env file with required variables

```bash
SEPOLIA_RPC_URL=your_sepolia_endpoint    # Get from Alchemy
PRIVATE_KEY=your_wallet_private_key      # Your wallet private key (without 0x)
ETHERSCAN_API_KEY=your_etherscan_api_key # Get from Etherscan
```

4. Compile the contract

```bash
# Clean and recompile
npx hardhat clean
npx hardhat compile
```

5. Deploy to Sepolia

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

6. Verify on Etherscan

```bash
npx hardhat verify --network sepolia <DEPLOYED_CONTRACT_ADDRESS>
```

## Project Structure

```
├── contracts/
│   └── TestUSDT.sol    # Main contract file
├── scripts/
│   └── deploy.js       # Deployment script
├── .env                # Environment variables (git-ignored)
├── hardhat.config.js   # Hardhat configuration
└── README.md          # This file
```

## Interacting with the Contract

### Using Etherscan

1. Visit the contract on [Sepolia Etherscan](https://sepolia.etherscan.io/address/0x99c05dF1a35F4C5656Ea042d1caEfcD4F97aEDb4#code)
2. Connect your wallet
3. Use the "Write Contract" tab to interact with functions
4. Use the "Read Contract" tab to view contract state

### Using Web3/Ethers.js

```javascript
const contractAddress = "0x99c05dF1a35F4C5656Ea042d1caEfcD4F97aEDb4";
const TestUSDT = await ethers.getContractAt("TestUSDT", contractAddress);

// Request tokens from faucet
await TestUSDT.requestTokens();

// Check balance
const balance = await TestUSDT.balanceOf(userAddress);
```

## Deployment

The contract is designed to be deployed on the Sepolia testnet. After deployment:

1. The deploying address becomes the contract owner
2. 1,000,000 TUSDT is minted to the owner's address
3. The faucet functionality is immediately available to all users

### Verify Contract

After deployment, verify the contract on Etherscan:

```bash
npx hardhat verify --network sepolia <DEPLOYED_CONTRACT_ADDRESS>
```

## Security Considerations

This is a TEST token contract intended for development purposes only. It includes features that would not be suitable for a production environment:

- Unlimited faucet with no cooldown
- Simple minting permissions
- No pause functionality
- No blacklist functionality
- No transfer restrictions

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Dependencies

- OpenZeppelin Contracts v5.0.0
  - @openzeppelin/contracts/token/ERC20/ERC20.sol
  - @openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol
  - @openzeppelin/contracts/access/Ownable.sol
