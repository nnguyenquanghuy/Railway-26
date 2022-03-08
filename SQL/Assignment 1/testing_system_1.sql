DROP DATABASE IF EXISTS testing_system_1;
CREATE DATABASE testing_system_1;
USE testing_system_1;

CREATE TABLE Department(
Department_ID  		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Department_Name		NVARCHAR(30) NOT NULL UNIQUE KEY
);

CREATE TABLE `Position` (
Position_ID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Position_Name 		VARCHAR(50) NOT NULL
);

CREATE TABLE `Account` (
Account_ID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email 				NVARCHAR(50)NOT NULL UNIQUE KEY,
Username 			NVARCHAR(50)NOT NULL,
FullName 			NVARCHAR(50)NOT NULL,
Department_ID 		TINYINT UNSIGNED,
Position_ID     	TINYINT UNSIGNED,
CreateDate	 		DATETIME DEFAULT NOW(),
FOREIGN KEY (Department_ID) REFERENCES Department (Department_ID),
FOREIGN KEY (Position_ID) REFERENCES `Position` (Position_ID)
);

CREATE TABLE `Group` (
Group_ID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Group_Name 			NVARCHAR(50)NOT NULL UNIQUE KEY,
Creator_ID 			TINYINT UNSIGNED NOT NULL,
CreateDate 			DATETIME DEFAULT NOW(),
FOREIGN KEY (Creator_ID) REFERENCES `Account`(Account_ID)
);

CREATE TABLE GroupAccount (
Group_ID 			TINYINT UNSIGNED,
Account_ID 			TINYINT UNSIGNED,
JoinDate 			DATETIME DEFAULT NOW(),
FOREIGN KEY (Group_ID) REFERENCES `Group` (Group_ID),
FOREIGN KEY (Account_ID) REFERENCES `Account` (Account_ID),
PRIMARY KEY (Group_ID,Account_ID)
);

CREATE TABLE TypeQuestion (
Type_ID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Type_Name 			ENUM ("Easay","Mutiple-Choice") NOT NULL 
);

CREATE TABLE CategoryQuestion (
Category_ID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Categoty_Name 		NVARCHAR(50)NOT NULL UNIQUE KEY
);

CREATE TABLE Question (
Question_ID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content 			NVARCHAR(50)NOT NULL,
Category_ID 		TINYINT UNSIGNED,
Type_ID 			TINYINT UNSIGNED,
Creator_ID 			TINYINT UNSIGNED,
CreateDate 			DATETIME DEFAULT NOW(),
FOREIGN KEY(Category_ID) REFERENCES CategoryQuestion (Category_ID),
FOREIGN KEY(Creator_ID) REFERENCES `Account` (Account_ID),
FOREIGN KEY (Type_ID) REFERENCES TypeQuestion (Type_ID)
);

CREATE TABLE Answer (
Answer_ID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content 			NVARCHAR(50)NOT NULL,
Question_ID		 	TINYINT UNSIGNED NOT NULL,
isCorrect 			BIT DEFAULT 1,
FOREIGN KEY (Question_ID) REFERENCES Question (Question_ID)
);

CREATE TABLE Exam (
Exam_ID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Exam_Code 			TINYINT UNSIGNED,
Title 				NVARCHAR(50)NOT NULL,
Category_ID 		TINYINT UNSIGNED NOT NULL,
Duration 			TINYINT UNSIGNED NOT NULL,
Creator_ID 			TINYINT UNSIGNED NOT NULL,
CreateDate 			DATETIME DEFAULT NOW(),
FOREIGN KEY(Category_ID) REFERENCES CategoryQuestion(Category_ID),
FOREIGN KEY(Creator_ID) REFERENCES `Account` (Account_ID)
);

CREATE TABLE ExamQuestion (
Exam_ID 			TINYINT UNSIGNED,
Question_ID	 		TINYINT UNSIGNED,
FOREIGN KEY (Exam_ID) REFERENCES Exam (Exam_ID),
FOREIGN KEY (Question_ID) REFERENCES Question (Question_ID),
PRIMARY KEY(Exam_ID,Question_ID)
);


-- INSERT DATABASE
INSERT INTO Department (Department_Name)
VALUES 	(N'Sale'		),
		(N'HR'			),
		(N'Marketing'	),
        (N'bảo vệ'		),
        (N'tiếp thị'	),
        (N'phó giám đốc'),
        (N'tổng giám đốc'),
        (N'thư kí'		),
        (N'lễ tân'		),
		(N'tiêu thụ'	);
   
INSERT INTO `Position` (Position_Name)
VALUES	(N'truong phong'),
		(N'Dev' 		),
        (N'Test' 		),
        (N'Maintenance'	),
        (N'PM'			),
        (N'nhân sự'		),
        (N'thị trường'	),
        (N'kỹ thuật'	),
        (N'kế toán'		),
        (N'Scrum Master');
        
INSERT INTO `Account` (Email,					Username,	FullName,	CreateDate)
VALUES				  ('NguyenVanA@gmail.com','nguyenvan',	'A'		,'20210312'),
					  ('NguyenVanB@gmail.com','nguyenvan',	'B'		,'20200312'),
                      ('NguyenVanC@gmail.com','nguyenvan',	'C'		,'20210312'),
                      ('NguyenVanD@gmail.com','nguyenvan',	'D'		,'20210312'),
                      ('NguyenVanE@gmail.com','nguyenvan',	'E'		,'20210312'),
                      ('NguyenVanF@gmail.com','nguyenvan',	'F'		,'20210312'),
                      ('NguyenVanG@gmail.com','nguyenvan',	'G'		,'20210312'),
                      ('NguyenVanH@gmail.com','nguyenvan',	'H'		,'20210412'),
                      ('NguyenVanI@gmail.com','nguyenvan',	'I'		,'20060525'),
                      ('NguyenVanJ@gmail.com','nguyenvan',	'J'		,'20210312');
                      
