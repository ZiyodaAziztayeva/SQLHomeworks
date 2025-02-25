
--SQL Functions and Group by - Exercises, Practice, Solution

create database [sql h/w 6]

use [sql h/w 6]

--1. Calculate Total Purchase Amount of All Orders

--From the following table, write a SQL query to calculate 
---total purchase amount of all orders. Return total purchase amount.

create table orders (ord_no int, purch_amt decimal (10,2),  ord_date date, customer_id int, salesman_id int)

insert into orders (ord_no,      purch_amt,   ord_date,    customer_id,  salesman_id)
values 
(70001,      150.5,       '2012-10-05',  3005,         5002),
(70009,      270.65,      '2012-09-10',  3001,         5005),
(70002,     65.26,       '2012-10-05',  3002,         5001),
(70004,    110.5,       '2012-08-17',  3009,         5003),
(70007,       948.5,       '2012-09-10',  3005,         5002),
(70005,       2400.6,      '2012-07-27',  3007,         5001),
(70008,       5760,        '2012-09-10',  3002,         5001),
(70010,       1983.43,     '2012-10-10',  3004,         5006),
(70003,       2480.4,      '2012-10-10',  3009,         5003),
(70012,       250.45,      '2012-06-27',  3008,         5002),
(70011,       75.29,       '2012-08-17',  3003,         5007),
(70013,       3045.6,      '2012-04-25',  3002,         5001)

select * from orders

select sum(purch_amt) as total_purchase_amount
from orders


--2. Calculate Average Purchase Amount of All Orders

--From the following table, write a SQL query to calculate 
--the average purchase amount of all orders. 
--Return average purchase amount. 

--Sample table: orders

select AVG(purch_amt) as average_purchase_amount
from orders

--3. Count the Number of Unique Salespeople

--From the following table, write a SQL query that 
--counts the number of unique salespeople. Return number of salespeople.  

--Sample table: orders

select * from orders

select count(distinct salesman_id) as [number of salespeople]
from orders


--4. Count the Number of Customers

--From the following table, write a SQL query to count the number of customers. 
--Return number of customers.  

--Sample table: customer

create table customer (customer_id int, cust_name varchar (20), city varchar (15), grade int, salesman_id int)

insert into customer(customer_id, cust_name, city, grade, salesman_id) 
values
(3002, 'Nick Rimando', 'New York', 100, 5001),
 (3007, 'Brad Davis',   'New York',  200, 5001),
 (3005, 'Graham Zusi',  'California', 200,  5002),
 (3008, 'Julian Green',  'London',  300,  5002),
 (3004, 'Fabian Johnson',  'Paris',  300,  5006),
 (3009, 'Geoff Cameron',  'Berlin',  100,  5003),
 (3003, 'Jozy Altidor',  'Moscow', 200,  5007),
 (3001, 'Brad Guzan',  'London', NULL,  5005)

 select count(distinct customer_id) as [number of customers]
 from customer

-- 5. Count Customers with at Least One Grade

--From the following table, write a SQL query to determine 
--the number of customers who received at least one grade for their activity.  

--Sample table: customer

select count(distinct customer_id) as customers_with_grade
from customer
where grade IS NOT NULL

--6. Find Maximum Purchase Amount

--From the following table, write a SQL query to find the maximum purchase amount.  

--Sample table: orders

select * from orders

select max(purch_amt) as [maximum purchase amount]
from orders

--7. Find Minimum Purchase Amount

--From the following table, write a SQL query to find the minimum purchase amount. 

--Sample table: orders

select min(purch_amt) as [maximum purchase amount]
from orders

--8. Find Highest Customer Grade in Each City

--From the following table, write a SQL query to find 
--the highest grade of the customers in each city. Return city, maximum grade.  

--Sample table: customer

select city, max(grade) as 'max'
from customer
where grade is not null
group by city 
order by max desc

select * from customer

--9. Find Highest Purchase Amount Ordered by Each Customer

--From the following table, write a SQL query to find 
--the highest purchase amount ordered by each customer. 
--Return customer ID, maximum purchase amount. 

