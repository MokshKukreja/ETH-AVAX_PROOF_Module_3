# ETH-AVAX_PROOF_Module_3
Module 3 Project: Token Creation and Minting

## MyToken Smart Contract

MyToken is a basic ERC-20 token implemented in Solidity. It includes functionalities for transferring tokens, managing allowances, minting new tokens, and burning existing ones.

## Features

- **Token Name**: Specify the token's name at the time of deployment.
- **Token Symbol**: Define the token's symbol when deploying the contract.
- **Decimals**: Set the number of decimal places for the token.
- **Total Supply**: Initialize the total supply of tokens upon deployment.
- **Owner**: The deployer of the contract is designated as the initial owner.

## Functions

### `transfer`

Send tokens from the sender's account to another address.

### `transfer_from`

Transfer tokens from one address to another using the allowance system.

### `mint`

Generate new tokens and assign them to a specific address. Only the contract owner can perform this action.

### `burn`

Remove tokens from the sender's account, effectively reducing the total supply.

## Events

- **Transfer**: Emitted when tokens are transferred between addresses.
- **Mint**: Emitted when new tokens are created.
- **Burn**: Emitted when tokens are destroyed.

## Usage

1. **Deployment**: Deploy the contract with the chosen token details.
2. **Transfers**: Use `transfer` to send tokens to another address.
3. **Token Management**: The owner can use `mint` to create new tokens, and any holder can use `burn` to reduce the token supply.
