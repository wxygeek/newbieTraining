1、查询工作最长时间的雇员信息:

mysql> select  employees.*,salaries.*,titles.* from employees,salaries,titles where employees.hire_date=0000-00-00 and employees.emp_no=salaries.emp_no and employees.emp_no=titles.emp_no;

mysql> select min(employees.hire_date) from employees;

2、为所有男性雇员工资+1：
mysql> update salaries,employees set salaries.salary=salaries.salary+1 where employees.gender='M' and employees.emp_no=salaries.emp_no;
Query OK, 1706321 rows affected (56.30 sec)
Rows matched: 1706321  Changed: 1706321  Warnings: 0

3、在数据库中彻底抹掉last name为Acton的所有人的所有相关信息
mysql> delete employees,salaries from employees,salaries where employees.last_name="Acton" and employees.emp_no=salaries.emp_no;
Query OK, 189 rows affected (1.64 sec)

4、在数据库中插入你自己的信息，给自己制定一个title、把自己加入到你喜欢的部门中、给自己制定你期望的工资
mysql> insert into employees values (654321,1998-1-1,"hello","boy",'M',2001-01-02);
Query OK, 1 row affected
mysql> insert into salaries values(654321,15,1997-01-01,2008-02-02);
Query OK, 1 row affected
mysql> insert into titles values(654321,"engineer",1997-01-01,2008-02-02);
Query OK, 1 row affected, 2 warnings (0.08 sec)
