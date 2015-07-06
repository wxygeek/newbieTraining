use employees;

select * from employees as a,salaries as b,titles as c where a.hire_date=(select max( hire_date) from employees) and a.emp_no=b.emp_no and c.emp_no=a.emp_no;



update salaries,employees set salaries.salary=salaries.salary+1 where employees.gender='M' and employees.emp_no=salaries.emp_no;

delete employees,salaries from employees,salaries where employees.last_name="Acton" and employees.emp_no=salaries.emp_no;

insert into employees values(654324,1998-1-1,"hello","boy",'M',2001-01-02);

insert into salaries values(654324,15,1997-01-01,2008-02-02);

insert into titles values(654324,"engineer",1997-01-01,2008-02-02);
