create table employee(last_name varchar(25), job_code number(10), hire_date number(10), employee_number number(10));
insert into employee values('Lash', 22, 02, 24);
insert into employee values('Muke', 03, 07, 17);
insert into employee values('Aish',23, 18, 04);
SELECT employee_number, last_name, job_code, hire_date from employee;
SELECT employee_number, last_name, job_code, hire_date AS startdate FROM employee;
SELECT DISTINCT job_code FROM employee;
SELECT last_name || ', ' || job_code AS "Employee and Title" FROM employee;
