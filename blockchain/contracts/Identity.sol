// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Identity {
    struct User {
        string name;
        string email;
        string role; // "student" or "educator"
        bool isVerified;
    }

    mapping(address => User) public users;
    mapping(address => bool) public admins;

    event UserRegistered(address indexed user, string name, string role);
    event UserVerified(address indexed user, bool isVerified);
    event AdminAdded(address indexed admin);

    modifier onlyAdmin() {
        require(admins[msg.sender], "Only admin can perform this action");
        _;
    }

    constructor() {
        admins[msg.sender] = true; // Contract deployer is the first admin
    }

    function registerUser(string memory _name, string memory _email, string memory _role) public {
        require(bytes(users[msg.sender].name).length == 0, "User already registered");
        require(keccak256(bytes(_role)) == keccak256(bytes("student")) || keccak256(bytes(_role)) == keccak256(bytes("educator")), "Invalid role");
        
        users[msg.sender] = User(_name, _email, _role, false);
        emit UserRegistered(msg.sender, _name, _role);
    }

    function verifyUser(address _user) public onlyAdmin {
        require(bytes(users[_user].name).length > 0, "User not registered");
        users[_user].isVerified = true;
        emit UserVerified(_user, true);
    }

    function addAdmin(address _admin) public onlyAdmin {
        admins[_admin] = true;
        emit AdminAdded(_admin);
    }

    function getUser(address _user) public view returns (string memory, string memory, string memory, bool) {
        require(bytes(users[_user].name).length > 0, "User not found");
        User memory user = users[_user];
        return (user.name, user.email, user.role, user.isVerified);
    }
}