INSERT INTO `Group` (Group_Name	,Creator_ID,CreateDate)
VALUES				('AK47'  	,1,			"1947/11/01"),
					('M249'  	,2,			"1984/11/01"),
                    ('AEK-971'	,3,			"1971/11/01"),
                    ('AN-94'	,4,			"1994/11/01"),
                    ('NQH23'	,5,			"2003/09/26"),
                    ('NMH'		,6,			"2002/03/16"),
                    ('LND'		,7,			"2001/02/16"),
                    ('LQB'		,8,			"2021/12/14"),
                    ('LAD'		,9,			"2000/03/06"),
                    ('AWM'		,10,		"1996/11/01");
                    
INSERT INTO GroupAccount (Group_ID,Account_ID,  JoinDate) 
VALUES     			(1,				1,			"2021/06/03"),
					(2,				2,			"2021/05/02"),                         
					(3,				3,			"2021/07/01"),                         
					(4,				4,			"2021/04/05"),                         
					(5,				5,			"2021/01/04"),                         
					(6,				6,			"2021/02/06"),                         
					(7,				7,			"2021/03/07"),                                                  
					(8,				8,			"2021/10/09"),
					(9,				9,			"2021/09/08"),
					(10,			10,			"2019/12/10");
                    
INSERT INTO 	TypeQuestion 	(Type_Name)
VALUE                           ("Easay"),
								("Mutiple-Choice");
                                
INSERT INTO CategoryQuestion	(Categoty_Name)
VALUES                          ("jAVA"			),
								("C"			),
								("WEB"			),
								("MY SQL"		),
								("MOBIPHONE"	),
								("VIETTEL"		),
                                ("VIETNAMOBILE"	),
                                ("C++"			),
                                ("4G"      		),
								("VIETNAM"		);
                                
INSERT INTO 		Question	(Content								,Category_ID	,Type_ID,	Creator_ID,	CreateDate)
VALUES                      	("Câu hỏi về Lap Trinh JAVA"			,1				,1			,1			,"2021/01/01"),
								("Câu hỏi về Lap Trinh C"				,2				,2			,2			,"2021/01/02"),
								("Câu hỏi về Lap Trinh WEB"				,3				,1			,3			,"2021/01/03"),
								("Câu hỏi về Lap Trinh MY SQL"			,4				,1			,4			,"2021/01/04"),
								("Câu hỏi về Lap Trinh MOBIPHONE"		,5				,1			,5			,"2021/01/05"),
								("Câu hỏi về Lap Trinh VIETTEL"			,6				,2			,6			,"2021/01/06"),
								("Câu hỏi về Lap Trinh VIETNAMOBILE"	,7				,2			,7			,"2021/01/07"),
                                ("Câu hỏi về Lap Trinh C++"				,8				,1			,8			,"2021/01/08"),
                                ("Câu hỏi về Lap Trinh 4G"				,9				,2			,9			,"2021/01/09"),
                                ("Câu hỏi về Lap Trinh VIETNAM"			,10				,1			,10			,"2021/01/10");
                                
INSERT INTO 		Answer	(	Content					,	Question_ID		,isCorrect 	)
VALUES                      (	"Câu tra loi so 1"		,	1				,NULL		),
							(	"Câu tra loi so 2"		,	2				,NULL		),
							(	"Câu tra loi so 3"		,	3				,NULL		),
							(	"Câu tra loi so 4"		,	4				,NULL		),
							(	"Câu tra loi so 5"		,	5				,NULL		),
							(	"Câu tra loi so 6"		,	6				,NULL		),
							(	"Câu tra loi so 7"		,	7				,NULL		),
                            (	"Câu tra loi so 8"		,	8				,NULL		),
                            (	"Câu tra loi so 9"		,	9				,NULL		),
                            (	"Câu tra loi so 10"		,	10				,NULL		);
                            
INSERT INTO 		Exam	(Exam_Code	,	Title					,Category_ID  ,	Duration	,Creator_ID	,CreateDate)
VALUES                      (1			,"Lap Trinh JAVA"			,1				,50			,1			,"2020/01/02"),
							(2			,"Lap Trinh C"				,2				,80			,2			,"2020/02/13"),
							(3			,"Lap Trinh WEB"			,3				,70			,3			,"2020/03/23"),
							(4			,"Lap Trinh MY SQL"			,4				,60			,4			,"2020/04/02"),
							(5			,"Lap Trinh MOBIPHONE"		,5				,50			,5			,"2019/05/13"),
							(6			,"Lap Trinh VIETTEL"		,6				,100		,6			,"2019/12/20"),
							(7			,"Lap Trinh VIETNAMOBILE"	,7				,40			,7			,"2021/01/08"),
                            (8			,"Lap Trinh C++"			,8				,10			,8			,"2021/01/06"),
                            (9			,"Lap Trinh 4G"				,9				,20			,9			,"2021/02/08"),
                            (10			,"Lap Trinh VIETNAM"		,10				,30			,10			,"2021/03/08");
							
INSERT INTO ExamQuestion (Exam_ID	,Question_ID)
VALUE                     (1		,1),
						  (2		,2),
						  (3		,3),
						  (4		,4),
						  (5		,5),
						  (6		,6),
						  (7		,7),
                          (8		,8),
                          (9		,9),
                          (10		,10);