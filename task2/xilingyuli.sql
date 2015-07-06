use employees

SELECT employees.*,titles.title,salaries.salary,salaries.from_date,salaries.to_date 
FROM employees 
INNER JOIN titles ON employees.emp_no = titles.emp_no 
INNER JOIN salaries ON titles.emp_no = salaries.emp_no 
WHERE employees.hire_date = (SELECT min(hire_date) FROM employees);

UPDATE salaries SET salary = salary + 1 WHERE emp_no IN (SELECT emp_no FROM employees WHERE gender = 'M');

DELETE * FROM titles WHERE emp_no IN (SELECT emp_no FROM employees WHERE last_name = 'Acton');
DELETE * FROM salaries WHERE dept_no IN (SELECT emp_no FROM employees WHERE last_name = 'Acton');
DELETE * FROM dept_emp WHERE emp_no IN (SELECT emp_no FROM employees WHERE last_name = 'Acton');
DELETE * FROM employees WHERE last_name = 'Acton';

INSERT INTO employees VALUES (500000,'1996-03-02','LuYuan','Zhao','F','2015-05-05');
INSERT INTO titles VALUES (500000,'Engineer','2015-05-05','2055-05-05');
INSERT INTO salaries VALUES (500000,2333333,'2015-05-05','2055-05-05');
INSERT INTO dept_emp VALUES (500000,'d001','2015-05-05','2055-05-05');
