
--1. Practical Tasks  homework for sql 1

use HomeworkDB
create table students (studentid int PRIMARY KEY , FullName VARCHAR (50), Age INT , GPA DECIMAL(3, 2))
alter table students
add Email VARCHAR (50)
exec sp_rename 'students.fullname', 'name', 'column'
select * from students
alter table students 
drop column age
select * from students
truncate table students

/*2. Query Writing
*/
SELECT SERVERPROPERTY('MachineName') AS ServerName;

select getdate ()

select * from students