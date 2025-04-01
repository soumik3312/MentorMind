# MentorMind API Documentation

## Overview
MentorMind provides a blockchain-powered personalized learning platform. This API facilitates user authentication, learning progress tracking, reward management, and decentralized identity verification.

## Base URL
```
https://api.mentormind.io/v1
```

## Authentication
### User Login
```
POST /auth/login
```
**Request:**
```json
{
  "email": "user@example.com",
  "password": "securepassword"
}
```
**Response:**
```json
{
  "token": "jwt_token_here",
  "user": {
    "id": "1234",
    "name": "John Doe"
  }
}
```

### User Registration
```
POST /auth/register
```
**Request:**
```json
{
  "name": "John Doe",
  "email": "user@example.com",
  "password": "securepassword"
}
```
**Response:**
```json
{
  "message": "User registered successfully",
  "userId": "1234"
}
```

## Learning Module
### Get Course List
```
GET /courses
```
**Response:**
```json
[
  {
    "id": "101",
    "title": "Blockchain Basics",
    "description": "Learn the fundamentals of blockchain technology."
  }
]
```

### Enroll in a Course
```
POST /courses/enroll
```
**Request:**
```json
{
  "userId": "1234",
  "courseId": "101"
}
```
**Response:**
```json
{
  "message": "Successfully enrolled in Blockchain Basics."
}
```

## Rewards System
### Check Reward Balance
```
GET /rewards/{userId}
```
**Response:**
```json
{
  "balance": "50 MMR"
}
```

### Redeem Rewards
```
POST /rewards/redeem
```
**Request:**
```json
{
  "userId": "1234",
  "amount": "10"
}
```
**Response:**
```json
{
  "message": "Successfully redeemed 10 MMR."
}
```

## Identity Management
### Get User Identity
```
GET /identity/{userId}
```
**Response:**
```json
{
  "userId": "1234",
  "verified": true,
  "blockchainAddress": "0xAbC123..."
}
```

### Verify Identity
```
POST /identity/verify
```
**Request:**
```json
{
  "userId": "1234",
  "documentHash": "QmT12345xyz..."
}
```
**Response:**
```json
{
  "message": "Identity verified successfully."
}
```

## Error Handling
All API responses return standard HTTP status codes. Errors follow this structure:
```json
{
  "error": "Invalid credentials",
  "code": 401
}
```

## Rate Limiting
API requests are limited to **1000 requests/hour** per user.

---
For further inquiries, contact support@mentormind.io

