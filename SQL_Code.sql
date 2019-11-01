--Creating the tables for the data
-- Placing the drop tables in case I need it to delete them
--DROP TABLE departments
--DROP TABLE dept_emp;
--DROP TABLE salaries;
--DROP TABLE titles;
--DROP TABLE employees;
--DROP TABLE manager;    
--select*from departments;

CREATE TABLE departments(dept_no VARCHAR NOT NULL PRIMARY KEY,
							dept_name VARCHAR NOT NULL);


CREATE TABLE dept_emp(emp_no INT NOT NULL,
					  dept_no VARCHAR NOT NULL,
					  from_date VARCHAR NOT NULL,
					  to_date VARCHAR NOT NULL);
					  
CREATE TABLE salaries(emp_no INT NOT NULL,
					 	salary INT NOT NULL,
					 	from_date VARCHAR NOT NULL,
					 	to_date VARCHAR NOT NULL);

CREATE TABLE titles(emp_no INT NOT NULL,
				   	title VARCHAR NOT NULL,
				   from_date VARCHAR NOT NULL,
				   to_date VARCHAR NOT NULL);

CREATE TABLE employees(emp_no INT NOT NULL,
					   birth_date VARCHAR NOT NULL,
					   first_name VARCHAR NOT NULL,
					   last_name VARCHAR NOT NULL,
					   gender VARCHAR NOT NULL,
					   hire_date VARCHAR NOT NULL);

CREATE TABLE manager(dept_no VARCHAR NOT NULL,
						emp_no INT NOT NULL,
						from_date VARCHAR NOT NULL,
						to_date VARCHAR NOT NULL);

select*from manager;