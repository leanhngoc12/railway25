CREATE DATABASE Testing_system_123;

USE Testing_system_123;

#table department
CREATE TABLE Department(
DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
departmentName VARCHAR(50)
);

#table position
CREATE TABLE `Position`(
PositionID INT AUTO_INCREMENT PRIMARY KEY,
PositionName VARCHAR(50)
);

#table Account
CREATE TABLE `Account`(
AccountID INT AUTO_INCREMENT PRIMARY KEY,
Email VARCHAR(50) NOT NULL,
UserName VARCHAR(50) NOT NULL,
FullNAME VARCHAR(100),
DepartmentID INT,
PositionID INT,
CreatDate DATE,
CONSTRAINT lien_ket_1 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
CONSTRAINT lien_ket_2 FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

#table Group
CREATE TABLE `Group`(
GroupID INT AUTO_INCREMENT PRIMARY KEY,
GroupName VARCHAR(50),
CreatorID INT,
CreateDate DATE,
CONSTRAINT lien_ket_3 FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

#table GroupAccount
CREATE TABLE GroupAccount(
GroupID INT AUTO_INCREMENT NOT NULL,
AccountID INT NOT NULL,
JoinDATE DATE DEFAULT NOW(),
PRIMARY KEY 
CONSTRAINT lien_ket_4 FOREIGN KEY ()
);

#table TypeQuestion
CREATE TABLE TypeQuestion(
TypeID INT primary key AUTO_INCREMENT,
TypeNAME VARCHAR(20)
);

#table CategoryQuestion(
CREATE TABLE CategoryQuestion(
CategoryID INT primary key AUTO_INCREMENT,
CategoryNAME VARCHAR(50)
);


#table Question
CREATE TABLE Question2(
QuestionID INT primary key AUTO_INCREMENT,
Content NVARCHAR(50),
CategoryID INT,
TypeID INT,
CreatorID INT,
CreateDATE DATE
);

#table answer
CREATE TABLE Answer1(
AnswerID INT primary key AUTO_INCREMENT,
Content VARCHAR(50),
QuestionID INT,
Iscorrect VARCHAR(20)
);

#table exam
CREATE TABLE Exam(
ExamID INT primary key AUTO_INCREMENT,
Code1 INT,
Title VARCHAR(20),
CategoryID INT,
Duration TIME,
CreatorID INT,
CreatorDATE DATE
);

#table ExamQuestion
CREATE TABLE ExamQuestion(
ExamID INT,
QuestionID INT
);
