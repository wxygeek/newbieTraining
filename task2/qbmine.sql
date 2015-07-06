use employees;

select emp_no,birth_date,first_name,last_name,gender,hire_date from employees order by hire_date limit 0,1;

UPDATE salaries,employees SET salaries.salary=salaries.salary+1 WHERE salaries.emp_no=employees.emp_no and employees.gender="M";

DELETE dept_emp FROM employees,dept_emp WHERE employees.emp_no=dept_emp.emp_no and employees.last_name="Acton";

DELETE dept_manager FROM employees,dept_manager WHERE employees.emp_no=dept_manager.emp_no and employees.last_name="Acton";

DELETE salaries FROM employees,salaries WHERE employees.emp_no=salaries.emp_no and employees.last_name="Acton";

DELETE titles FROM employees,titles WHERE employees.emp_no=titles.emp_no and employees.last_name="Acton";

DELETE FROM employees WHERE employees.last_name="Acton";

insert into employees values(1,"1953-09-02","haha","haha","M","1986-06-26");

insert into titles values(1,"Senior Engineer","1986-06-26","9999-01-01");

insert into dept_emp values(1,"d001","1985-01-01","9999-01-01");

insert into salaries values(1,66962,"1990-06-25","1991-06-25");