import { ethers } from "hardhat";

async function main() {
  const Lock = await ethers.getContractFactory("PuzzleWalletHack");
  const lock = await Lock.deploy({gasLimit: 5000000, value: ethers.utils.parseEther("0.001")});

  await lock.deployed();

  console.log("Lock with 1 ETH deployed to:", lock.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
