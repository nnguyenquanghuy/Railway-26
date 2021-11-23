
-- Câu 2: lấy ra tất cả từ Department
SELECT * FROM Department;

-- câu 3:
SELECT DepartmentID 
FROM Department 
WHERE DepartmentName = 'Sale';

-- Câu 4:
SELECT * FROM `Account` 
WHERE length(FullName) = (SELECT MAX(length(FullName)) FROM `Account` );

-- câu 5
SELECT accountid,username,positionid,createdate,fullname, length(fullname) AS "tên dài nhất"
FROM `account`
WHERE departmentid = 4 AND length(fullname) = (SELECT max(length(fullname)) FROM `account` WHERE departmentid = 4 );

-- câu 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT * FROM exam
WHERE CreateDate < "2020/01/02";

-- câu 7:
SELECT DISTINCT questionid, count(answerid)
FROM answer
GROUP BY questionid
HAVING count(questionid) >=2;

-- câu 8
SELECT `code`, duration, createdate
FROM exam
WHERE duration >=60 AND createdate < "2020/04/02" ;

-- câu 9
SELECT *
FROM `group`
WHERE createdate 
LIMIT 5;

-- câu 10
SELECT departmentid,COUNT(accountid) AS "tổng nhân viên"
FROM `account`
WHERE departmentid = 1;

-- câu11

SELECT *
FROM `account`
WHERE fullname LIKE "q%1";

-- câu 12
DELETE FROM Exam 
WHERE
    CreateDate < "20191231";

-- CÂU 13
DELETE FROM Question 
WHERE
    Content LIKE 'ABC%';

-- câu14

UPDATE `Account` SET
Fullname = 'huydz',
Email = 'huy@gmail.com.'
WHERE PositionID = 4;

-- câu 15
UPDATE `Account` SET
DepartmentID = (SELECT DepartmentID FROM Department WHERE DepartmentName = 'Marketing')
WHERE DepartmentID = 3;

SELECT * FROM `Account`;