USE employees;


SELECT * FROM employees WHERE hire_date=(SELECT MIN(hire_date) FROM employees);

UPDATE salaries SET salary=salary+1 WHERE emp_no IN (SELECT emp_no FROM employees WHERE gender='M');

DELETE d1 from dept_emp d1, (select * from employees where last_name='Acton') e WHERE d1.emp_no = e.emp_no;
DELETE d2 from dept_manager d2, (select * from employees where last_name='Acton') e WHERE d2.emp_no = e.emp_no;
DELETE d3 from titles d3, (select * from employees where last_name='Acton') e WHERE d3.emp_no = e.emp_no;
DELETE d4 from salaries d4, (select * from employees where last_name='Acton') e WHERE d4.emp_no = e.emp_no;
DELETE FROM employees WHERE last_name='Acton';

INSERT INTO employees VALUES(666666, '1980-1-1', 'Here', 'Go', 'M', '1999-1-1');
INSERT INTO titles VALUES(666666, 'Engineer', '1999-1-1', '9999-1-1');
INSERT INTO dept_emp VALUES(666666, 'd005', '1999-1-1', '9999-1-1');
INSERT INTO salaries VALUES(666666, 666666, '1999-1-1', '9999-1-1');
