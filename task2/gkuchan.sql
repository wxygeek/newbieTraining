USE employees;

SELECT * FROM employees WHERE hire_date=(SELECT MIN(hire_date) FROM employees);

UPDATE salaries SET salary=salary+1 WHERE emp_no IN (SELECT emp_no FROM employees WHERE gender='M');

DELETE employees,dept_emp,dept_manager,salaries,titles
FROM employees
LEFT JOIN dept_emp     ON employees.emp_no=dept_emp.emp_no
LEFT JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
LEFT JOIN salaries     ON employees.emp_no=salaries.emp_no
LEFT JOIN titles       ON employees.emp_no=titles.emp_no
WHERE employees.last_name='Acton';

INSERT INTO employees VALUES(666666, '1980-1-1', 'Here', 'Go', 'M', '1999-1-1');
INSERT INTO titles VALUES(666666, 'Engineer', '1999-1-1', '9999-1-1');
INSERT INTO dept_emp VALUES(666666, 'd005', '1999-1-1', '9999-1-1');
INSERT INTO salaries VALUES(666666, 666666, '1999-1-1', '9999-1-1');