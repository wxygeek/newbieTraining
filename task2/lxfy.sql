use employees;
-- 查询工作时间最长的雇员
select * from employees where hire_date=(select MIN(hire_date) from employees);
-- 男性雇员工资+1
update salaries 
set salary=salary+1 
where emp_no in (select emp_no from employees where gender='M');
-- 抹掉Action的所有信息
delete from dept_emp where emp_no in (select emp_no from employees where last_name='Acton');
delete from dept_manager where emp_no in (select emp_no from employees where last_name='Acton');
delete from salaries where emp_no in (select emp_no from employees where last_name='Acton');
delete from titles where emp_no in (select emp_no from employees where last_name='Acton');
delete from employees where last_name='Acton';
-- 插入自己信息
insert into employees values(65535,'1995-04-30','LXFY','Luoxufeiyan','M','2015-6-28');
insert into dept_emp values(65535,'d001','2015-06-28','9999-01-01');
insert into salaries values(65535,'99999','2015-06-28','9999-01-01');
insert into titles values(65535,'root','2015-06-28','9999-01-01');
