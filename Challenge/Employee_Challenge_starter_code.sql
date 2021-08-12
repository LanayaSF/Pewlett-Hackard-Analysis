-- Deliverable 1
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date

INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no; 

SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date

INTO unique_titles
FROM employees AS e
INNER JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC, to_date DESC;

DROP TABLE retiring_titles;

DROP TABLE unique_titles;

DROP TABLE retiring_titles;

DROP TABLE mentorship_eligibility;

SELECT * FROM unique_titles;

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY title
ORDER BY COUNT(ut.title) DESC;

SELECT * FROM retiring_titles;

SELECT * FROM unique_titles;


-- Deliverable 2
SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_employees as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
  	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;

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
