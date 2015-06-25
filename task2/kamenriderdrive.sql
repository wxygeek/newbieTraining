SELECT * FROM employees.employees;
select * from employees.employees order by hire_date;
select * from employees.employees where hire_date = '1985-01-01';
select * from employees.employees where last_name = 'Acton' order by emp_no;
set sql_safe_updates = 0;
delete employees.salaries from employees. salaries,employees.employees where employees.emp_no = salaries.emp_no and employees.last_name = 'Acton';
delete employees.titles from employees.titles,employees.employees where employees.emp_no = titles.emp_no and employees.last_name = 'Acton';
delete employees.dept_emp,employees.dept_manager from employees.employees, employees.dept_emp,employees.dept_manager where employees.emp_no = dept_emp.emp_no and employees.emp_no = dept_manager.emp_no and employees.last_name = 'Acton';
delete from employees.employees where last_name = 'Acton';
select * from employees.employees order by emp_no;
insert into employees.employees values(500000,"1960-01-01","IRON","Man","M","1990-01-01");

update employees.salaries set salary = salary + 1;

insert into employees.titles values(500002,'Senior Staff','2000-6-25','2016-01-01');

insert into employees.dept_emp values(500000,"d005","1990-01-01","2015-01-01");

