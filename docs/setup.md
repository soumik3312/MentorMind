# MentorMind Setup Guide

## Prerequisites
Ensure you have the following installed before proceeding:
- Node.js (v18+)
- Python (v3.9+)
- PostgreSQL (v14+)
- Hardhat (latest)
- MetaMask Wallet
- ENV File with required credentials

## Backend Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/mentormind.git
   cd mentormind/backend
   ```
2. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```
3. Set up the environment file:
   ```sh
   cp .env.example .env
   ```
4. Apply database migrations:
   ```sh
   python manage.py migrate
   ```
5. Start the backend server:
   ```sh
   uvicorn main:app --reload
   ```

## Frontend Setup
1. Navigate to the frontend directory:
   ```sh
   cd ../frontend
   ```
2. Install dependencies:
   ```sh
   npm install
   ```
3. Start the development server:
   ```sh
   npm run dev
   ```

## Blockchain Setup
1. Navigate to the blockchain directory:
   ```sh
   cd ../blockchain
   ```
2. Install dependencies:
   ```sh
   npm install
   ```
3. Compile smart contracts:
   ```sh
   npx hardhat compile
   ```
4. Deploy contracts to testnet:
   ```sh
   npx hardhat run scripts/deploy.js --network sepolia
   ```

## Running Tests
- Backend:
  ```sh
  pytest
  ```
- Frontend:
  ```sh
  npm run test
  ```
- Blockchain:
  ```sh
  npx hardhat test
  ```

## Final Steps
- Ensure all services are running.
- Access the frontend at `http://localhost:3000`.
- Verify blockchain transactions on the explorer.
- Test the API using Postman or Swagger UI.

For further assistance, contact support@mentormind.io

