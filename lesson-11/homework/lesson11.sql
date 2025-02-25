create database lesson_11

use lesson_11

--Task 1: Basic INNER JOIN
--Question: Retrieve all employee names along with their corresponding department names.

--Table Schema:
--CREATE TABLE Employees ( EmployeeID INT PRIMARY KEY, Name VARCHAR(50), DepartmentID INT );

--CREATE TABLE Departments ( DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50) );

--Sample Data:
--INSERT INTO Employees VALUES (1, 'Alice', 101), (2, 'Bob', 102), (3, 'Charlie', NULL);

--INSERT INTO Departments VALUES (101, 'HR'), (102, 'IT'), (103, 'Finance');

CREATE TABLE Employees ( EmployeeID INT PRIMARY KEY, Name VARCHAR(50), DepartmentID INT )

CREATE TABLE Departments ( DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50) )

INSERT INTO Employees VALUES (1, 'Alice', 101), (2, 'Bob', 102), (3, 'Charlie', NULL)

INSERT INTO Departments VALUES (101, 'HR'), (102, 'IT'), (103, 'Finance');

select * from Employees
select * from Departments

select e.name as employeeName, d.departmentName
from Employees e inner join Departments d
on e.DepartmentID= d.DepartmentID


--Task 2: LEFT JOIN
--Question: List all students along with their class names, including students who are not assigned to any class.

--Table Schema:
--CREATE TABLE Students ( StudentID INT PRIMARY KEY, StudentName VARCHAR(50), ClassID INT );

--CREATE TABLE Classes ( ClassID INT PRIMARY KEY, ClassName VARCHAR(50) );

--Sample Data:
--INSERT INTO Students VALUES (1, 'John', 201), (2, 'Emma', NULL), (3, 'Liam', 202);

--INSERT INTO Classes VALUES (201, 'Math'), (202, 'Science');

CREATE TABLE Students ( StudentID INT PRIMARY KEY, StudentName VARCHAR(50), ClassID INT )
CREATE TABLE Classes ( ClassID INT PRIMARY KEY, ClassName VARCHAR(50) )
INSERT INTO Students VALUES (1, 'John', 201), (2, 'Emma', NULL), (3, 'Liam', 202)
INSERT INTO Classes VALUES (201, 'Math'), (202, 'Science')

select * from Students
select * from Classes

select s.StudentName, c.ClassName
from Students s left join Classes c
on s.ClassID=c.ClassID


--Task 3: RIGHT JOIN
--Question: List all customers and their orders, including customers who haven’t placed any orders.

--Table Schema:
--CREATE TABLE Orders ( OrderID INT PRIMARY KEY, CustomerID INT, OrderDate DATE );

--CREATE TABLE Customers ( CustomerID INT PRIMARY KEY, CustomerName VARCHAR(50) );

--Sample Data:
--INSERT INTO Orders VALUES (1, 301, '2024-11-01'), (2, 302, '2024-11-05');

--INSERT INTO Customers VALUES (301, 'Alice'), (302, 'Bob'), (303, 'Charlie');

CREATE TABLE Orders ( OrderID INT PRIMARY KEY, CustomerID INT, OrderDate DATE );

CREATE TABLE Customers ( CustomerID INT PRIMARY KEY, CustomerName VARCHAR(50) );


INSERT INTO Orders VALUES (1, 301, '2024-11-01'), (2, 302, '2024-11-05');

INSERT INTO Customers VALUES (301, 'Alice'), (302, 'Bob'), (303, 'Charlie');

select * from Orders
select * from Customers

select c.CustomerName, o.OrderID, o.OrderDate
from Orders o right join Customers c
on o.CustomerID = c.CustomerID

--Task 4: FULL OUTER JOIN
--Question: Retrieve a list of all products and their sales, including products with no sales and sales with invalid product references.

--Table Schema:
--CREATE TABLE Products ( ProductID INT PRIMARY KEY, ProductName VARCHAR(50) );

--CREATE TABLE Sales ( SaleID INT PRIMARY KEY, ProductID INT, Quantity INT );

--Sample Data:
--INSERT INTO Products VALUES (1, 'Laptop'), (2, 'Tablet'), (3, 'Phone');

--INSERT INTO Sales VALUES (100, 1, 10), (101, 2, 5), (102, NULL, 8);


CREATE TABLE Products ( ProductID INT PRIMARY KEY, ProductName VARCHAR(50) );

CREATE TABLE Sales ( SaleID INT PRIMARY KEY, ProductID INT, Quantity INT );


INSERT INTO Products VALUES (1, 'Laptop'), (2, 'Tablet'), (3, 'Phone');

INSERT INTO Sales VALUES (100, 1, 10), (101, 2, 5), (102, NULL, 8);

select * from Products
select * from Sales

select p.ProductName, s.SaleID, s.Quantity
from Products p FULL OUTER JOIN Sales s
on p.ProductID=s.ProductID


--Task 5: SELF JOIN
--Question: Find the names of employees along with the names of their managers.

--Table Schema:
--CREATE TABLE Employees ( EmployeeID INT PRIMARY KEY, Name VARCHAR(50), ManagerID INT );

--Sample Data:
--INSERT INTO Employees VALUES (1, 'Alice', NULL), (2, 'Bob', 1), (3, 'Charlie', 1), (4, 'Diana', 2);


CREATE TABLE Employees_ ( EmployeeID INT PRIMARY KEY, Name VARCHAR(50), ManagerID INT );

INSERT INTO Employees_ VALUES (1, 'Alice', NULL), (2, 'Bob', 1), (3, 'Charlie', 1), (4, 'Diana', 2);

