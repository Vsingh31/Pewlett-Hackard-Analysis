--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
select e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
--into retirement_titles
from titles as t left join employees as e 
on e.emp_no = t.emp_no
where birth_date between '1952-01-01' and '1955-12-31'
order by emp_no;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,first_name,last_name,title
--INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
--count of unique titles
select count(title) As totalbytitle ,title
--into Retiring_Titles
from unique_titles
group by title 
order by count(title) desc;
--Deliverable2
select distinct on(emp_no) e.emp_no,e.first_name,e.last_name,e.birth_date,de.from_date,de.to_date,t.title 
--into mentorship_eligibilty
from employees as e
inner join dept_emp as de on e.emp_no = de.emp_no
inner join titles as t on e.emp_no = t.emp_no
where ((de.to_date = '9999-01-01') and (birth_date between '1965-1-1' and '1965-12-31'))
order by emp_no;






--summary question 1
select sum(totalbytitle),count(title) from
(select count(title) As totalbytitle ,title 
--into Retiring_Titles
from unique_titles
group by title 
order by count(title)) As overallcount;







--summary question 2

select d.dept_name,de.emp_no,e.birth_date
into employeecount_bydepartment
from dept_emp as de
inner join departments as d 
on de.dept_no = d.dept_no
inner join employees as e
on de.emp_no = e.emp_no
where birth_date between '1952-01-01' and '1955-12-31';

select distinct on (emp_no) emp_no,dept_name
into unique_empno
from employeecount_bydepartment
--group by(dept_name)
order by emp_no;

select count(*) from dept_emp de, 
(select count(emp_no) As totaltoretire_bydep,dept_name
from unique_empno ue
group by dept_name
order by count(emp_no) desc) as ue
;

select sum(totalemp_bydepartment) from
(select count(emp_no) As totalemp_bydepartment,dept_name
from unique_empno
group by dept_name
order by count(emp_no)) As totalempcount_bydepartment;