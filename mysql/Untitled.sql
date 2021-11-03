CREATE DATABASE demo_bai34_31Oct;
USE demo_bai34_31Oct;

CREATE TABLE Department(
			DepartmentID		INT PRIMARY KEY AUTO_INCREMENT,
			DepartmentName		VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE `Position`(
			PositionID			INT PRIMARY KEY AUTO_INCREMENT,
			PositionName		VARCHAR(100) UNIQUE NOT NULL 
);

-- Tao Table 3: Account
CREATE TABLE `Account`(
			AccountID			INT PRIMARY KEY AUTO_INCREMENT,
			Email				VARCHAR(50) UNIQUE,
			Username			VARCHAR(30) NOT NULL,
			FullName			NVARCHAR(50) NOT NULL,
			DepartmentID		INT NOT NULL, 
			PositionID			INT NOT NULL,
			CreateDate			DATETIME DEFAULT NOW()
);
Alter table `Account` add constraint lk_01 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);
Alter table `Account` add constraint lk_02 FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID);

INSERT INTO Department(DepartmentName)
VALUES				('Hành chính'),
					('Tổng hợp'),
					('Kinh doanh'),
                    ('Kĩ thuật'),
                    ('Sale'),
                    ('Maketing'),
                    ('Nhân sự'),
                    ('Công nghệ thông tin'),
                    ('Mạng');
                    
INSERT INTO `Position`(PositionName)
VALUES				('Nhân viên'),
					('Trưởng phòng'),
                    ('Phó phòng'),
                    ('Giám đốc'),
                    ('Quản lý nhân sự'),
                    ('Trưởng nhóm'),
                    ('Phó nhóm')
                   ;
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES				('LETHUANDUC@gmail.com','LeDuc','LeThuanDuc',1,3,'2019/03/12'),
					('VOHOHONGLOAN@gmail.com','VoLoan','VoHoHongLoan',2,2,'2018/05/12'),
                    ('NGUYENNGOCHUY@gmail.com','NguyenHuy','NguyenNgocHuy',3,1,'2019/12/09'),
                    ('VOKHOIHONGNHUNG@gmail.com','VoNhung','VoKhoiHongNhung',1,3,'2017/01/30'),
                    ('DANGHONHATTHACH@gmail.com','DangThach','DangHoNhatThach',1,1,'2019/12/03'),
                    ('VOVANTHANG@gmail.com','VoThang','VoVanThang',2,3,'2020/01/01'),
                    ('HOANGMINHTIEN@gmail.com','HoangTien','HoangMinhTien',3,1,'2019/07/02'),
                    ('DANGHOAIAN@gmail.com','DangAn','DangHoaiAn',3,4,'2019/03/16'),
                    ('BUITHIHIENNA@gmail.com','BuiNa','BuiThiHienNa',4,2,'2019/08/09'),
                    ('LEPHANMINHQUAN@gmail.com','LeQuan','LePhanMinhQuan',4,1,'2019/09/25'),
                    ('PHAMTHINGOCTRANG@gmail.com','PhamTrang','PhamThiNgocTrang',5,1,'2019/05/05'),
                    ('VANTHUTRUNG@gmail.com','VanTrung','VanThuTrung',3,4,'2019/10/02'),
                    ('DINHTHANHTUONGVY@gmail.com','DinhVy','DinhThanhTuongVy',3,2,'2019/11/02'),
                    ('PHANTHAIBACH@gmail.com','PhanBach','PhanThaibach',4,1,'2019/03/30'),
                    ('LEHOANGBINH@gmail.com','LeBinh','LeHoangBinh',4,3,'2019/05/02');
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES				('dattv@gmail.com','LeDuc','LeThuanDuc',1,3,'2019/03/12'),
					('nguyenvanminh@gmail.com','VoLoan','VoHoHongLoan',2,2,'2018/05/12'),
                    ('phamhoang@gmail.com','NguyenHuy','NguyenNgocHuy',3,1,'2019/12/09');
select * from Account;
select * from Department;
select * from Position;

SELECT DepartmentID, COUNT(AccountID) AS NumberOfCustomers
FROM Account
GROUP BY DepartmentID
HAVING NumberOfCustomers >2;

update Account set  Username='LePhuc' where AccountID = 1;

#run ==> chưa update ==> commit; ==> chấp nhân
#run ==> chưa update ==> rollback; ==> dữ liêu
-- delete
delete from Account where AccountID='15';
delete from Account where Username='LeBinh';
delete from Account where FullName='LeHoangBinh';

