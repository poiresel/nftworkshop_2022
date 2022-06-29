# nftworkshop_2022
sample code going over launching an ERC721 / ERC1155 token through a variety of mechanisms


# Set up steps

Install Metamask on your Chrome browser (https://metamask.io/)

# Level 0 

Basically Ethereum / Developer knowledge to start with

Multiple blockchains that one could deploy smart contracts to
Each has their own chain id: https://chnaainlist.us/connect/
One can switch between these chains in Metamask + can deploy contracts to
different chains based on what id is set. Different dapps support different chains.

# Level 1

Through remix

Navigate to https://remix.ethereum.org/

Step 1. Create an account in Metamask or just connect your wallet

Step 2. Add test coins to MetaMask
    DM me for some Rinkeby 

Step 3. Write a contract on Remix

Step 4. Using NFT.storage (IPFS) to add information to your NFT

Step 5. Mint an NFT

Step 6. Check your NFT and play with it

Step 7. Transfer it to a friend or just look at it in OpenSea

# Level 2

Download Node / Yarn / NPM / Hardhat
Locally develop workshop

Step 0 Clone repo and make sure you're in 
Step 1
```
npm install
```

Step 2 
```
npx hardhat
```

Add the below to `hardhat.config.js`
```
/**
* @type import('hardhat/config').HardhatUserConfig
*/
require("@nomiclabs/hardhat-ethers");
require('dotenv').config();
const { PRIVATE_KEY, MUMBAI_URL, POLYGON_URL } = process.env;
module.exports = {
  defaultNetwork: "PolygonMumbai",
  networks: {
    hardhat: {
    },
    PolygonMumbai: {
      url: MUMBAI_URL,
      accounts: [PRIVATE_KEY]
    },
    Polygon: {
      url: POLYGON_URL,
      accounts: [PRIVATE_KEY]
    }
  },
  solidity: {
    version: "0.8.12",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
}
```

Copy the info into the .env file at the root of the repor

Step 3

```
mkdir contracts assets scripts
```

Step 4: Add an image to the assets which will serve your NFT image

Step 5: Add the name of the file to the top of the store-asset script
```
node scripts/store-asset.mjs
```

Stepe 6

Update the smart contract with the name and make sure that name is updated in `scripts/deploy-contract.mjs`

Step 6:
```
npx hardhat run scripts/deploy-contract.mjs --network PolygonMumbai
```

Step 7
```
npx hardhat run scripts/mint-nft.mjs \--network PolygonMumbai
```

Step 8
Look for the deployed NFT: https://mumbai.polygonscan.com/