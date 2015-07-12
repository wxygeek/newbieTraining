use employees;

select * from employees where hire_date=(select MIN(hire_date) from employees);

update salaries 
set salary=salary+1 
where emp_no in (select emp_no from employees where gender='M');

delete from dept_emp where emp_no in (select emp_no from employees where last_name='Acton');
delete from dept_manager where emp_no in (select emp_no from employees where last_name='Acton');
delete from salaries where emp_no in (select emp_no from employees where last_name='Acton');
delete from titles where emp_no in (select emp_no from employees where last_name='Acton');
delete from employees where last_name='Acton';

insert into employees values(500600,'1996-12-03','Lv','Ziheng','M','2015-6-6');
insert into dept_emp values(500600,'d001','2015-06-06','9999-01-01');
insert into salaries values(500600,'99999','2015-06-06','9999-01-01');
insert into titles values(500600,'Super Man','2015-06-06','9999-01-01');
