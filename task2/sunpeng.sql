-- a
SELECT * FROM employees ORDER BY hire_date  LIMIT 1； 


--b
UPDATE  salaries SET salary=salary+1 WHERE emp_no IN(SELECT emp_no FROM employees WHERE gender='M');

--c

DELETE employees,dept_emp,dept_manager,salaries,titles
FROM employees 
LEFT JOIN dept_emp 	   ON employees.emp_no=dept_emp.emp_no
LEFT JOIN dept_manager ON employees.emp_no=dept_manager.emp_no 
LEFT JOIN salaries     ON employees.emp_no=salaries.emp_no 
LEFT JOIN titles       ON employees.emp_no=titles.emp_no 
WHERE employees.last_name='Acton';

--d
INSERT INTO employees VALUES(10512,'1996-07-15,'Sun','peng','M','2016-06-23');
INSERT INTO titles VALUES(10512,'boss','2016-06-23','2017-06-23');
INSERT INTO salaries VALUES(10512,'200000','2016-06-23','2017.06-23');
INSERT INTO dept_emp VALUES(10512, 'd001', '2016-06-23','2017.06-23');