--Sample table: orders

select customer_ID, max(purch_amt) as  [maximum purchase amount]
from orders
group by customer_ID
order by customer_ID desc

select * from orders

--10. Highest Purchase by Customer on Date

--From the following table, write a SQL query to find 
--the highest purchase amount ordered by each customer
--on a particular date. Return, order date and highest purchase amount.

--Sample table: orders

select ord_date, customer_id, max(purch_amt) as max_amount     
from orders
group by ord_date, customer_id
order by max_amount 

select * from orders

--11. Highest Purchase Amount by Salesperson on '2012-08-17'

--From the following table, write a SQL query to determine 
--the highest purchase amount made by each salesperson on '2012-08-17'. 
--Return salesperson ID, purchase amount 

--Sample table: orders

select salesman_id, max(purch_amt) as max_amount       
from orders
where ord_date = '2012-08-17'
group by salesman_id


select * from orders

--12. Highest Purchase Amount by Customer on Specific Date

--From the following table, write a SQL query to find 
--the highest order (purchase) amount by each customer
--on a particular order date. Filter the result 
--by highest order (purchase) amount above 2000.00.
--Return customer id, order date and maximum purchase amount.

--Sample table: orders

select * from orders

select customer_id, ord_date, max(purch_amt) as max_amount
from orders
group  by customer_id, ord_date
having max(purch_amt) > 2000.00
order by max_amount 

--13. Max Purchase Amount by Customer and Order Date (2000-6000)

--From the following table, write a  SQL query to find 
--the maximum order (purchase) amount in the range 2000 - 6000 
--(Begin and end values are included.) by combination of each customer 
--and order date. Return customer id, order date and maximum purchase amount.

--Sample table: orders

select customer_id, ord_date,  max(purch_amt) as max_amount
from orders
where purch_amt between 2000 and 6000
group  by customer_id, ord_date
order by max_amount 


--14. Max Purchase Amount by Customer and Order Date (Filter)

--From the following table, write a SQL query to find 
--the maximum order (purchase) amount based on the combination of 
--each customer and order date. Filter the rows for 
--maximum order (purchase) amount is either 2000, 3000, 5760, 6000. 
--Return customer id, order date and maximum purchase amount.

--Sample table: orders

select customer_id, ord_date,  max(purch_amt) as max_amount
from orders
where purch_amt in (2000, 3000, 5760, 6000)
group  by customer_id, ord_date

--15. Max Purchase Amount for Customers (ID Range 3002-3007)

--From the following table, write a SQL query to determine 
--the maximum order amount for each customer. 
--The customer ID should be in the range 3002 and 3007
--(Begin and end values are included.). 
--Return customer id and maximum purchase amount.

--Sample table: orders

select customer_id, max(purch_amt) as max_amount
from orders
where customer_id between 3002 and 3007
group  by customer_id


--16. Max Purchase > 1000 for Customers (ID 3002-3007)

--From the following table, write a SQL query to find 
--the maximum order (purchase) amount for each customer.
--The customer ID should be in the range 3002 and 3007(Begin and end values are included.).
--Filter the rows for maximum order (purchase) amount is higher than 1000.
--Return customer id and maximum purchase amount.

--Sample table: orders

select customer_id, max(purch_amt) as max_amount
from orders
where customer_id between 3002 and 3007
group by customer_id
having max(purch_amt) > 1000

select * from orders

--17. Max Purchase by Salesperson (ID 5003-5008)

--From the following table, write a SQL query to determine 
--the maximum order (purchase) amount generated by each salesperson. 
--Filter the rows for the salesperson ID is in the range 5003 and 5008 
--(Begin and end values are included.). 
--Return salesperson id and maximum purchase amount.

--Sample table: orders

select salesman_id, max(purch_amt) as max_amount
from orders
where salesman_id between 5003 and 5008
group by salesman_id


select * from orders


--18. Count Orders on '2012-08-17'

--From the following table, write a SQL query to count 
--all the orders generated on '2012-08-17'. Return number of orders.

--Sample table: orders

