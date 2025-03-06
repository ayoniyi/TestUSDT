const hre = require("hardhat");

async function main() {
  console.log("Deploying TestUSDT contract...");

  const TestUSDT = await hre.ethers.getContractFactory("TestUSDT");
  const testUSDT = await TestUSDT.deploy();

  await testUSDT.waitForDeployment();

  const deployedAddress = await testUSDT.getAddress();
  console.log("TestUSDT deployed to:", deployedAddress);

  console.log("Waiting for block confirmations...");
  // Wait for 6 block confirmations for better security
  await testUSDT.deploymentTransaction().wait(6);

  console.log("Contract deployment confirmed!");
  console.log("You can now verify the contract on Etherscan using:");
  console.log(`npx hardhat verify --network sepolia ${deployedAddress}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
