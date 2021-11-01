--Deliverable1 "retirement_titles" Table
--Retrieve the emp_no, first_name, and last_name columns from the Employees table and title from titles table.
select e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
into retirement_titles
from titles as t left join employees as e 
on e.emp_no = t.emp_no
where birth_date between '1952-01-01' and '1955-12-31'
order by emp_no;

--"unique_titles" Table
-- Use Dictinct on with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,first_name,last_name,title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--"Retiring_Titles" Table
--count of unique titles
select count(title) As totalbytitle ,title
into Retiring_Titles
from unique_titles
group by title 
order by count(title) desc;

--Deliverable2
--"mentorship_eligibilty" Table
select distinct on(emp_no) e.emp_no,e.first_name,e.last_name,e.birth_date,de.from_date,de.to_date,t.title 
into mentorship_eligibilty
from employees as e
inner join dept_emp as de on e.emp_no = de.emp_no
inner join titles as t on e.emp_no = t.emp_no
where ((de.to_date = '9999-01-01') and (birth_date between '1965-1-1' and '1965-12-31'))
order by emp_no;