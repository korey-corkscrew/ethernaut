import { ethers } from "hardhat";

async function main() {
  const CoinFlip = await ethers.getContractFactory("CoinFlipHack");
  const coinFlip = await CoinFlip.deploy({gasLimit: 1000000});

  await coinFlip.deployed();

  console.log("Coin Flip Hack deployed to:", coinFlip.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
