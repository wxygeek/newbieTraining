use employees;

/*获取最早雇佣员工编号，出生日期，姓名，性别，上岗时间信息*/
select * from employees 
where hire_date=(select min(hire_date) from employees);
/*获取最早雇佣员工所在部门信息*/
select * from dept_emp
where emp_no in(select emp_no from employees where hire_date=(select min(hire_date) from employees));
select * from dept_manager
where emp_no in(select emp_no from employees where hire_date=(select min(hire_date) from employees));
/*获取最早雇佣员工薪水信息*/
select * from salaries
where emp_no in (select emp_no from employees where hire_date=(select min(hire_date) from employees));
/*获取最早雇佣员工职位信息*/
select * from titles
where emp_no in (select emp_no from employees where hire_date=(select min(hire_date) from employees));

/*所有男性职工工资加1*/
update salaries set salary = salary+1 
where emp_no in(select emp_no from employees where gender='M');

/*抹掉名为Action的人的相关信息*/
delete from dept_emp
where emp_no in (select emp_no from employees where last_name="Action");
delete from dept_manager
where emp_no in (select emp_no from employees where last_name="Action");
delete from employees
where last_name="Action";
delete from salaries
where emp_no in (select emp_no from employees where last_name="Action");
delete from titles
where emp_no in (select emp_no from employees where last_name="Action");

/*加入自己的信息*/
insert into employees values    (001,"1996-04-04","yong","wang",'M',"2015-06-27");
insert into dept_manager values (001,"Information Department","2015-06-27","2030-06-27");
insert into salaries values     (001,880000,"2015-06-27","2030-06-27");
insert into titles values       (001,"chairman","2015-06-27","2030-06-27");


