
1---Display All Salespeople----

create database homework_6
use homework_6
create table Salesman ( salesman_id int, name varchar (50),  city varchar (30), commission decimal (3, 2))
select * from Salesman
insert into Salesman ( salesman_id, name, city, commission ) 
values 
(5001, 'James Hoog', 'New York',  0.15),
(5002 , 'Nail Knite' , 'Paris' , 0.13),
(5005 , 'Pit Alex' , 'London' , 0.11),
( 5006 , 'Mc Lyon' , 'Paris' , 0.14),
 (5007 , 'Paul Adam' , 'Rome' , 0.13),
 (5003 , 'Lauson Hen' , 'San Jose' , 0.12)
 select * from Salesman

 2---- Display a Custom String-----------

 select 'This is SQL Exercise, Practice and Solution' AS CustomString

 3----------Display Three Numbers-------

 select 1 AS Number1, 2 AS Number2, 3 AS Number3

 4---------Sum of Two Numbers--------

 select 10 + 15 AS Sum

 5--------Arithmetic Expression Result-----

 select (10+15)/3 as Result

 6--------Specific Columns of Salespeople--------

 select name, commission from Salesman

 7----------Custom Column Order in Orders--------

 create table Orders (ord_no int ,    purch_amt decimal (4, 2) ,  ord_date date ,  customer_id int , salesman_id int)
 ALTER TABLE Orders
ALTER COLUMN purch_amt NUMERIC(10, 2); 


 drop table Orders
 select ord_no  ,    purch_amt ,  ord_date  ,  customer_id , salesman_id
 from Orders


 INSERT INTO Orders (ord_no,    purch_amt ,  ord_date ,  customer_id, salesman_id)
 values
(70001, 150.5,   '2012-10-05',  3005,         5002),
(70009 , 270.65 ,     '2012-09-10' , 3001    ,     5005),
(70002    ,   65.26    ,   '2012-10-05' , 3002 ,        5001),
(70004    ,   110.5    ,   '2012-08-17' , 3009    ,     5003),
(70007    ,   948.5    ,   '2012-09-10' , 3005   ,      5002),
(70005    ,   2400.6 ,     '2012-07-27' , 3007  ,       5001),
(70008    ,   5760   ,     '2012-09-10'  , 3002    ,     5001),
(70010   ,    1983.43  ,   '2012-10-10' , 3004   ,      5006),
(70003   ,    2480.4    ,  '2012-10-10'  , 3009    ,     5003),
(70012   ,    250.45     , '2012-06-27' , 3008   ,      5002),
(70011    ,   75.29  ,     '2012-08-17',  3003   ,      5007),
(70013    ,   3045.6   ,   '2012-04-25'  , 3002  ,       5001)


8---------Unique Salespeople IDs------

select distinct salesman_id from Orders

9---------Salespeople in Paris-----

select * from Salesman

select name, city from Salesman where city = 'Paris'

10----Customers with Grade 200----

create table customer (customer_id int,   cust_name varchar (50) ,   city varchar (30)    , grade int , salesman_id int )
drop table customer


insert into customer (customer_id ,  cust_name    ,    city    , grade , salesman_id)
values 
 ( 3002 , 'Nick Rimando',   ' New York'   ,   100 ,        5001),
 ( 3007,  'Brad Davis' ,     'New York' ,    200 ,        5001),
 (3005 , 'Graham Zusi ' ,   'California' ,   200 ,        5002),
 (3008 , 'Julian Green'  ,   'London'  ,      300 ,        5002),
 (3004 , 'Fabian Johnson' , 'Paris' ,   300 ,        5006),
 (3009 , 'Geoff Cameron'  , 'Berlin' ,    100 ,        5003),
 (3003 , 'Jozy Altidor'   , 'Moscow ' ,      200 ,        5007),
 (3001 , 'Brad Guzan'     , 'London' , null,  5005)

 select * from customer

select customer_id, cust_name, city, grade, salesman_id
from customer
where grade = 200

11----Orders by Salesperson 5001------

select * from orders


select ord_no, ord_date, purch_amt
from orders
where salesman_id = 5001

12-------- Nobel Winner of 1970--------

create table nobel_win ( Year int, SUBJECT varchar (30) ,  WINNER varchar (50),  COUNTRY varchar (20),  CATEGORY varchar (30))

