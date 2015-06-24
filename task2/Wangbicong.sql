-- 查询工作最长时间的雇员信息
SELECT * FROM employees 
WHERE hire_date = (SELECT min(hire_date) FROM employees);
SELECT * FROM dept_emp
WHERE emp_no in (select emp_no from employees where hire_date = (SELECT min(hire_date) FROM employees));
SELECT * FROM dept_manager
WHERE emp_no in (select emp_no from employees where hire_date = (SELECT min(hire_date) FROM employees));
SELECT * FROM salaries
WHERE emp_no in (select emp_no from employees where hire_date = (SELECT min(hire_date) FROM employees));
SELECT * FROM titles
WHERE emp_no in (select emp_no from employees where hire_date = (SELECT min(hire_date) FROM employees));



-- 为所有男性雇员工资+1 
update salaries,employees set salary = salary + 1 
where employees.gender = 'M' and employees.emp_no = salaries.emp_no;

-- where emp_no in (select emp_no from employees where employees.gender = 'M');

-- 在数据库中彻底抹掉last name为Acton的所有人的所有相关信息

delete from dept_emp
where emp_no in (select emp_no from employees where last_name="Acton");
delete from salaries 
where emp_no in (select emp_no from employees where last_name="Acton");
delete from titles 
where emp_no in (select emp_no from employees where last_name="Acton");
delete from dept_manager 
where emp_no in (select emp_no from employees where last_name="Acton");
delete from employees
where last_name = 'Acton';

-- 插入我的信息

insert into employees values(500000,"1996-12-26","Jack","Cong",'M',"2015-6-23");
insert into dept_emp values(500000,"d005","2015-6-23","2020-6-23");
insert into salaries values(500000,666666,"2015-6-23","2020-6-23");
insert into titles values(500000,"Engineer","2015-6-23","2020-6-23");

