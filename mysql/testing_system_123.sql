DROP DATABASE IF EXISTS Testing_system_123;
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
JoinDATE DATE,
PRIMARY KEY (GroupID,AccountID),
CONSTRAINT lien_ket_4 FOREIGN KEY (GroupID) REFERENCES`Account`(AccountID)
);

#table TypeQuestion
CREATE TABLE TypeQuestion(
TypeID INT AUTO_INCREMENT PRIMARY KEY,
TypeNAME VARCHAR(50) NOT NULL
);

#table CategoryQuestion(
CREATE TABLE CategoryQuestion(
CategoryID INT AUTO_INCREMENT PRIMARY KEY,
CategoryName VARCHAR(50) NOT NULL
);


#table Question
CREATE TABLE Question(
QuestionID INT AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(100),
CategoryID INT NOT NULL,
TypeID INT,
CreatorID INT NOT NULL,
CreateDATE DATE,
CONSTRAINT lien_ket_6 FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
CONSTRAINT lien_ket_7 FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
CONSTRAINT lien_ket_8 FOREIGN KEY (CreatorID) REFERENCES`Account`(AccountID)
);

#table answer
CREATE TABLE Answer(
AnswerID INT AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(100),
QuestionID INT NOT NULL,
Iscorrect VARCHAR(20),
CONSTRAINT lien_ket_9 FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

#table exam
CREATE TABLE Exam(
ExamID INT AUTO_INCREMENT PRIMARY KEY,
`Code` INT NOT NULL,
Title VARCHAR(20),
CategoryID INT,
Duration INT,
CreatorID INT,
CreateDate DATE,
CONSTRAINT lien_ket_10 FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
CONSTRAINT lien_ket_11 FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

#table ExamQuestion
CREATE TABLE ExamQuestion(
ExamID INT NOT NULL,
QuestionID INT NOT NULL,
PRIMARY KEY(ExamID,QuestionID),
CONSTRAINT lien_ket_12 FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
CONSTRAINT lien_ket_13 FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE
);

INSERT INTO Department(DepartmentName) VALUES ('Sale'),
                                              ('ke toan'),
                                              ('bao ve'),
                                              ('quang cao'),
                                              ('thu ki'),
                                              ('giam doc'),
                                              ('tai chinh'),
                                              ('ky thuat'),
                                              ('nhan su'),
                                              ('mkt'),
                                              ('truong phong');
INSERT INTO Position (PositionName) VALUES ('Huyen'),
										   ('trang'),
                                           ('ngoc'),
                                           ('dat');
INSERT INTO `Account`(Email, UserName, FullName, DepartmentID, PositionID, CreatDate)
VALUES ('hoang1@gmail.com','hoang1','dong huy hoang','5','1','2021-3-8'),
	   ('hoa2@gmail.com','hoa2','le thi hoa','1','2','2021-10-20'),
       ('hong3@gmail.com','hong3','le thuy hong','2','2','2021-8-22'),
       ('hanh4@gmail.com','hanh4','do thi hanh','3','4','2021-4-14'),
       ('ha5@gmail.com','ha5','trinh manh ha','4','4','2021-12-20'),
       ('huyen6@gmail.com','huyen6','le thi huyen','6','3','2021-8-16'),
       ('hac7@gmail.com','hac7','la thu hac','2','2','2021-3-5'),
       ('han8@gmail.com','han8','do thuy han','8','1','2021-2-14'),
       ('hoan9@gmail.com','hoan9','dong do hoan','2','2','2021-6-12'),
       ('hoc10@gmail.com','hoc10','le huy hoc','10','1','2021-5-6'),
       ('ho11@gmail.com','ho11','nguyen thuy ho','10','1','2021-4-6'),
       ('hue12@gmail.com','hue12','le thu hue','10','1','2021-7-2');

select * from `Account`;

INSERT INTO `Group`(GroupName,CreatorID,CreateDate)
VALUES ('hoa nhai','5','2021-1-3'),
       ('hoa hong','1','2021-5-7'),
       ('hoa lan','3','2021-4-12'),
       ('hoa sen','2','2021-6-11'),
       ('hoa hoe','4','2021-9-3'),
       ('hoa cuc','7','2021-12-21'),
       ('hoa mau don','9','2021-2-5'),
       ('hoa sung','8','2021-8-9'),
       ('hoa hue','6','2021-9-10'),
       ('hoa sua','10','2021-10-11');
       
INSERT INTO `GroupAccount`(GroupID,AccountID,JoinDate)
VALUES (1,1,'2020-5-6'),
	   (1,2,'2019-8-22'),
       (3,3,'2020-9-17'),
       (3,1,'2020-4-13'),
       (5,5,'2020-8-21'),
       (1,3,'2020-3-18'),
       (1,7,'2020-9-17'),
       (8,3,'2020-9-4'),
       (1,9,'2020-5-7'),
       (10,10,'2020-2-1');
       
INSERT INTO TypeQuestion (TypeName) VALUES ('LOVE'),('HATE');
INSERT INTO CategoryQuestion (CategoryNAme)
VALUES ('anh'),
	   ('doi'),
       ('em'),
       ('duoc'),
       ('khong'),
       ('neu'),
       ('khong duoc'),
       ('thi'),
       ('thoi'),
       ('haha');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUES ('hoi anh',1,'1','2','2020-8-23'),
	   ('hoi doi',10,'2','2','2020-8-24'),
       ('hoi em',9,'2','3','2020-8-25'),
       ('hoi duoc',6,'1','4','2020-8-22'),
       ('hoi khong',5,'1','5','2020-8-12'),
       ('hoi neu',3,'2','6','2020-8-22'),
       ('hoi ko duoc',2,'1','7','2020-8-17'),
       ('hoi thi',8,'1','8','2020-8-14'),
       ('hoi thoi',4,'2','9','2020-8-13'),
       ('hoi haha',7,'1','10','2020-8-12');

INSERT INTO Answer(Content,QuestionID,Iscorrect) 
VALUES ('TL1',1,0),
	   ('TL2',1,1),
       ('TL3',1,0),
       ('TL4',1,1),
       ('TL5',2,1),
       ('TL6',3,1),
       ('TL7',4,0),
       ('TL8',8,0),
       ('TL9',9,1),
       ('TL10',10,1);
INSERT INTO Exam(`Code`,Title,CategoryID,Duration,CreatorID,CreateDate)
VALUES ('001','thi1',2,45,'5','2019-08-19'),
       ('002','thi2',1,60,'2','2019-04-16'),
       ('003','thi3',10,60,'3','2019-4-13'),
       ('004','thi4',9,70,'1','2020-08-01'),
       ('005','thi5',8,120,'4','2019-05-18'),
       ('006','thi6',7,45,'6','2019-05-18'),
       ('007','thi7',3,90,'7','2019-08-01'),
       ('008','thi8',6,45,'8','2019-07-12'),
       ('009','thi9',4,60,'9','2019-07-12'),
	   ('0010','thi10',10,60,'10','2019-06-12');
INSERT INTO ExamQuestion(ExamID,QuestionID)
VALUES (1,3),
	   (2,10),
       (3,4),
       (4,5),
       (5,6),
       (6,10),
       (7,1),
	   (8,7),
       (9,9),
	   (10,5);
 #2.lay ra ID cua cac phong ban
SELECT * FROM Department;
#3. lay ra Id cua phong ban sale
SELECT DepartmentID FROM Department WHERE DepartmentName='sale';
#4.lay ra thong tin account cos full name dai nhat
SELECT * FROM `Account` WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM`Account`)
ORDER BY FullName DESC;
#5.Account co full name dai nhat va thuoc phong ban ID=3
SELECT * FROM `Account` WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM`Account`) and DepartmentID=3;
#6.lay ten group tao trc ngay 29-12-2019
SELECT GroupName FROM `Group` WHERE CreateDate<'2019-12-20';
#7.lay ra ID cua Question co >=4 cau tl
#SELECT QuestionID em khong biet lam :(....................................
#8 lay ra de thi co thoi gisn >=60 dc tao trc ngay 20-12-2019
SELECT `Code` FROM Exam WHERE Duration >=60 and CreateDate <'2019-12-20';
#9 lay ra 5 group dc tao gan day nhat
SELECT CreateDate,GroupID FROM `Group` ORDER BY CreateDate DESC LIMIT 5;
#10 dem so nv thuoc department co id =2
SELECT DepartmentID FROM `Account` WHERE DepartmentID=2;
#11 lay ra nv co ten bat dau bang chu D va kthuc bang chu o
SELECT FullName FROM `Account` WHERE (fullName) LIKE 'D%o';
#12 xoa tat ca cac exam dc tao trc ngay 20-12-2019
SELECT * FROM Exam;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Exam WHERE CreateDate <'2019-12-20';
#13 xoa tat ca cac question co nd bat dau bang tu cau hoi
DELETE FROM `Question` WHERE (Content)='câu hỏi';
#14 update thong tin account co id=5 thanh ten nguyen ba loc va mail thanh ..
UPDATE `Account` SET FullName = 'Nguyễn Bá Lộc', 
                     Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;
#15 up account co id = 5 se thuoc group co id =4
UPDATE `GroupAccount` SET AccountID=5 WHERE GroupID = 4;