insert into nobel_win (YEAR, SUBJECT,      WINNER ,   COUNTRY,  CATEGORY)
values
INSERT INTO nobel_win (YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY)
VALUES
    (1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
    (1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
    (1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
    (1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
    (1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
    (1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
    (1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
    (1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
    (1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
    (1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
    (1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
    (1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
    (1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
    (1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
    (1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
    (1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
    (1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
    (1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
    (1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
    (1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
    (1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
    (1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
    (1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
    (1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');

	select * from nobel_win

	select year, subject, winner
	from nobel_win
	where year = 1970

	13-----Literature Winner 1971---------

	select * from nobel_win

	select winner
	from nobel_win
	where Year = 1971 and SUBJECT = 'literature'

	14-------Locate Dennis Gabor----------

	select * from nobel_win

	select Year, SUBJECT
	FROM nobel_win
	where winner = 'Dennis Gabor'

	---------15. Physics Winners Since 1950 ------------

	select * from nobel_win

	select winner
	from nobel_win
	where subject = 'physics' and Year = 1950

-----------	16. Chemistry Winners (1965-1975)----------


  select Year, Subject, winner, country
  from nobel_win
  where subject = 'chemistry' and Year between 1965 and 1975

  -----------17 Prime Ministers After 1972--------------

  select * from nobel_win
  where CATEGORY = 'Prime Minister'
  and WINNER IN ('Menachem Begin', 'Yitzhak Rabin')
  and Year > 1972

  -----------18. Winners with First Name Louis-----

  select year, subject, winner, country, category
  from nobel_win
  where winner like 'Louis%'

  ---------19.  Combine Winners (Physics 1970 & Economics 1971)----------

  select year, subject, winner, country, category
  from nobel_win
  where (YEAR = 1970 AND SUBJECT = 'Physics')
   OR (YEAR = 1971 AND SUBJECT = 'Economics')

   ------------20.1970 Winners Excluding Physiology & Economics-----------

   select year, subject, winner, country, category
  from nobel_win
  where Year = 1970 and SUBJECT not in ( 'Physiology', 'Economics')
  
  -------------21. Physiology Before 1971 & Peace After 1974---------

  select year, subject, winner, country, category
  from nobel_win
  where (SUBJECT= 'Physiology' and Year < 1971)
  or (SUBJECT= 'Peace' and Year >= 1971)


-------------22.Details of Johannes Georg Bednorz-----

select year, subject, winner, country, category
  from nobel_win
  where WINNER = 'Johannes Georg Bednorz'

  -------------23. Winners Excluding Subjects Starting with P------------
  select * from nobel_win
  select year, subject, winner, country,category
  from nobel_win
  where subject not like 'p%'
  order by year desc, winner asc

  -----------24. Ordered 1970 Nobel Prize Winners------------
  select year, subject, winner, country, category
   from nobel_win
   where year = 1970
   order by case 
   when subject = 'chemistry' then 1
   when subject = 'economics' then 2
   else 0
   end,
   subject asc

   -----------25. Products in Price Range Rs.200-600--------
   create table item_mast (pro_id int, pro_name varchar (50), pro_price int , pro_com int );
   insert into item_mast (PRO_ID,PRO_NAME,PRO_PRICE,PRO_COM)
   values
  (101,'Mother Board', 3200.00,15),
(102,'Key Board',450.00,16),
(103,'Key Board',450.00,16),
(104,'Speaker',550.00,16),
(105,'Monitor',5000.00,11),
(106,'DVD drive',900.00,12),
(107,'CD drive',800.00,12),
(108,'Printer',2600.00,13),
(109,'Refill,cartridge',350.00,13),
(110,'Mouse',250.00,12);
select * from item_mast

select PRO_ID,PRO_NAME,PRO_PRICE,PRO_COM
from item_mast
where pro_price between 200 and 600

-----------------26. Average Price for Manufacturer Code 16----------------
select AVG(PRO_PRICE) AS AVG
FROM item_mast
WHERE pro_com = 16

------------27. Display Item Name and Price------
SELECT pro_name AS "Item Name", pro_price AS "Price in Rs."
FROM item_mast

-----------28. Items with Price >= $250-------

select pro_name, pro_price
from item_mast
where pro_price >= 250
order by pro_price desc, pro_name asc

---------29. Average Price per Company-----------
select pro_com As company_code, avg(pro_price) As average_price
from item_mast
group by pro_com
select * from item_mast

---------30. Cheapest Item-----
select pro_name, pro_price
from item_mast
where pro_price = (select min(pro_price) from item_mast)
select * from item_mast

------------31. Unique Employee Last Names--------
create table emp_details
(EMP_IDNO int, EMP_FNAME  varchar (30),  EMP_LNAME varchar (30), EMP_DEPT int)

insert into emp_details 
values (
127323,'Michale',           'Robbin',                57),
  (526689,'Carlos',       'Snares',                63),
  (843795,'Enric',        'Dosio',                 57),
  (328717,'Jhon',         'Snares',                63),
  (444527,'Joseph',      'Dosni',                 47),
  (659831,'Zanifer',      'Emily',                 47),
  (847674,'Kuleswar',     'Sitaraman',             57),
  (748681,'Henrey',       'Gabriel',               47),
  (555935,'Alex',         'Manuel',                57),
  (539569,'George',       'Mardy',                 27),
  (733843,'Mario',        'Saule',                 63),
  (631548,'Alan',         'Snappy',                27),
  (839139,'Maria',        'Foster',                57)

  select * from emp_details

  select distinct emp_lname
  from emp_details
    select * from emp_details

	----------32. Employees with Last Name Snares-----------
	select emp_idno, emp_fname, emp_lname, emp_dept
	from emp_details
	where emp_lname = 'Snares'

-----------------33. Employees in Department 57---------

select emp_idno, emp_fname, emp_lname, emp_dept
	from emp_details
	where emp_dept = 57
	select * from emp_details