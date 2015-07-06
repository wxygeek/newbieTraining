use employees;

--查询工作最长时间的雇员信息（包含他的能得到的全部信息）

select * from employees where hire_date=(select min(hire_date) from employees);

--为所有男性雇员工资+1

update salaries set salary=salary+1 where emp_no in (select emp_no from employees where gender='M');

--在数据库中彻底抹掉last name为Acton的所有人的所有相关信息

delete from dept_emp where emp_no in(select emp_no from employees where last_name="Acton");
delete from dept_manager where emp_no in(select emp_no from employees where last_name="Acton");
delete from dept_salaries where emp_no in(select emp_no from employees where last_name="Acton");
delete from employees where last_name="Acton";

--在数据库中插入你自己的信息，给自己制定一个title、把自己加入到你喜欢的部门中、给自己制定你期望的工资

insert into employees values(1143710101,'1996-08-16','runhuai','li','M','2014-09-03');
insert into titles values(1143710101,'Engineer','2014-09-03','2014-10-03');
insert into dept_emp values(1143710101,'d001','2014-09-03','2014-10-03');
insert into salaries values(1143710101,8888,'2014-09-03','2014-10-03');
