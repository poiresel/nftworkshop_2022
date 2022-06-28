# nftworkshop_2022
sample code going over launching an ERC721 / ERC1155 token different ways

## Goal of this workshop

Everyone gets a hands-on experience creating, minting, and viewing NFTs
* Creating an NFT using OpenZeppelin 
Everyone is able to mint at least one NFT of their own
Know how to view the created NFT in an NFT marketplace
SendSafely for sending over the .env file


# Set up steps

Install Metamask on your Chrome browser (https://metamask.io/)
Git installed (optional)
Node (v14+, v16+)
NPM (8.1.2)

Global NPM Packages to install
```
npm install --global yarn ganache ganache-cli truffle

```

Alchemy API Key (Rinkeby extra ETH)
Vigil Matic API Key (Matic Access)

Dependencies being used
OpenZeppelin [https://github.com/OpenZeppelin/openzeppelin-contracts]



# Level 0 

Basically Ethereum / Developer knowledge to start with

Multiple blockchains that one could deploy smart contracts to
Each has their own chain id: https://chnaainlist.us/connect/
One can switch between these chains in Metamask + can deploy contracts to
different chains based on what id is set. Different dapps support different chains.

# Level 1: Basic NFT Deployment

Through OpenZeppelin Wizard + Remix

Step 1: Navigate to https://wizard.openzeppelin.com/

Step 2: Choose the ERC721 tab

Step 3: 
Step 1. Create an account in Metamask or just connect your wallet (screenshot)

Step 2. Add test coins to MetaMask
    DM me for some Rinkeby 

Step 3. Write a contract on Remix

- Delete all the existing contracts that exist in the contracts/ folder
- Create a new file with whatever you'd like to name the NFT

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BestNFTEvery is ERC721 {

    constructor() ERC721("BestNFTEvery", "BEST") {
    }

}
```

Step 4. Using NFT.storage (IPFS) to add information to your NFT

Step 5. Mint an NFT

Step 6. Check your NFT and play with it

Step 7. Transfer it to a friend or just look at it in OpenSea

# Level 2

You'll need git (opens new window), node.js (opens new window), and yarn (opens new window)installed to follow along with this tutorial.

Download Truffle / Ganache / Yarn / NPM 
Locally develop workshop

Step 1: 
Step 2: Deploy a smart contract to Polygon leveraging Infura
Step 3: Store NFT metadata on IPFS using Pinata
Step 4: Mint an NFT that is listed on OpenSea
Step 5: Query your NFT contract using The Graph


# Level 3 

Tie in Metadata (NFT.storage)

-- Minting and distributed participate  ( wallet addresses )
-- import your own NFT to your wallet

# Level 4 

Tatum - create marketplace



# Going to use truffle in this 
npm install --save-dev truffle