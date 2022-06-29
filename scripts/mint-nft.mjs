const CONTRACT_ADDRESS = "0x00"
const META_DATA_URL = "ipfs://XX"

async function mintNFT(contractAddress, metaDataURL) {
   const AttendeeNFT = await ethers.getContractFactory("AttendeeToken")
   const [owner] = await ethers.getSigners()
   await AttendeeNFT.attach(contractAddress).mintNFT(owner.address, metaDataURL)
   console.log("NFT minted to: ", owner.address)
}

mintNFT(CONTRACT_ADDRESS, META_DATA_URL)
   .then(() => process.exit(0))
   .catch((error) => {
       console.error(error);
       process.exit(1);
   });