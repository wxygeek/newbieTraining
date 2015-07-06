/*
    查询工作最长时间的雇员信息（包含他的能得到的全部信息）（工作时间指employee中hire_date最早）
    
#######################################################################################
mysql -u root -p123 employees_partitioned < employees.sql﻿​
查询表结构
desc employees;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_no     | int(11)       | NO   | PRI | NULL    |       |
| birth_date | date          | NO   |     | NULL    |       |
| first_name | varchar(14)   | NO   |     | NULL    |       |
| last_name  | varchar(16)   | NO   |     | NULL    |       |
| gender     | enum('M','F') | NO   |     | NULL    |       |
| hire_date  | date          | NO   |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
查看数据
select * from employees;
太长换显示前10
select * from employees limit 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |
|  10003 | 1959-12-03 | Parto      | Bamford   | M      | 1986-08-28 |
|  10004 | 1954-05-01 | Chirstian  | Koblick   | M      | 1986-12-01 |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak  | M      | 1989-09-12 |
|  10006 | 1953-04-20 | Anneke     | Preusig   | F      | 1989-06-02 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski | F      | 1989-02-10 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi  | M      | 1994-09-15 |
|  10009 | 1952-04-19 | Sumant     | Peac      | F      | 1985-02-18 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau  | F      | 1989-08-24 |
+--------+------------+------------+-----------+--------+------------+
select max(hire_date) from employees;
只能查询到hire_date一列的信息
select * from employees order by hire_date asc limit 0,1;
#######################################################################################
为所有男性雇员工资+1 (性别信息在employee表中，一个人可能包含多条salary信息，需要全部修改)
查询男性
select * from employees where gender='M';
薪水表结构
desc salaries;
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int(11) | NO   | PRI | NULL    |       |
| salary    | int(11) | NO   |     | NULL    |       |
| from_date | date    | NO   | PRI | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+
显示所有男性的薪水 http://www.oschina.net/question/89964_65912
select * from employees left join salaries on (employees.emp_no = salaries.emp_no) where employees.gender='M';
http://database.51cto.com/art/201005/201953.htm
google update left join   http://stackoverflow.com/questions/3248531/mysql-update-query-using-a-left-join
update employees left join salaries on (employees.emp_no = salaries.emp_no) where employees.gender='M' limit 20 set salary=salary+1;
更新不能有limit 然后把set 放在where之前
#######################################################################################
在数据库中彻底抹掉last name为Acton的所有人的所有相关信息（涉及到多个表的信息删除）
模糊查询 Acton
------------------
Tables_in_employees
departments
dept_emp
dept_manager
employees
salaries
titles
--------------------
select * from employees left join salaries on (employees.emp_no = salaries.emp_no) left join titles on(employees.emp_no = titles.emp_no) left join
dept_emp on (employees.emp_no = dept_emp.emp_no) left join dept_manager on (employees.emp_no = dept_manager.emp_no); 
死机...内存不够用换
select * from employees where employees.last_name like '%Acton';
----------------------------------------------------------
emp_no;birth_date;first_name;last_name;gender;hire_date
10695;1962-08-30;Zorica;Acton;M;1989-08-05
----------------------------------------------------------
http://database.51cto.com/art/201005/202216.htm
删除成功
delete titles from titles,employees where employees.last_name like '%Acton' and titles.emp_no = employees.emp_no;
删除employees表中like acton
delete from employees where employees.last_name like '%acton';
#######################################################################################
在数据库中插入你自己的信息，给自己制定一个title、把自己加入到你喜欢的部门中、给自己制定你期望的工资
----------
`emp_no` INT(11) NOT NULL,
	`title` VARCHAR(50) NOT NULL,
	`from_date` DATE NOT NULL,
	`to_date` DATE NULL DEFAULT NULL,
----------
titles

*/
use employees;
select * from employees order by hire_date asc limit 0,1;

update employees left join salaries on (employees.emp_no = salaries.emp_no)set salary=salary+1 where employees.gender='M';

delete titles from titles,employees where employees.last_name like '%Acton' and titles.emp_no = employees.emp_no;
delete salaries from salaries,employees where employees.last_name like '%Acton' and salaries.emp_no = employees.emp_no;
delete dept_manager from dept_manager,employees where employees.last_name like '%Acton' and dept_manager.emp_no = employees.emp_no;
delete dept_emp from dept_emp,employees where employees.last_name like '%Acton' and dept_emp.emp_no = employees.emp_no;
delete from employees where employees.last_name like '%acton';

insert into employees values(500000,"1989-1-1","chen","xiaomi",'M',"2013-6-1");
insert into dept_emp values(500000,"d005","2013-6-1","9999-1-1");
insert into salaries values(500000,5000,"2013-6-1","9999-1-1");
insert into titles values(500000,"Engineer","2015-6-24","9999-1-1");