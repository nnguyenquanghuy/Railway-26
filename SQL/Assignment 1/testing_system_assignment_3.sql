DROP DATABASE IF EXISTS testing_system_assignment_3;
CREATE DATABASE testing_system_assignment_3;
USE testing_system_assignment_3;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName NVARCHAR(30) NOT NULL
);
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
    PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName NVARCHAR(50) NOT NULL
);
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
    AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) NOT NULL UNIQUE KEY,
    Username VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName NVARCHAR(50) NOT NULL,
    DepartmentID TINYINT UNSIGNED NOT NULL,
    PositionID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID)
        REFERENCES `Position` (PositionID)
);
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
    GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID TINYINT UNSIGNED,
    CreateDate DATETIME,
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
    GroupID TINYINT UNSIGNED NOT NULL,
    AccountID TINYINT UNSIGNED NOT NULL,
    JoinDate DATETIME,
        PRIMARY KEY (GroupID , AccountID),
    FOREIGN KEY (GroupID) REFERENCES `Group` (GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account` (AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName NVARCHAR(50) NOT NULL
);
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
    CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL
);
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
    QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content NVARCHAR(100) NOT NULL,
    CategoryID TINYINT UNSIGNED NOT NULL,
    TypeID TINYINT UNSIGNED NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME,
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (TypeID)
        REFERENCES TypeQuestion (TypeID),
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountId)
);
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
    AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content NVARCHAR(100) NOT NULL,
    QuestionID TINYINT UNSIGNED NOT NULL,
    isCorrect NVARCHAR(50),
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
);
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
    ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code` CHAR(10) NOT NULL,
    Title NVARCHAR(50) NOT NULL,
    CategoryID TINYINT UNSIGNED NOT NULL,
    Duration TINYINT UNSIGNED NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME,
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountId)
);
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
    ExamID TINYINT UNSIGNED NOT NULL,
    QuestionID TINYINT UNSIGNED NOT NULL
);

INSERT INTO Department (DepartmentName)
VALUES 	("Sale"),
		("HR"),
		("Marketing"),
        ("bảo vệ"),
        ("tiếp thị"),
        ("phó giám đốc"),
        ("tổng giám đốc"),
        ("thư kí"),
        ("lễ tân"),
        ("tiêu thụ");
   
INSERT INTO `Position` (PositionName)
VALUES	("truong phong"),
		('Dev' 				),
        ('Test' 			),
        ('Maintenance'		),
        ('PM'				),
        ('Scrum Master'	 	);
             
INSERT INTO `Account` (email,username,fullname,DepartmentID,PositionID,CreateDate)
VALUES 					('AfC@gmail.com','thap','quang',1,2,'20210312'),
						('acc@gmail.com','nhat','quang',1,2,'20210312'),
                        ('sds@gmail.com','nhi','quang',1,2,'20210312'),
						('dfg@gmail.com','tam','quang',1,2,'20210312'),
                        ('dfd@gmail.com','tu','quang',1,2,'20210312'),
						('hjh@gmail.com','ngu','quang',1,2,'20210312'),
                        ('kmht@gmail.com','luc','quang',1,2,'20210312'),
						('hkth@gmail.com','that','quang',1,2,'20210312'),
                        ('tmh@gmail.com','bat','quang',1,2,'20210312'),
						('tmhlt@gmail.com','cuu','quang',1,2,'20210312');

INSERT INTO `Group` (GroupName,CreatorID,CreateDate)
VALUES				('AK47',1,"1947/11/01"),
					('M249',2,"1984/11/01"),
                    ('AEK-971',3,"1971/11/01"),
                    ('AN-94',4,"1994/11/01"),
                    ('AWM',5,"1996/11/01");
                    
INSERT INTO groupaccount (GroupID,AccountID,JoinDate) 
VALUES     (1,4,"2021/06/03"),
       (2,9,"2021/05/02"),                         
       (3,8,"2021/07/01"),                         
       (4,7,"2021/04/05"),                         
       (5,6,"2021/01/04"),                         
       (6,5,"2021/02/06"),                         
       (7,4,"2021/03/07"),                                                  
       (9,2,"2021/10/09"),
		(7,1,"2021/09/08"),
		(8,5,"2019/12/10");
        
INSERT INTO 	TypeQuestion 	(TypeName)
VALUE                           ("Easay"),
								("Mutiple-Choice");
                                
INSERT INTO 		CategoryQuestion	(CategoryName)
VALUES                                  ("jAVA"),
										("C"),
										("WEB"),
										("MY SQL"),
										("MOBIPHONE"),
										("VIETTEL"),
										("VIETNAMOBILE");
                                        
INSERT INTO 		Question	(Content						,CategoryID	,TypeID	,CreatorID	,CreateDate)
VALUES                      	("Câu hỏi về Lap Trinh JAVA"	,1				,1			,1			,"2021/01/02"),
								("Câu hỏi về Lap Trinh C"		,2				,2			,2			,"2021/01/02"),
								("Câu hỏi về Lap Trinh WEB"		,3				,3			,3			,"2021/01/02"),
								("Câu hỏi về Lap Trinh MY SQL"	,4				,4			,4			,"2021/01/02"),
								("Câu hỏi về Lap Trinh MOBIPHONE"	,5				,5			,5			,"2021/01/02"),
								("Câu hỏi về Lap Trinh VIETTEL"	,6				,6			,6			,"2021/01/02"),
								("Câu hỏi về Lap Trinh VIETNAMOBILE"	,7				,7			,7			,"2021/01/02");
                                
INSERT INTO 		Answer	(	Content					,	QuestionID		,isCorrect 	)
VALUES                      (	"Câu tra loi so 1"		,	1				,1			),
							(	"Câu tra loi so 2"		,	3				,3			),
							(	"Câu tra loi so 3"		,	4				,1			),
							(	"Câu tra loi so 4"		,	4				,4			),
							(	"Câu tra loi so 5"		,	6				,1			),
							(	"Câu tra loi so 6"		,	6				,3			),
							(	"Câu tra loi so 7"		,	1				,5			);
							
INSERT INTO 		Exam	(`Code`	,Title				,CategoryID  ,Duration	,CreatorID	,CreateDate)
VALUES                      (1			,"Lap Trinh JAVA"	,1				,50			,1			,"2020/01/02"),
							(2			,"Lap Trinh C"		,2				,80			,2			,"2020/02/13"),
							(3			,"Lap Trinh WEB"	,3				,70			,3			,"2020/03/23"),
							(4			,"Lap Trinh MY SQL"	,4				,60			,4			,"2020/04/02"),
							(5			,"Lap Trinh MOBIPHONE"	,5				,50			,5			,"2020/05/13"),
							(6			,"Lap Trinh VIETTEL",6				,100		,6			,"2020/06/18"),
							(7			,"Lap Trinh VIETNAMOBILE",7				,40			,7			,"2019/11/08");
                            
INSERT INTO ExamQuestion (ExamID	,QuestionID)
VALUE                     (1		,1),
						  (2		,2),
						  (3		,3),
						  (4		,4),
						  (5		,1),
						  (6		,6),
						  (7		,5),
						  (8		,2),
						  (9		,2),
						  (10		,3);
                        

