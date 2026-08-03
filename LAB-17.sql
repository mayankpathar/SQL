--Part – A:
--1. Create a view Employee_All with all columns.
--2. Create a view Employee_NameDeptSalary having columns FirstName, Department and Salary.
--3. Create a view Employee_Basic having columns EID, FirstName and City.
--4. Create a view IT_Employees that displays IT department data only.
--5. Create a view HR_Employees that displays HR department data only.
--6. Create a view Employee_2026 that displays employees joined in 2026 only.
--7. Create a view Patel_Employees that displays employees whose last name is PATEL.
--8. Create a view High_Salary_Emp having all columns but employees whose salary is more than 12000.
--9. Create a view that displays information of all employees whose salary is above 14000.
--10. Create a view that displays employees having salary below 10000.
--11. Create a view Server_Dept that displays Server department employees only.
--12. Insert a new record into Employee_Basic view. (111, MEET, SURAT)
--13. Update the department of DEEP from ADMIN to IT in Employee_NameDeptSalary view.
--14. Delete an employee whose EID is 107 from Employee_Basic view.
--15. Drop IT_Employees view from the database.


--Part – B:

--16. Create a view Admin_Employees that displays ADMIN department employees only.
CREATE VIEW Admin_Employees
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Admin_Employees
WHERE DEPARTMENT = 'ADMIN'

--17. Create a view Female_Employees that displays female employee data only.
CREATE VIEW Female_Employees
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Female_Employees
WHERE GENDER = 'Female'

--18. Create a view Male_Employees that displays male employee data only.
CREATE VIEW Male_Employees
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Male_Employees
WHERE GENDER = 'male'

--19. Create a view Rajkot_Employees that displays employees from Rajkot city only.
CREATE VIEW Rajkot_Employees
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Rajkot_Employees
WHERE CITY = 'Rajkot'

--20. Create a view Ahmedabad_Employees that displays employees from Ahmedabad city only.
CREATE VIEW Ahmedabad_Employees
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Ahmedabad_Employees
WHERE CITY = 'Ahmedabad'

--21. Create a view Salary_Between that displays employees whose salary is between 10000 and 14000.
CREATE VIEW Salary_Between
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Salary_Between
WHERE SALARY BETWEEN 10000 AND 14000

--22. Create a view Recent_Employees that displays employees joined after 2023.
CREATE VIEW Recent_Employees
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Recent_Employees
WHERE JOININGYEAR > 2023

--23. Create a view Old_Employees that displays employees joined before 2023.
CREATE VIEW Old_Employees
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Old_Employees
WHERE JOININGYEAR < 2023

--24. Create a view Employees_Start_R that displays employees whose first name starts with R.
CREATE VIEW Employees_Start_R
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Employees_Start_R
WHERE FIRSTNAME LIKE 'R%'

--25. Create a view Employees_End_A that displays employees whose first name ends with A.
CREATE VIEW Employees_End_A
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Employees_End_A
WHERE FIRSTNAME LIKE '%A'

--Part – C:
--26. Create a view Employees_NameContains_H that displays employees whose first name contains H.
CREATE VIEW Employees_NameContains_H
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Employees_NameContains_H
WHERE FIRSTNAME LIKE '%H%'

--27. Create a view for the employees whose first name contains vowels.
CREATE VIEW Employees_NameContains_vowels
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Employees_NameContains_vowels
WHERE FIRSTNAME LIKE '[A,E,I,O,U]%'

--28. Create a view FourLetter_Name having EID, FirstName and Department columns in which FirstName consists of four letters.
CREATE VIEW FourLetter_Name
AS
SELECT * FROM EMPLOYEE
SELECT EID,FIRSTNAME,DEPARTMENT FROM FourLetter_Name
WHERE FIRSTNAME LIKE '____'

--29. Create a view for the employees whose name starts with M and ends with N.
CREATE VIEW FirstName_starts_M_ends_N
AS
SELECT * FROM EMPLOYEE
SELECT * FROM FirstName_starts_M_ends_N
WHERE FIRSTNAME LIKE 'M%N'

--30. Create a view Transport_Dept that displays Transport department employees only.
CREATE VIEW Transport_Dept
AS
SELECT * FROM EMPLOYEE
SELECT * FROM Transport_Dept
WHERE DEPARTMENT = 'Transport'


--EX:-
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR (100) NOT NULL,
City VARCHAR (100),
Membership VARCHAR (20)
);
INSERT INTO Customers (CustomerID, CustomerName, City, Membership) VALUES
(101, 'Alice', 'Mumbai', 'Gold'),
(102, 'Bob', 'Delhi', 'Silver'),
(103, 'Charlie', 'Pune', 'Gold'),
(104, 'David', 'Ahmedabad', 'Silver'),
(105, 'Eva', 'Mumbai', 'Platinum');


CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT NOT NULL,
Product VARCHAR (100) NOT NULL,
Category VARCHAR (50),
Quantity INT NOT NULL,
Price DECIMAL (10,2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, Product, Category, Quantity, Price) VALUES
(201, 101, 'Laptop', 'Electronics', 1, 70000),
(202, 101, 'Mouse', 'Electronics', 2, 800),
(203, 102, 'Chair', 'Furniture', 3, 2500),
(204, 103, 'Phone', 'Electronics', 1, 45000),
(205, 104, 'Table', 'Furniture', 2, 6000),
(206, 105, 'Laptop', 'Electronics', 2, 70000),
(207, 105, 'Printer', 'Electronics', 1, 12000),
(208, 103, 'Desk', 'Furniture', 1, 8000);

--1)
--Create a view named CustomerOrders displaying:
--•
CREATE VIEW CustomerOrders
AS
SELECT C.CustomerName,C.City,O.Product,O.Category,O.Quantity,O.Price
FROM Customers C JOIN Orders O
ON C.CustomerID = O.CustomerID

SELECT * FROM CustomerOrders
--CustomerName
--•
--City
--•
--Product
--•
--Category
--•
--Quantity
--•
--Price

--2)
--Create a view named GoldCustomersOrders that displays all orders placed by gold members.
CREATE VIEW GoldCustomersOrders
AS
SELECT O.OrderID,C.City,O.Product,O.Category,O.Quantity,O.Price
FROM Customers C JOIN Orders O
ON C.CustomerID = O.CustomerID
WHERE Membership = 'GOLD'
SELECT * FROM GoldCustomersOrders
--3)
--Create a view ElectronicOrders displaying only Electronics orders.
CREATE VIEW ElectronicOrders
AS
SELECT O.OrderID,C.City,O.Product,O.Category,O.Quantity,O.Price
FROM Customers C JOIN Orders O
ON C.CustomerID = O.CustomerID
WHERE Category = 'Electronics'
SELECT * FROM ElectronicOrders

--4)
--Create a view CustomerPurchaseSummary showing the total purchase amount for each customer.
--(Purchase Amount = Quantity * Price)
CREATE VIEW CustomerPurchaseSummary
AS
SELECT C.CustomerName,SUM(O.Quantity * O.Price) AS Purchase_Amount
FROM Customers C JOIN Orders O
ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerName

SELECT * FROM CustomerPurchaseSummary
--5) Create a view CustomerOrderCount showing: 
--• Customer Name 
--• Number of Orders placed 
CREATE VIEW CustomerOrderCount
AS
SELECT c.CustomerName,
       COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
SELECT * FROM CustomerOrderCount

--6) Create a view CategorySales displaying: 
--• Category 
--• Number of Orders 
--• Total quantity sold 
CREATE VIEW CategorySales 
AS
SELECT o.Category,
       COUNT(o.OrderID) AS NumberOfOrders,
       SUM(o.Quantity) AS TotalQuantitySold
FROM Orders o
GROUP BY o.Category;
SELECT * FROM CategorySales

--7) Create a view AmountDetails displaying: 
--• Membership Type 
--• Average purchase amount per order  
CREATE VIEW AmountDetails 
AS
SELECT c.Membership,
       AVG(o.Quantity * o.Price) AS AvgPurchaseAmountPerOrder
FROM Customers c JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.Membership;
SELECT * FROM AmountDetails

--8) Create a view CitySales displaying: 
--• City 
--• Total Customers who placed orders 
--• Total purchase amount 
CREATE VIEW CitySales 
AS
SELECT c.City,
       COUNT(DISTINCT c.CustomerID) AS TotalCustomers,
       SUM(o.Quantity * o.Price) AS TotalPurchaseAmount
FROM Customers c JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.City;
SELECT * FROM CitySales


--9) Create a view CustomerSales displaying: 
--• Customer Name 
--• Membership 
--• Total quantity purchased 
--• Total amount spent 
CREATE VIEW CustomerSales 
AS
SELECT c.CustomerName,
       c.Membership,
       SUM(o.Quantity) AS TotalQuantityPurchased,
       SUM(o.Quantity * o.Price) AS TotalAmountSpent
FROM Customers c JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName, c.Membership;
SELECT * FROM CustomerSales

--10) Create a view CustomerMembership displaying: 
--• Category 
--• Membership Type 
--• Total sales 
--• Average quantity purchased
CREATE VIEW CustomerMembership 
AS
SELECT o.Category,
       c.Membership,
       SUM(o.Quantity * o.Price) AS TotalSales,
       AVG(o.Quantity) AS AvgQuantityPurchased
FROM Customers c JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY o.Category, c.Membership;
SELECT * FROM CustomerMembership