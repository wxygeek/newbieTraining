USE employees;

-- a
SELECT * FROM employees WHERE hire_date=(SELECT MIN(hire_date) FROM employees);

-- b
UPDATE salaries SET salary=salary+1 WHERE emp_no in (SELECT emp_no FROM employees WHERE gender = 'M');

-- c
DELETE FROM titles WHERE emp_no IN (SELECT emp_no FROM employees WHERE last_name = 'Action');

DELETE FROM dept_emp WHERE emp_no IN (SELECT emp_no FROM employees WHERE last_name = 'Action');

DELETE FROM dept_manager WHERE emp_no IN (SELECT emp_no FROM employees WHERE last_name = 'Action');

DELETE FROM salaries WHERE emp_no IN (SELECT emp_no FROM employees WHERE last_name = 'Action');

DELETE FROM employees WHERE last_name = 'Action';

-- d
INSERT INTO employees VALUES(123456, '1995-6-4', 'fu', 'wanzneg', 'M', '2015-1-1');
INSERT INTO titles VALUES(123456, 'Engineer', '2015-1-1', '9999-1-1');
INSERT INTO dept_emp VALUES(123456,'d005', '2015-1-1', '9999-1-1');
INSERT INTO salaries VALUES(123456, 123456, '2015-1-1', '9999-1-1');