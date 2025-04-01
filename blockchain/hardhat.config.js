require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
    solidity: "0.8.19",
    networks: {
        hardhat: {},
        sepolia: {
            url: process.env.SEPOLIA_RPC_URL,
            accounts: [process.env.PRIVATE_KEY]
        },
        eduChain: {
            url: process.env.EDUCHAIN_RPC_URL,
            accounts: [process.env.PRIVATE_KEY]
        }
    },
    etherscan: {
        apiKey: process.env.ETHERSCAN_API_KEY
    }
};
