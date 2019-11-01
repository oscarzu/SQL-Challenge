--Creating the tables for the data
-- Placing the drop tables in case I need it to delete them
--DROP TABLE departments;
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

CREATE TABLE employees(emp_no INT NOT NULL PRIMARY KEY,
					   birth_date VARCHAR NOT NULL,
					   first_name VARCHAR NOT NULL,
					   last_name VARCHAR NOT NULL,
					   gender VARCHAR NOT NULL,
					   hire_date VARCHAR NOT NULL);

CREATE TABLE manager(dept_no VARCHAR NOT NULL,
						emp_no INT NOT NULL,
						from_date VARCHAR NOT NULL,
						to_date VARCHAR NOT NULL);

select*from titles;

-- 1. List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, e.hire_date, m.to_date
FROM manager m
INNER JOIN departments d ON m.dept_no = d.dept_no
INNER JOIN employees e ON m.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name as department
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no=d.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name as department
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no=d.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name as department
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no=d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*) AS count
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;

