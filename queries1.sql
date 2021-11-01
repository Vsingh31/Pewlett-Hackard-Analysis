select count(*) from dept_emp;
select count(*) from departments;
select count(*) from dept_manager;
select count(*) from employees;
select count(*) from salaries;
select count(*) from titles;

--queries for getting first and last name whose hire date between 1985 and 1988 and birth date between 1952 and 1955.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
and hire_date between '1985-01-01' AND '1988-12-31';


select count(first_name) 
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
and hire_date between '1985-01-01' AND '1988-12-31';

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
and hire_date between '1985-01-01' AND '1988-12-31';

SELECT * FROM retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

select d.dept_name,dm.emp_no,dm.from_date,dm.to_date
from departments as d inner join dept_manager as dm
on d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,ri.first_name,ri.last_name,demp.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as demp
ON ri.emp_no = demp.emp_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

SELECT ri.emp_no,ri.first_name,ri.last_name,de.to_date
into current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

select * from current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
into empcount_depart
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
order by dept_no;
--employee info table with employee salary.
SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
	INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');
	 
select * from emp_info;	 

select * from current_emp;
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
into empcount_depart
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
order by dept_no;

SELECT * FROM salaries;
SELECT * FROM salaries
order by to_date desc;


SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
	INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');
	 
select * from emp_info;	 
	 
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);	 
select * from manager_info;		


-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
	 
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

--deliverable 1
--1selecting data from employees table
select emp_no,first_name,last_name
from employees;
--2selecting data from titles table
select title,from_date,to_date
from titles;
--3Create new table retirement_titles
select title,from_date,to_date
into retirement_titles
from titles;
--4 joining employees and titles table inner join.
select e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
from employees as e inner join titles as t
on e.emp_no = t.emp_no
where birth_date between '1952-1-1' and '1955-12-31'
order by emp_no;

SELECT DISTINCT ON count(emp_no) as emp_count,
first_name,
last_name,
title
INTO recenttitle_employee
FROM retirement_titles
ORDER BY emp_no, emp_count DESC;

--1-7Retrieve the emp_no, first_name, and last_name columns from the Employees table.
select e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
into retirement_titles
from titles as t left join employees as e 
on e.emp_no = t.emp_no
where birth_date between '1952-01-01' and '1955-12-31'
order by emp_no;

--8-14 Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Deliverable2
select distinct on(emp_no) e.emp_no,e.first_name,e.last_name,e.birth_date,de.from_date,de.to_date,t.title 
into mentorship_eligibilty
from employees as e
inner join dept_emp as de on e.emp_no = de.emp_no
inner join titles as t on e.emp_no = t.emp_no
where ((de.to_date = '9999-01-01') and (birth_date between '1965-1-1' and '1965-12-31'))
order by emp_no;