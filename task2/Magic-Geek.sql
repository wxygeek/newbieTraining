use employees;


-- a.查询工作最长时间的雇员信息

select employees.emp_no,employees.first_name,employees.last_name,employees.gender,employees.birth_date,employees.hire_date,salaries.salary,salaries.from_date,salaries.to_date,titles.title,titles.from_date,titles.to_date,dept_emp.dept_no,dept_emp.from_date,dept_emp.to_date,departments.dept_name
from employees,salaries,titles,dept_emp,departments
where salaries.emp_no=employees.emp_no and titles.emp_no=employees.emp_no and dept_emp.emp_no=employees.emp_no and dept_emp.dept_no=departments.dept_no
and employees.emp_no in(select employees.emp_no from employees where employees.hire_date=(select min(employees.hire_date) from employees));
-- 乱的不能忍了


-- b.为所有男性雇员工资+1 

update salaries set salary = salary+1
where salaries.emp_no in(select employees.emp_no from employees where employees.gender='M');


-- c.在数据库中彻底抹掉last name为Acton的所有人的所有相关信息

delete from salaries where salaries.emp_no in(select employees.emp_no from employees where employees.last_name = 'Acton');
delete from dept_emp where dept_emp.emp_no in(select employees.emp_no from employees where employees.last_name = 'Acton');
delete from titles where titles.emp_no in(select employees.emp_no from employees where employees.last_name = 'Acton');
delete from employees where employees.last_name = 'Acton';


-- d.在数据库中插入你自己的信息

insert into employees values(10000,"1996-05-05","Shengzhe","Du",'M',"2015-6-25");
insert into titles values(10000,"Geek","2015-6-25","9999-01-01");
insert into salaries values(10000,0,"2015-6-25","9999-01-01");