SELECT  * FROM employees e,(SELECT MIN(hire_date) AS min_date FROM employees) result WHERE e.hire_date = result.min_date;

UPDATE salaries NATURAL join (SELECT emp_no FROM employees WHERE gender = 'F') emp  SET salary = salary + 1 WHERE emp_no < 10040;/*防止数据量太大导致操作太慢*/

delete t,s,d1,d2 from titles t
natural join (select * from employees emp where emp.last_name LIKE '%Acton') e
natural join salaries s
natural join dept_emp d1
natural join dept_manager d2
where t.emp_no = e.emp_no and s.emp_no = e.emp_no and d1.emp_no = e.emp_no and d2.emp_no = e.emp_no;
delete from employees where last_name LIKE '%Acton';

insert into employees values(10000,'1996-07-24','sun','yiyou','F','1996-08-03')
insert into dept_emp values(10000,'d001','1996-08-03','1996-08-03')
insert into salaries values(10000,10000,'1996-08-03','1996-08-03')
insert into titles values(10000,'Engineer','1996-08-03','1996-08-03')