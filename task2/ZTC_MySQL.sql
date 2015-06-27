USE employees;

/*query information of employees whose hire_date is longest;*/
SELECT * FROM employees WHERE hire_date=(SELECT MIN(hire_date) FROM employees);

/*add salary of man employees 1*/
UPDATE salaries SET salary=salary+1 WHERE emp_no IN (SELECT emp_no FROM employees WHERE gender='M');

/*delete employees from database whose last name is 'Acton'*/
/*how to delete from many tables at one time?*/
DELETE FROM dept_emp WHERE emp_no IN (SELECT emp_no FROM employees WHERE last_name='Acton');
DELETE FROM dept_manager WHERE emp_no IN (SELECT emp_no FROM employees WHERE last_name='Acton');
DELETE FROM salaries WHERE emp_no IN (SELECT emp_no FROM employees WHERE last_name='Acton');
DELETE FROM titles WHERE emp_no IN (SELECT emp_no FROM employees WHERE last_name='Acton');
DELETE FROM employees WHERE last_name='Acton';

/*insert my information*/
INSERT INTO employees VALUES(00001,'1997-01-05','Andy','Zhu','M','9999-01-05');
INSERT INTO dept_emp VALUES(00001,'d001','2015-06-23','9999-06-23');
INSERT INTO salaries VALUES(00001,00001,'2015-06-23','9999-06-23');
INSERT INTO titles VALUES(00001,'Engineer','2015-06-23','9999-06-23');
