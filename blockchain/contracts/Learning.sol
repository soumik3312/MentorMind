// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Learning {
    struct Course {
        uint256 id;
        string title;
        string description;
        address creator;
        uint256 price;
        bool isActive;
    }

    struct Enrollment {
        address student;
        uint256 courseId;
        bool completed;
    }

    mapping(uint256 => Course) public courses;
    mapping(address => uint256[]) public userCourses;
    mapping(address => mapping(uint256 => Enrollment)) public enrollments;
    
    uint256 public nextCourseId;
    address public owner;

    event CourseCreated(uint256 courseId, string title, address creator);
    event CourseEnrolled(address student, uint256 courseId);
    event CourseCompleted(address student, uint256 courseId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    modifier onlyCourseCreator(uint256 _courseId) {
        require(courses[_courseId].creator == msg.sender, "Only course creator can modify this");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function createCourse(string memory _title, string memory _description, uint256 _price) public {
        courses[nextCourseId] = Course(nextCourseId, _title, _description, msg.sender, _price, true);
        emit CourseCreated(nextCourseId, _title, msg.sender);
        nextCourseId++;
    }

    function enrollInCourse(uint256 _courseId) public payable {
        require(courses[_courseId].isActive, "Course is not active");
        require(msg.value == courses[_courseId].price, "Incorrect payment amount");
        require(enrollments[msg.sender][_courseId].courseId != _courseId, "Already enrolled");
        
        enrollments[msg.sender][_courseId] = Enrollment(msg.sender, _courseId, false);
        userCourses[msg.sender].push(_courseId);
        emit CourseEnrolled(msg.sender, _courseId);
    }

    function completeCourse(uint256 _courseId) public {
        require(enrollments[msg.sender][_courseId].courseId == _courseId, "Not enrolled in this course");
        require(!enrollments[msg.sender][_courseId].completed, "Course already completed");
        
        enrollments[msg.sender][_courseId].completed = true;
        emit CourseCompleted(msg.sender, _courseId);
    }

    function getCourse(uint256 _courseId) public view returns (string memory, string memory, address, uint256, bool) {
        Course memory course = courses[_courseId];
        return (course.title, course.description, course.creator, course.price, course.isActive);
    }
}
