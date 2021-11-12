
-- Câu 2: lấy ra tất cả từ Department
SELECT * FROM Department;

-- câu 3:
SELECT DepartmentID 
FROM Department 
WHERE DepartmentName = 'Sale';

-- Câu 4:
SELECT * FROM `Account` 
WHERE length(FullName) = (SELECT MAX(length(FullName)) FROM `Account` );


-- câu 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT * FROM exam
WHERE CreateDate < "2019/12/20";
