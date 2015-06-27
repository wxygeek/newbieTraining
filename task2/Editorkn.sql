select * 
from employees 
left join dept_manager on employees.emp_no = dept_manager.emp_no
left join dept_emp on employees.emp_no=dept_emp.emp_no
left join titles on employees.emp_no = titles.emp_no
left join salaries on employees.emp_no = salaries.emp_no
where employees.emp_no in (select emp_no from employees
where hire_date = (select min(hire_date) from employees));


update salaries set salary = salary + 1 where emp_no = any(select emp_no from employees where gender = 'M');


delete employees, dept_manager, dept_emp, titles, salaries
from employees 
left join dept_manager on employees.emp_no = dept_manager.emp_no
left join dept_emp on employees.emp_no=dept_emp.emp_no
left join titles on employees.emp_no = titles.emp_no
left join salaries on employees.emp_no = salaries.emp_no
WHERE employees.last_name='Acton';


insert into employees VALUES(523424,'1995-05-23','Zhang','Junkai','M','2023-05-23');
insert into departments VALUES('d125','YiLanJu');
insert into dept_manager VALUES('d125',523424,'2023-05-23','2055-05-23');
insert into dept_emp VALUES(523424, 'd125', '2023-05-23','2055-05-23');
insert into titles VALUES(523424,'CTO','2023-05-23','2095-05-23');
insert into salaries VALUES(523424,'1000000','2023-05-23','2055-05-23');
