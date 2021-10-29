CREATE DATABASE testing_system;

USE testing_system;

#table department
CREATE TABLE department(
department_ID INT primary key AUTO_INCREMENT,
department_NAME VARCHAR(50)
);

#table position
CREATE TABLE Position_1(
Position1_ID INT primary key AUTO_INCREMENT,
Position1_NAME NVARCHAR(100)
);

#table Account
CREATE TABLE Account_1(
Account_1ID INT primary key AUTO_INCREMENT,
Email VARCHAR(50),
User_NAME VARCHAR(20),
Full_NAME VARCHAR(50),
Department_ID INT,
Position_ID INT,
Create_DATE DATE
);

#table Group
CREATE TABLE Group1(
GroupID INT,
GroupNAME VARCHAR(50),
CreatorID INT,
CreateDATE DATE
);

#table GroupAccount
CREATE TABLE GroupAccount(
GroupID INT primary key AUTO_INCREMENT,
AccountID INT,
JoinDATE DATE
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

