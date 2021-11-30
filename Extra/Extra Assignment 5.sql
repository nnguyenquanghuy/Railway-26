-- Exercise 1: Subquery
-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name
-- của ProductSubcategory là 'Saddles'.
USE testing_system_assignment_3;

			SELECT 	ProductSubcategoryID 
			FROM productsubcategory
			WHERE	Name = ('Saddles');

			SELECT 	Name 
			FROM 	product
			WHERE	ProductSubcategoryID = (SELECT 	ProductSubcategoryID 
											FROM productsubcategory
											WHERE	Name = ('Saddles'));
                                 
                                                
	-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau.                                  

			SELECT 	Name 
			FROM 	product
			WHERE	ProductSubcategoryID IN (SELECT 	ProductSubcategoryID 
											 FROM 		productsubcategory
											 WHERE		Name LIKE 'Bo%');