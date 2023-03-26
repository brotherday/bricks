# Bricks

## Overview

Bricks is a marketplace for fractionalized NFTs. Users can list their NFTs on the market, fractionalize them, or purchase fractions of other NFTs.

## Solution

Bricks simplifies the process of fractionalizing NFTs via contracts, and buy and sell them at a fixed price. 

## MVP

The minimum viable product of Bricks achieves the following:

1. Fractionalizing ERC721 NFTs.
2. Allowing users to list the fractions from (1) at a fixed price which other users can purchase.
3. Allowing users to burn fractions to reassemble the original ERC721 NFT.
4. Allowing users to burn an ERC721 during fractionalizing, which removes the possibility of (3).

## Architecture

Bricks is made up of a proxy contract and multiple implementation contracts.

- Scaffold-Eth 2 is used as the development toolkit.

### Implementation contracts:
1. BricksCore.sol - Handles initialization, fractionalizing, reassembling, and burning of NFTs
2. Fractions.sol - The ERC20 contract which represents fractions that are gotten from the fractionalization process
3. Pool.sol - A simple marketplace for fractions
4. Vault.sol - Stores and transfers (if not burnt during fractionalizing) the original ERC721 when the users wishes to “reassemble” it. 

There is also an ERC165 for interface detection which prevents users from sending tokens that aren’t ERC721 to the platform for fractionalizing.

### dApp
- The dApp is built with Next.js, Ethers.js,  Wagmi and Chakra-UI

### Blockchain

Bricks is deployed on:

1. Ethereum Sepolina Testnet
2. Gnosis Chiado Testnet
3. Scroll Alpha Testnet
4. Polygon zkEVM Testnet

## Future Improvements

### Marketplace
Allow users to list fractions at a floor price which can be bid on by potential buyers.

### BricksCore
Accept more NFT standards e.g. ERC1155

### UI/UX
Improve the UI/UX to industry standard and better represent the product to end users
