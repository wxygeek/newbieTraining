-- a task
SELECT t.* from employees t ORDER BY hire_date LIMIT 0,1;
-- b task
UPDATE salaries SET salary=salary+1 WHERE emp_no in (SELECT t.emp_no from employees t WHERE t.gender='M');
-- c task
DELETE FROM salaries WHERE emp_no in(SELECT emp_no FROM employees WHERE last_name='Acton');
DELETE FROM titles WHERE emp_no in(SELECT emp_no FROM employees WHERE last_name='Acton');
DELETE FROM dept_emp WHERE emp_no in(SELECT emp_no FROM employees WHERE last_name='Acton');
DELETE FROM dept_manager WHERE emp_no in(SELECT emp_no FROM employees WHERE last_name='Acton');
DELETE FROM employees WHERE last_name='Acton';
-- d task
set @new_no=(SELECT MAX(emp_no)+1 from employees);
INSERT INTO employees VALUES (@new_no,'1989-01-01','bk201','sama','M','2015-06-21');
INSERT INTO titles VALUES (@new_no,'Engineer','2015-06-21','2015-06-21');
INSERT INTO salaries VALUES (@new_no,'20000','2015-06-21','2015-06-21');
INSERT INTO dept_emp VALUES (@new_no,'d005','2015-06-21','2015-06-21');