select * from Employees_

 

SELECT e.Name AS EmployeeName, m.Name AS ManagerName
FROM Employees_ e
LEFT JOIN Employees_ m ON e.ManagerID = m.EmployeeID

--Task 6: CROSS JOIN
--Question: Generate all possible combinations of colors and sizes.

--Table Schema:
--CREATE TABLE Colors ( ColorID INT PRIMARY KEY, ColorName VARCHAR(50) );

--CREATE TABLE Sizes ( SizeID INT PRIMARY KEY, SizeName VARCHAR(50) );

--Sample Data:
--INSERT INTO Colors VALUES (1, 'Red'), (2, 'Blue');

--INSERT INTO Sizes VALUES (1, 'Small'), (2, 'Medium');




CREATE TABLE Colors ( ColorID INT PRIMARY KEY, ColorName VARCHAR(50) );

CREATE TABLE Sizes ( SizeID INT PRIMARY KEY, SizeName VARCHAR(50) );


INSERT INTO Colors VALUES (1, 'Red'), (2, 'Blue');

INSERT INTO Sizes VALUES (1, 'Small'), (2, 'Medium');

select * from Colors
select * from Sizes


select c.ColorName, s.SizeName
from Colors c cross join Sizes s
order by ColorName

--Task 7: Join with WHERE Clause
--Question: Find all movies released after 2015 and their associated actors.

--Table Schema:
--CREATE TABLE Movies ( MovieID INT PRIMARY KEY, Title VARCHAR(50), ReleaseYear INT );

--CREATE TABLE Actors ( ActorID INT PRIMARY KEY, Name VARCHAR(50), MovieID INT );

--Sample Data:
--INSERT INTO Movies VALUES (1, 'Inception', 2010), (2, 'Interstellar', 2014), (3, 'Dune', 2021);

--INSERT INTO Actors VALUES (101, 'Leonardo DiCaprio', 1), (102, 'Matthew McConaughey', 2), (103, 'Timoth?e Chalamet', 3);

CREATE TABLE Movies ( MovieID INT PRIMARY KEY, Title VARCHAR(50), ReleaseYear INT );

CREATE TABLE Actors ( ActorID INT PRIMARY KEY, Name VARCHAR(50), MovieID INT );


INSERT INTO Movies VALUES (1, 'Inception', 2010), (2, 'Interstellar', 2014), (3, 'Dune', 2021);

INSERT INTO Actors VALUES (101, 'Leonardo DiCaprio', 1), (102, 'Matthew McConaughey', 2), (103, 'Timoth?e Chalamet', 3);

select * from Movies
select * from Actors

select m.title, a.name as ActorName, 
from Movies m join Actors a 
on m.MovieID=a.MovieID
where m.ReleaseYear > 2015

--Task 8: MULTIPLE JOINS
--Question: Retrieve the order date, customer name, and the product ID for all orders.

--Table Schema:
--CREATE TABLE Orders ( OrderID INT PRIMARY KEY, CustomerID INT, OrderDate DATE );

--CREATE TABLE Customers ( CustomerID INT PRIMARY KEY, CustomerName VARCHAR(50) );

--CREATE TABLE OrderDetails ( OrderDetailID INT PRIMARY KEY, OrderID INT, ProductID INT );

--Sample Data:
--INSERT INTO Orders VALUES (1, 401, '2024-11-01'), (2, 402, '2024-11-05');

--INSERT INTO Customers VALUES (401, 'Alice'), (402, 'Bob');

--INSERT INTO OrderDetails VALUES (1001, 1, 501), (1002, 2, 502);


CREATE TABLE Orders_ ( OrderID INT PRIMARY KEY, CustomerID INT, OrderDate DATE );

CREATE TABLE Customers_ ( CustomerID INT PRIMARY KEY, CustomerName VARCHAR(50) );

CREATE TABLE OrderDetails ( OrderDetailID INT PRIMARY KEY, OrderID INT, ProductID INT );

INSERT INTO Orders_ VALUES (1, 401, '2024-11-01'), (2, 402, '2024-11-05');

INSERT INTO Customers_ VALUES (401, 'Alice'), (402, 'Bob');

INSERT INTO OrderDetails VALUES (1001, 1, 501), (1002, 2, 502);


select * from Orders_
select * from Customers_
select * from OrderDetails

select o.OrderDate, c.CustomerName, oo.ProductID
from Orders_ o, Customers_ c, OrderDetails oo
where o.OrderID=oo.OrderID
and o.CustomerID=c.CustomerID


--Task 9: JOIN with Aggregation
--Question: Calculate the total revenue generated for each product.

--Table Schema:
--CREATE TABLE Sales ( SaleID INT PRIMARY KEY, ProductID INT, Quantity INT );

--CREATE TABLE Products ( ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10, 2) );

--Sample Data:
--INSERT INTO Sales VALUES (1, 601, 3), (2, 602, 5), (3, 601, 2);

--INSERT INTO Products VALUES (601, 'TV', 500.00), (602, 'Speaker', 150.00);



CREATE TABLE Sales_ ( SaleID INT PRIMARY KEY, ProductID INT, Quantity INT );

CREATE TABLE Products_ ( ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10, 2) );

INSERT INTO Sales_ VALUES (1, 601, 3), (2, 602, 5), (3, 601, 2);

INSERT INTO Products_ VALUES (601, 'TV', 500.00), (602, 'Speaker', 150.00);

select * from Sales_
select * from Products_


select p.ProductName, SUM(s.Quantity * p.Price) as Total
from Sales_ s
join Products_ p on s.ProductID = p.ProductID
group by p.ProductID, p.ProductName;
