USE testing_system_assignment_3;

-- câu1
SELECT 
    ac.accountid, ac.fullname, d.departmentid, d.departmentname
FROM
    `account` ac
        RIGHT JOIN
    department d ON ac.departmentid = d.departmentid;

-- câu 2
SELECT accountid, email, username, fullname, d.departmentname, positionid, createdate
FROM `account` a
INNER JOIN department d ON a.departmentid = d.departmentid
WHERE createdate <= '2020/03/12';

-- câu 3
SELECT ac.accountid, ac.username, ac.fullname, p.positionid, p.positionname
FROM `account` ac
INNER JOIN `position` p ON ac.positionid = p.positionid
WHERE p.positionid = '2';

-- câu 4
