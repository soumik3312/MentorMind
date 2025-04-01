# MentorMind Smart Contracts Documentation

## Overview
MentorMind leverages blockchain technology to provide a decentralized education ecosystem. The smart contracts handle identity verification, learning progress tracking, and reward distribution using an on-chain mechanism.

## Contracts Overview

### **1. Identity.sol** (Decentralized Identity Management)
**Purpose:**
- Stores and verifies user identities on the blockchain.
- Links users' on-chain identities with learning progress.

**Key Functions:**
- `registerUser(address _user, string memory _name)`: Registers a new user.
- `verifyUser(address _user)`: Marks a user as verified.
- `getUserDetails(address _user)`: Returns user identity details.

### **2. Learning.sol** (On-Chain Learning Progress Tracking)
**Purpose:**
- Records course completions and learning achievements.
- Tracks progress linked to blockchain-based credentials.

**Key Functions:**
- `enrollCourse(address _user, uint _courseId)`: Enrolls a user in a course.
- `completeCourse(address _user, uint _courseId)`: Marks a course as completed.
- `getUserCourses(address _user)`: Retrieves a list of courses for a user.

### **3. Reward.sol** (Token-Based Reward System)
**Purpose:**
- Issues and manages reward tokens for completed learning activities.
- Enables token redemption for educational incentives.

**Key Functions:**
- `issueReward(address _user, uint _amount)`: Awards tokens to a user.
- `redeemReward(address _user, uint _amount)`: Allows users to redeem tokens.
- `checkBalance(address _user)`: Returns the token balance of a user.

## Deployment Steps
1. Compile the contracts:
   ```sh
   npx hardhat compile
   ```
2. Deploy contracts to the testnet:
   ```sh
   npx hardhat run scripts/deploy.js --network sepolia
   ```
3. Verify contract deployment:
   ```sh
   npx hardhat verify --network sepolia <contract_address>
   ```

## Interacting with Smart Contracts
- Use `Ethers.js` or `Web3.js` to interact with the deployed contracts.
- Frontend calls will be made through a `smartContractService.js` file that connects to the blockchain.

## Security & Best Practices
- Contracts use OpenZeppelin libraries for security.
- Proper access control (`onlyOwner`, `onlyVerifiedUser`) is enforced.
- Data is stored efficiently using mappings.

For any issues, contact support@mentormind.io.