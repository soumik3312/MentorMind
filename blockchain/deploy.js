const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners(); // Get deployer address

    console.log("Deploying RewardToken with account:", deployer.address);

    const RewardToken = await ethers.getContractFactory("RewardToken");
    const rewardToken = await RewardToken.deploy(deployer.address); // Pass owner address

    await rewardToken.deployed();
    console.log("RewardToken deployed at:", rewardToken.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
