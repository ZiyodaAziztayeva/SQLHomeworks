

---------1. Salespeople from Paris or Rome-------
--From the following table, write a 
--SQL query to find the details of those salespeople who come from the
--'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.

--Sample table: salesman




create database SQL_HW_5 

use  SQL_HW_5

create table salesman (salesman_id int, name varchar (20), city varchar (30), commission decimal (10,2) )

insert into salesman (salesman_id, name, city, commission)
values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12)

select * from salesman 

select salesman_id, name, city, commission
from salesman
where city in ('Paris', 'Rome')

--------------2. Salespeople in Paris or Rome---------

--From the following table, write a SQL query to find the details of the salespeople
--who come from either 'Paris' or 'Rome'. Return salesman_id, name, city, commission. 

--Sample table: salesman

select salesman_id, name, city, commission
from salesman
where city = 'Paris' or city = 'Rome'

------------3. Salespeople Not in Paris or Rome ----------------

--From the following table, write a SQL query to find the details of those salespeople
--who live in cities other than Paris and Rome. Return salesman_id, name, city, commission.  

select salesman_id, name, city, commission 
from salesman
where city not in ('Paris', 'Rome')

-------4. Customers with Specific IDs------------

--From the following table, write a SQL query to retrieve
--the details of all customers whose ID belongs to any
--of the values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.  

--Sample table: customer

create table customer (customer_id int, cust_name varchar (30), city varchar (15), grade int, salesman_id int) 

insert into customer (customer_id, cust_name, city, grade, salesman_id)
values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005)

select * from customer

select customer_id, cust_name, city, grade, salesman_id
from customer
where customer_id in (3007, 3008, 3009)

---------5. Salespeople with Commission 0.12-0.14----------

--From the following table, write a SQL query to find salespeople
--who receive commissions between 0.12 and 0.14 (begin and end values are included).
--Return salesman_id, name, city, and commission.  

--Sample table: salesman

select * from salesman

select salesman_id, name, city, commission 
from salesman 
where commission between 0.12 and 0.14

------------6. Orders Between 500-4000 Excluding Specific Amounts---

--From the following table, write a SQL query to select orders between 500 and 4000 (begin and end values are included).
--Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 

--Sample table: orders

create table orders (ord_no int, purch_amt decimal (10,2),  ord_date date, customer_id int, salesman_id int)

insert into orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001)

select * from orders

select ord_no, purch_amt, ord_date, customer_id, salesman_id
from orders
where purch_amt between  500 and 4000 
and
purch_amt not in (948.50 , 1983.43)

------7. Salespeople with Names N-O Range

--From the following table, write a SQL query to retrieve the details of the salespeople
--whose names begin with any letter between 'A' and 'L' (not inclusive). 
--Return salesman_id, name, city, commission. 

--Sample table: salesman

select * from salesman

select salesman_id, name, city, commission
from salesman
where name like '[M-Z]%'

-------------8. Salespeople with Names Not A-M Range-------------

--From the following table, write a SQL query to find the details of all salespeople
--except those whose names begin with any letter between 'A' and 'M'. 
--Return salesman_id, name, city, commission.  

--Sample table: salesman

select salesman_id, name, city, commission
from salesman
where name BETWEEN 'A' AND 'M'

select * from salesman


---------9. Customers with Names Starting with B

--From the following table, write a SQL query to retrieve the details of the customers 
--whose names begins with the letter 'B'. 
--Return customer_id, cust_name, city, grade, salesman_id.. 

--Sample table: customer

select customer_id, cust_name, city, grade, salesman_id
from customer
where cust_name like 'B%'

SELECT * FROM customer

---------10. Customers with Names Ending with N------------
--From the following table, write a SQL query to find the details of the customers
--whose names end with the letter 'n'.
--Return customer_id, cust_name, city, grade, salesman_id.

--Sample table: customer


---------11. Salespeople Name Starts 'N' with Fourth 'L'-------

--From the following table, write a  SQL query to find the details of those salespeople
--whose names begin with ‘N’ and the fourth character is 'l'. 
--Rests may be any character. Return salesman_id, name, city, commission. 

--Sample table : salesman

select salesman_id, name, city, commission
from salesman
where name like 'N__l%'

select * from salesman

-------------12. Rows with Underscore Character---------------
--From the following table, write a SQL query to find 
--those rows where col1 contains the escape character underscore ( _ ). 
--Return col1.

