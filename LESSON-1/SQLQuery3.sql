
-----1. Customers with Grade > 100--------

create database [h/w_3]
use [h/w_3]

create table customer 
              (customer_id int, 
			  cust_name varchar (20),
			  city varchar (20),
			  grade int, salesman_id int)

select * from customer

insert into customer
valueS ( 
   3002,'Nick Rimando', 'New York',  100, 5001),
  ( 3007, 'Brad Davis', 'New York',  200, 5001),
  ( 3005, 'Graham Zusi', 'California', 200, 5002),
   (3008, 'Julian Green', 'London',   300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
   (3009, 'Geoff Cameron', 'Berlin', 100,  5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
    (3001, 'Brad Guzan',  'London',  NULL,  5005)

	select customer_id, cust_name, city, grade, salesman_id
	from customer
	where grade > 100

	----------2. New York Customers with Grade > 100--------

	 select customer_id, cust_name, city, grade, salesman_id
	 from customer
	where city = 'new york' and grade > 100

	----------3. New York or Grade > 100----------

	select customer_id, cust_name, city, grade, salesman_id
	 from customer
	where city = 'new york' or grade > 100


	----------4. New York or Not Grade > 100	----------

	select customer_id, cust_name, city, grade, salesman_id
	 from customer
	where city = 'new york' or grade <= 100

	-----5. Not New York and Not Grade > 100------------

	select customer_id, cust_name, city, grade, salesman_id
	 from customer
	where city <> 'new york' and grade <= 100

	---------6. Exclude Specific Orders--------

	create table orders (ord_no int, purch_amt decimal (15,2), ord_date Date,   customer_id int, salesman_id int)
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
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
(70013, 3045.6, '2012-04-25', 3002, 5001);

select * from orders 

select ord_no, purch_amt, ord_date, customer_id , salesman_id 
from orders
where not (ord_date = '2012-09-10' and salesman_id > 5005 and  purch_amt > 1000)

-----------7. Salespeople with Commission Range 0.10-0.12-------------

create table salesman (salesman_id int, name varchar (20),  city  varchar (15), commission decimal (5,2))

insert into salesman (salesman_id,    name ,  city  , commission )
values (
5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris',  0.13),
 (5005, 'Pit Alex', 'London', 0.11),
  (5006, 'Mc Lyon',  'Paris', 0.14),
   (5007, 'Paul Adam', 'Rome',  0.13),
    (5003, 'Lauson Hen', 'San Jose',  0.12)

	select * from salesman

	select salesman_id, name, city, commission
	from salesman 
	where commission between  0.10 and 0.12

	-------8. Orders with Amount < 200 or Exclusions------
select * from orders 

select ord_no, purch_amt, ord_date, customer_id, salesman_id
from orders
where purch_amt < 200
      or not (ord_date >= '2012-02-10' and customer_id < 3009)    

------------9. Conditional Orders Exclusions-------------

select * from orders
where not ord_date = '2012-08-17' 
       or (customer_id > 3005 and purch_amt < 1000)

	   select * from orders
-------10. Orders with Achieved Percentage > 50%-----------

select ord_no,  purch_amt,
(purch_amt/6000)*100 as achieved_percentage,
100-((purch_amt/6000)*100) as unachieved_percentage
from orders
where purch_amt > (6000 * 0.50)

select * from orders

------------11. Employees with Last Name Dosni or Mardy---------

create table emp_details ( EMP_IDNO int, EMP_FNAME varchar (50), EMP_LNAME varchar (50), EMP_DEPT int)

insert into emp_details ( EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
values
( 127323, 'Michale', 'Robbin', 57),
(  526689, 'Carlos',  'Snares',   63),
( 843795, 'Enric',    'Dosio',  57),
 (328717, 'Jhon',    'Snares',  63),
( 444527, 'Joseph',  'Dosni',   47),
 (659831, 'Zanifer',  'Emily',  47),
 (847674, 'Kuleswar', 'Sitaraman',  57),
 (748681, 'Henrey',   'Gabriel',  47),
 (555935, 'Alex',    'Manuel',  57),
 (539569, 'George',  'Mardy',  27),
 (733843, 'Mario',   'Saule',  63),
( 631548, 'Alan',   'Snappy',  27),
 (839139, 'Maria',  'Foster',   57)

 select * from emp_details

 select emp_idno, emp_fname, emp_lname, emp_dept
 from emp_details
 where emp_lname in ( 'Dosni', 'Mardy')

 -----------12. Employees in Department 47 or 63-------------

 select emp_idno, emp_fname, emp_lname, emp_dept
  from emp_details
  where EMP_DEPT in (47, 63)