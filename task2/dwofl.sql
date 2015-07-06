use employees;
select * from employees  
      where hire_date = 
      (select min(hire_date) FROM employees);
select * from dept_emp
      where emp_no in (select emp_no from employees 
            where  hire_date = 
               (select min(hire_date) FROM employees));
select * from dept_manager
      where emp_no in (select emp_no from employees
            where hire_date =
               (select min(hire_date) from employees));
select * from salaries 
      where emp_no in (select emp_no from employees
            where hire_date =
               (select min(hire_date) from employees));
select * from titles
      where emp_no in (select emp_no from employees
            where hire_date = 
               (select min(hire_date) from employees));
-- 删选信息


update salaries,employees set salary = salary + 1 
where employees.gender = 'M' and employees.emp_no = salaries.emp_no;
-- 加工资


delete from employees
	   where last_name = 'Action';
delete from dept_emp
       where emp_no in 
            (select emp_no from employees
                   where last_name = "Action");
delete from dept_manager
       where emp_no in 
            (select emp_no from employees
                   where last_name = "Action");
delete from dept_manager
       where emp_no in
            (select emp_no from employees
                   where last_name = "Action");
delete from salaries 
       where emp_no in
            (select emp_no from employees
                   where last_name = 'Action');
delete from titles
       where emp_no in
            (select emp_no from employees
                   where last_name = "Action");
-- 删除Action

insert into employees values (621,"1996-7-16","Duan","Wolf",'M',"2015-1-1");
insert  salaries values (621,2800,"2015-1-1","2015-1-1");
insert titles values (621,"farm","2015-1-1","2015-1-1");
insert dept_emp values (621,"e007","2015-1-1","2015-1-1");