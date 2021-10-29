# Pewlett-Hackard-Analysis
## Overview of Pewlett-Hackard-Analysis
* The purpose of Pewlett-Hackard-Analysis is to know the Number of Retiring Employees by Title and create retirement_titles and unique_titles tables that hold the data of unique title employees who is going to retire . If i will get more than one title for any employee number because of promotion,select current title by using **distinct on** statement with order by to remove dupticate emp_no and  to create a table that contains the most recent title of each employee. At last, i created query to get the count of unique titles from unique_titles table which store unique titles and store the data in new Retiring_Titles table.And in second deliverable i will create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

* **The purpose of the new analysis**(silver tsunami) is well defined. (3 pt)you’ll write a report to help the manager prepare for the upcoming "silver tsunami."

### Results: 
* I created Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955.For this I used left join on titles table with employees table and join tables with the help of primary key or foreign key emp_no and get result in emp_no order.I used e as alias of employees table and t as alias of titles table for clean query.

select e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date  into retirement_titles from titles as t left join employees as e on e.emp_no = t.emp_no
where birth_date between '1952-01-01' and '1955-12-31' order by emp_no;

![retirement_titles](https://user-images.githubusercontent.com/90277142/139455569-1a0191f6-479f-4969-8e99-5520e730ba4b.png)

* I created Unique titles table that holds all the unique title of current employees who were born between January 1, 1952 and December 31, 1955.Because some employees may have multiple titles in the database.for example, due to promotions.for this i used the DISTINCT ON statement with order by to remove duplicate emp_no and created a  unique_titles table that contains the most recent title of each employee. 

SELECT DISTINCT ON (emp_no) emp_no,first_name,last_name,title   INTO unique_titles  FROM retirement_titles  ORDER BY emp_no, to_date DESC;

![unique_titles](https://user-images.githubusercontent.com/90277142/139456840-444a08dc-e2e9-4105-9d86-af3e5e817571.png)


* I created Retiring Titles table with the help of the COUNT() function that has the number of retirement-age employees by most recent job title.For this I also used group by function on title to know the count of employees for that perticular title and at last order the count of title in descending order by Desc. keyword. 

select count(title) ,title  into Retiring_Titles  from unique_titles  group by title order by count(title) desc;

![retirement_titles](https://user-images.githubusercontent.com/90277142/139457024-47b10b66-ae82-47b4-940d-0552a7ca38a5.png)

* I created a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program. The current employees who were born between January 1, 1965 and December 31, 1965.I joined three tables with inner join statement,employees table joined with both dept_emp and titles tables.and i put condition on where clause to get only current employees who were born between january 1, 1965 and December 31, 1965.and remove the duplicate  emp_no use distinct on statement on emp_no.

select distinct on(emp_no) e.emp_no,e.first_name,e.last_name,e.birth_date,de.from_date,de.to_date,t.title 
into mentorship_eligibilty
from employees as e
inner join dept_emp as de on e.emp_no = de.emp_no
inner join titles as t on e.emp_no = t.emp_no
where ((de.to_date = '9999-01-01') and (birth_date between '1965-1-1' and '1965-12-31'))
order by emp_no;

![mentorship_eligibilty](https://user-images.githubusercontent.com/90277142/139457927-9342b52a-9977-45dc-83a5-674c2f998c72.png)


#### Summary:
Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
Summary:
The summary addresses the two questions and contains two additional queries or tables that may provide more insight. (5 pt)