--Sample table: testtable

--From the following table, write a SQL query to find 
--those rows where col1 contains the escape character underscore ( _ ).
--Return col1.

--Sample table: testtable

create table testtable (col1 varchar (100))

insert into testtable (col1)
values
('A001/DJ-402\44_/100/2015'),
('A001_\DJ-402\44_/100/2015'),
('A001_DJ-402-2014-2015'),
('A002_DJ-401-2014-2015'),
('A001/DJ_401'),
('A001/DJ_402\44'),
('A001/DJ_402\44\2015'),
('A001/DJ-402%45\2015/200'),
('A001/DJ_402\45\2015%100'),
('A001/DJ_402%45\2015/300'),
('A001/DJ-402\44')

select * from testtable

select col1
from testtable
where col1 LIKE '%~_%' escape '~'

---------13. Rows Without Underscore Character--------

--From the following table, write a SQL query to identify those rows 
--where col1 does not contain the escape character underscore ( _ ).
--Return col1.

--Sample table: testtable

select col1
from testtable
where col1 not LIKE '%~_%' escape '~'


------------14. Rows with Forward Slash Character-------------

--From the following table, write a SQL query to find rows in
--which col1 contains the forward slash character ( / ). 
--Return col1.

--Sample table: testtable

select col1
from testtable
where col1 LIKE '%/%'

select * from testtable

--------15. Rows Without Forward Slash Character---------
--From the following table, write a SQL query to identify those rows
--where col1 does not contain the forward slash character ( / ). 
--Return col1.

--Sample table: testtable

select col1
from testtable
where col1 not LIKE '%/%'

select * from testtable

------16. Rows with '_/' String-----------

--From the following table, write a SQL query to find those rows 
--where col1 contains the string ( _/ ). Return col1.

--Sample table: testtable

select col1
from testtable
where col1 LIKE '%~_/%' escape '~'

select * from testtable

-------17. Rows Without '_/' String-----------
--From the following table, write a SQL query to find those rows
--where col1 does not contain the string ( _/ ). Return col1.

--Sample table: testtable

select col1
from testtable
where col1 not LIKE '%~_/%' escape '~'

-------18. Rows with Percent Character---------

--From the following table, write a SQL query to find those rows 
--where col1 contains the character percent ( % ). 
--Return col1.

--Sample table: testtable

SELECT col1
FROM testtable
WHERE col1 LIKE '%~%%' ESCAPE '~'


-------19. Rows Without Percent Character---------

--From the following table, write a SQL query to find those rows 
--where col1 does not contain the character percent ( % ).
--Return col1.
--Sample table: testtable

SELECT col1
FROM testtable
WHERE col1 not LIKE '%~%%' ESCAPE '~'

-------20. Customers Without Grade----------
--From the following table, write a SQL query to find all those customers
--who does not have any grade. 
--Return customer_id, cust_name, city, grade, salesman_id.
--Sample table: customer

select * from customer

select  customer_id, cust_name, city, grade, salesman_id
from customer
where grade is null

-----------21. Customers With Grade----------

--From the following table, write a SQL query to locate all customers with a grade value. 
--Return customer_id, cust_name,city, grade, salesman_id.

--Sample table: customer


select * from customer

select  customer_id, cust_name, city, grade, salesman_id
from customer
where grade is not null

------------22. Employees with Last Name Starting 'D'-----------

--From the following table, write a  SQL query to locate the employees 
--whose last name begins with the letter 'D'. 
--Return emp_idno, emp_fname, emp_lname and emp_dept. Go to the editor

--Sample table: emp_details

create table emp_details (EMP_IDNO int, EMP_FNAME varchar (15), EMP_LNAME varchar (15), EMP_DEPT int)

insert into emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
values
(127323, 'Michale',  'Robbin',   57),
(526689, 'Carlos',   'Snares',  63),
(843795, 'Enric',   'Dosio',  57),
(328717, 'Jhon',    'Snares', 63),
(444527, 'Joseph',  'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar',  'Sitaraman', 57),
(748681, 'Henrey',  'Gabriel', 47),
(555935, 'Alex',  'Manuel',  57),
 (539569, 'George', 'Mardy', 27),
(733843, 'Mario',  'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
 (839139, 'Maria', 'Foster', 57)

 select * from emp_details

 select emp_idno, emp_fname, emp_lname, emp_dept
 from emp_details
 where emp_lname like 'D%'
