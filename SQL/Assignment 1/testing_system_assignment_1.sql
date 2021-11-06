DROP DATABASE IF EXISTS testing_system_assignment_1;
CREATE DATABASE testing_system_assignment_1;
USE testing_system_assignment_1;

CREATE TABLE Department (
DepartmentID INT,
 DepartmentName VARCHAR(50)
);

CREATE TABLE Position (
PositionID INT,
PositionName VARCHAR(50)
);

CREATE TABLE Acconunt (
AcconuntID INT,
Email VARCHAR(50),
Username VARCHAR(50),
FullName VARCHAR(50),
DepartmentID VARCHAR(50),
PositionID VARCHAR(50),
CreateDate DATE
);

CREATE TABLE Groupx (
GroupID INT,
GroupName VARCHAR(50),
CreatorID VARCHAR(50),
CreateDate DATE
);

CREATE TABLE GroupAccount (
GroupID INT,
AccountID VARCHAR(50),
JoinDate DATE
);

CREATE TABLE TypeQuestion (
TypeID INT,
TypeName VARCHAR(50)
);

CREATE TABLE CategoryQuestion (
CategoryID INT,
CategotyName VARCHAR(50)
);

CREATE TABLE Question (
QuestionID INT,
Content VARCHAR(50),
CategoryID VARCHAR(50),
TypeID VARCHAR(50),
CreatorID VARCHAR(50),
CreateDate DATE
);

CREATE TABLE Answer (
AnswerID INT,
Content VARCHAR(50),
QuestionID INT,
isCorrect VARCHAR(50)
);

CREATE TABLE Exam (
ExamID INT,
ExamCode INT,
Title VARCHAR(50),
CategoryID INT,
Duration INT,
CreatorID INT,
CreateDate DATE
);

CREATE TABLE ExamQuestion (
ExamID INT,
QuestionID INT
);