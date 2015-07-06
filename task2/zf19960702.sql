USE employees;
SELECT emp_no,birth_date,first_name,last_name,gender,hire_date FROM employees ORDER BY hire_date limit 0,1;
UPDATE salaries NATURAL JOIN employees SET salaries.salary = salaries.salary + 1 
	WHERE salaries.emp_no = employees.emp_no and employees.gender = 'M';
DELETE salaries FROM employees NATURAL JOIN salaries 
	WHERE employees.emp_no = salaries.emp_no and employees.last_name = 'Acton';
DELETE dept_manager FROM employees NATURAL JOIN dept_manager 
	WHERE employees.emp_no = dept_manager.emp_no and employees.last_name = 'Acton';
DELETE dept_emp FROM employees NATURAL JOIN dept_emp 
	WHERE employees.emp_no = dept_emp.emp_no and employees.last_name = 'Acton';
DELETE FROM employees WHERE employees.last_name = 'Acton';
INSERT INTO employees values(6666,'1996-07-02','Gary','Luo','F','2017-06-23');
INSERT INTO salaries values(6666,6666,'2017-06-23','2018-06-23');
INSERT INTO dept_emp values(6666,'d001','2017-06-23','2018-06-23');
INSERT INTO titles values(6666,'Engineer','2017-06-23','2018-06-23');