select count(ord_no)
from orders
where ord_date = '2012-08-17'


select * from orders

--19. Count Salespeople in a City

--From the following table, write a SQL query to count 
--the number of salespeople in a city. Return number of salespeople.

--Sample table: salesman

create table salesman (salesman_id int, name varchar (15), city varchar (10), commission decimal (5,2))
insert into salesman (salesman_id, name, city, commission)
values
(5001, 'James Hoog', 'New York',  0.15),
(5002, 'Nail Knite', 'Paris',   0.13),
(5005, 'Pit Alex',  'London',  0.11),
(5006, 'Mc Lyon',  'Paris',  0.14),
(5007, 'Paul Adam',  'Rome',   0.13),
(5003, 'Lauson Hen',  'San Jose', 0.12)


select * from salesman

select count(salesman_id) as [number of salespeople]
from salesman


--20. Count Orders by Order Date and Salesperson

--From the following table, write a SQL query to count
--the number of orders based on the combination of each order date and salesperson.
--Return order date, salesperson id.

--Sample table: orders

select ord_date, salesman_id, count(ord_no) as count_order
from orders
group by ord_date, salesman_id


--21. Calculate Average Product Price

--From the following table, write a SQL 
--query to calculate the average product price. 
--Return average product price.

--Sample table: item_mast

create table item_mast (PRO_ID int, PRO_NAME varchar (20), PRO_PRICE decimal (10,2), PRO_COM int)

insert into item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
values
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive',  250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor',  5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer',  2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse',  250.00, 12)

select * from item_mast

select AVG(PRO_PRICE) as average_price
from item_mast

--22. Count Products with Price >= 350

--From the following table, write a SQL query
--to count the number of products 
--whose price are higher than or equal to 350. 
--Return number of products.

--Sample table: item_mast

select count(PRO_ID) as [number of products]
from item_mast
where PRO_PRICE >= 350

select * from item_mast


--23. Average Price for Unique Companies

--From the following table, write a  SQL query 
--to compute the average price for unique companies. 
--Return average price and company id.

--Sample table: item_mast

select PRO_COM as company_id, AVG(distinct PRO_PRICE) as [average price]
from item_mast
group by PRO_COM 
order by [average price] 

--24. Sum of Allotment Amount for All Departments

--From the following table, write a SQL query to compute 
--the sum of the allotment amount of all departments. 
--Return sum of the allotment amount.

--Sample table: emp_department

create table emp_department(DPT_CODE int, DPT_NAME varchar (15), DPT_ALLOTMENT int)

insert into emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT)
values
 (57, 'IT', 65000),
 (63, 'Finance', 15000),
 (47, 'HR', 240000),
 (27, 'RD', 55000),
 (89, 'QC', 75000)

select * from emp_department

select sum(DPT_ALLOTMENT) as sum
from emp_department


--25. Count of Employees in Each Department

--From the following table, write a SQL query to count 
--the number of employees in each department. 
--Return department code and number of employees.

--Sample table: emp_details

create table emp_details (EMP_IDNO int, EMP_FNAME varchar (20), EMP_LNAME varchar (15), EMP_DEPT int)

insert into emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
values
(127323, 'Michale',         'Robbin',                  57),
   (526689, 'Carlos',          'Snares',                  63),
   (843795, 'Enric',           'Dosio',                   57),
   (328717, 'Jhon',            'Snares',                  63),
   (444527, 'Joseph',          'Dosni',                   47),
   (659831, 'Zanifer',         'Emily',                   47),
   (847674, 'Kuleswar',        'Sitaraman',               57),
   (748681, 'Henrey',          'Gabriel',                 47),
  ( 555935, 'Alex',           'Manuel',                  57),
   (539569, 'George',          'Mardy',                   27),
   (733843, 'Mario',           'Saule',                   63),
   (631548, 'Alan',            'Snappy',                  27),
   (839139, 'Maria',           'Foster',                  57)

select * from emp_details

select EMP_DEPT as [department code], count(*) as [number of employees]
from emp_details
GROUP BY EMP_DEPT