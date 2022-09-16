import { ethers } from "hardhat";
const CHALLENGE_ABI = require('../artifacts/contracts/Shop.sol/ShopHack.json').abi
const COIN_ABI = require('../artifacts/contracts/SimpleToken.sol/SimpleToken.json').abi

async function main() {
  const signers = await ethers.getSigners()
  const contract = new ethers.Contract("0x3f940224A0a9cDe88CF37BDe062c455266f00d77", CHALLENGE_ABI, signers[0])
  const coin = new ethers.Contract("0x60357836CD4e86Ac03Dc57C0d330D0CA820498F8", COIN_ABI, signers[0])
//   await coin.approve(contract.address, ethers.constants.MaxUint256)
  await contract.exec({gasLimit: 1000000})
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});