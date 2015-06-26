--
-- 工作时间最长的雇员的信息
--
SELECT * FROM departments AS d,
			  dept_emp AS de,
			  dept_manager AS dm,
			  employees AS e,
			  salaries AS s,
			  titles AS t,
			  v_full_departments AS vfd,
			  v_full_employees AS vfe 
WHERE   d.dept_no=de.dept_no
	    AND de.emp_no=e.emp_no
	    AND dm.emp_no=e.emp_no
	    AND e.emp_no IN(SELECT emp_no FROM employees WHERE hire_date=(SELECT MIN(hire_date) FROM employees))
	    AND s.emp_no=e.emp_no
	    AND t.emp_no=e.emp_no
	    AND vfd.dept_no=dm.dept_no
	    AND vfe.emp_no=de.emp_no;
--
-- 所有男雇员工资+1
--
UPDATE salaries SET salary=salary+1 
WHERE emp_no IN(SELECT emp_no FROM employees WHERE gender='M');
--
-- 抹掉Acton信息
--
DELETE employees,dept_emp,dept_manager,salaries,titles
FROM employees 
LEFT JOIN dept_emp 	   ON employees.emp_no=dept_emp.emp_no
LEFT JOIN dept_manager ON employees.emp_no=dept_manager.emp_no 
LEFT JOIN salaries     ON employees.emp_no=salaries.emp_no 
LEFT JOIN titles       ON employees.emp_no=titles.emp_no 
WHERE employees.last_name='Acton';
--
-- 插入
--
INSERT INTO employees 
VALUES(111111,'1894-10-21','Lison','Sam','M','1989-1-1');
INSERT INTO titles 
VALUES(111111,'Assistant Engineer','1989-1-1','2009-1-1');
INSERT INTO dept_emp 
VALUES(111111,'d005','1989-1-1','2009-1-1');
INSERT INTO salaries 
VALUES(111111,12345,'1989-1-1','2009-1-1');