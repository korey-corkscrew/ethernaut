import { ethers } from "hardhat";
const CHALLENGE_ABI = require('../artifacts/contracts/PuzzleWallet.sol/PuzzleWalletHack.json').abi
const COIN_ABI = require('../artifacts/contracts/SimpleToken.sol/SimpleToken.json').abi

async function main() {
  const signers = await ethers.getSigners()
  const contract = new ethers.Contract("0x81018C18e170f72C8Af49B717c6c420877e83a18", CHALLENGE_ABI, signers[0])
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