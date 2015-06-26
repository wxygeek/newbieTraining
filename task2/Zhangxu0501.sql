select * from employees where hire_date=(select min(hire_date) from employees);

update salaries set salary=salary+1 where emp_no in (select emp_no from employees where gender='M');

delete from dept_emp where emp_no in (select emp_no from employees where last_name="Acton");
delete from salaries where emp_no in (select emp_no from employees where last_name="Acton");
delete from titles where emp_no in (select emp_no from employees where last_name="Acton");
delete from employees where last_name="Acton";

insert employees values(500000,"1995-05-01","Zhang","xu",'M',"2018-07-10");
insert dept_emp values(500000,"d001","2018-07-10","9999-01-01");
insert salaries values(500000,200000,"2018-07-10","2019-07-10");
insert titles values(500000,"Engineer","2018-07-10","2019-07-10");
