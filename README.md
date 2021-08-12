# Pewlett-Hackard-Analysis

## Overview of Analysis

### Purpose: We supported Pewlett-Hackard in preparing for a large-scale departure of employees through retirement, by understanding the overall number of employees, the departments, and how we can support a transitional exit through a part-time mentorship program. This would ease the workload burden on PH in finding the right candidates to fill the upcoming vacant positions. 

### Results: 
* There will be 90,398 employees retiring. If all employees retire at 65, the departures will occur in between 2017-2020.
* The top positions that will need to be filled due to retiring employees are (numbers in brackets): Senior Engineer (29,414), Senior Staff (28,255), Engineer (14,222), and Staff (12,242).

* 84% of the staff retiring are in a technical role, which requires a lot of subject matter expertise
* There are 1,549 people who are approaching retirement who can participate in a mentorship program that would quickly ramp up newly hired employees to fill retiring roles. 

### Summary
* There will be 90,398 employees retiring in between 2017 and 2020. Assuming each employee fills one role, there would need to be 90,398 roles to be filled from the silver tsunami
* Given the number of employees identified to participate in the mentorship program and the vacant roles, we would have approximately 1:60 mentor to mentee ratio, which would be burdensome on the mentors and not a practical scale to ramp up newly hired employees. There are not enough employees and more need to be identified.
* We can conduct further analyses to understand and mitigate the impact of the silver tsunami:

1) Hire within. It is often easier to fill senior roles with internal candidates who are familiar with the organization, products, and services than external candidates. In our retiring_titles, we can identify two role hierarchies, Senior Engineer and Engineer, and Senior Staff and Staff. We can search within the employees table, minus the retiring employees, and identify how many Staff and Engineers can move into Senior Staff and Senior Engineers. 

SELECT DISTINCT ON (emp_no) e.emp_no,
e.birth_date,
e.first_name,
e.last_name,
e.hire_date,
ti.title
INTO potential_employees
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date < '1952-01-01')
AND (ti.title = 'Engineer', 'Staff');

2) Find out which departments will be most affected and allocate mentorship and recruiting resources accordingly
SELECT DISTINCT ON (emp_no) e.emp_no,
de.dept_no,
d.dept_name
INTO retirement_depts
FROM employees AS e
INNER JOIN dept_employees AS de
ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
GROUP BY de.dept_name;

SELECT COUNT(emp_no), dept_name
FROM retirement_depts
GROUP BY dept_name;



Development, Production, and Sales will experience the greatest impact by the silver tsunami and should have greater dedicated resources to fill vacant roles quickly to ensure smooth operations. 



