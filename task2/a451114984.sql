USE employees   



SELECT DISTINCT employees.emp_no,employees.birth_date,employees.first_name,employees.last_name,employees.gender,employees.hire_date,titles.title,titles.from_date,titles.to_date,salaries.salary,salaries.from_date,salaries.to_date,departments.dept_name FROM employees INNER JOIN titles ON employees.emp_no = titles.emp_no inner JOIN salaries ON titles.emp_no = salaries.emp_no INNER JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no INNER JOIN departments ON dept_manager.dept_no = departments.dept_no WHERE employees.hire_date = (SELECT min(hire_date) FROM employees);




UPDATE salaries SET salary = salary + 1 WHERE emp_no IN (SELECT emp_no FROM employees WHERE gender = 'M');



DELETE titles.* FROM titles,employees WHERE titles.emp_no = employees.emp_no AND employees.last_name = 'Acton';

DELETE salaries.* FROM salaries,employees WHERE salaries.emp_no = employees.emp_no AND employees.last_name = 'Acton';

DELETE dept_manager.* FROM dept_manager,employees WHERE dept_manager.emp_no = employees.emp_no AND employees.last_name = 'Acton';

DELETE dept_emp.* FROM dept_emp,employees WHERE dept_emp.emp_no = employees.emp_no AND employees.last_name = 'Acton';




INSERT INTO employees VALUES (10000,'1995-05-10','Yi','Wang','M','2000-05-05');

INSERT INTO titles VALUES (10000,'Engineer','2000-05-05','2015-6-21');

INSERT INTO salaries VALUES (10000,10000000,'2000-05-05','2015-6-21');

INSERT INTO dept_emp VALUES (10000,'d005','2000-05-05','2015-6-21');

