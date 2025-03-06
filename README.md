# TestUSDT Contract

A test USDT (Tether) implementation for the Sepolia testnet, designed for testing and development purposes. This contract provides a simplified version of USDT with built-in faucet functionality.

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
npm install
```

3. Create .env file with required variables

```bash
SEPOLIA_RPC_URL=your_sepolia_endpoint
PRIVATE_KEY=your_wallet_private_key
ETHERSCAN_API_KEY=your_etherscan_api_key
```

4. Compile the contract

```bash
npx hardhat compile
```

5. Run tests (if available)

```bash
npx hardhat test
```

6. Deploy to Sepolia

```bash
npx hardhat run scripts/deploy.js --network sepolia
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
