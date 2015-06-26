#写的好烂，肯定有更好的写法，需要学习
select * from employees where hire_date = (select min(hire_date) as minvalue from employees);
select * from salaries where emp_no in (select emp_no from employees where hire_date = (select min(hire_date) as minvalue from employees));

select * from dept_manager where emp_no in (select emp_no from employees where hire_date = (select min(hire_date) as minvalue from employees));

select * from dept_emp where emp_no in (select emp_no from employees where hire_date = (select min(hire_date) as minvalue from employees));

select * from titles where emp_no in (select emp_no from employees where hire_date = (select min(hire_date) as minvalue from employees));


update salaries set salary = salary + 1 where (emp_no in (select emp_no from employees where gender = 'M'));

delete  from titles where emp_no in (select emp_no from employees where last_name = "Action");

delete  from dept_emp where emp_no in (select emp_no from employees where last_name = "Action");

delete  from dept_manager where emp_no in (select emp_no from employees where last_name = "Action");

delete from employees where last_name = "Action";



insert into employees values(10000,"1996-6-20","zhou","qingyang",'M',"2015-6-24");

insert into dept_emp values(10000,"d005","2015-6-14","9999-9-30");

insert into salaries values(10000,1,"2015-6-14","9999-9-30");

insert into titles values(10000,"Engineer","2015-6-24","9999-9-30");
