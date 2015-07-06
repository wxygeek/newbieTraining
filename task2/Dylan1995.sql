#a
select * from employees where hire_date=(
	select min(hire_date) from employees
);

#b
update salaries set salary=salary+1 where emp_no in (
	select emp_no from employees where gender='M'
);

#c
delete from titles where emp_no in (
	select emp_no from employees where last_name="Acton"
);
delete from dept_emp where emp_no in (
	select emp_no from employees where last_name="Acton"
);
delete from salaries where emp_no in (
	select emp_no from employees where last_name="Acton"
);
delete from employees where last_name="Acton";

#d
insert into employees values(66666,"1995-05-19","Wang","Zhiwei",'M',"2017-06-01");
insert into titles values(66666,"CEO","2017-06-01","2018-06-01");
insert into dept_emp values(66666,"no1","2017-06-01","2018-06-01");
insert into salaries values(66666,400000,"2017-06-01","2018-06-01");


