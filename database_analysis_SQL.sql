--Data Analysis

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
	FROM employees emp 
	INNER JOIN salaries sal 
	ON emp.emp_no = sal.emp_no;
	
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
	FROM employees 
	WHERE DATE_PART('year', hire_date) = '1986';
	
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT emp.last_name, emp.first_name, emp.emp_no, dman.dept_no, dep.dept_name
FROM employees emp
INNER JOIN dept_manager dman ON emp.emp_no = dman.emp_no
INNER JOIN departments dep ON dman.dept_no = dep.dept_no
ORDER BY emp.last_name;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dep.dept_no, emp.emp_no, emp.last_name, emp.first_name, dep.dept_name 
FROM departments AS dep
INNER JOIN dept_emp AS demp ON dep.dept_no = demp.dept_no 
INNER JOIN employees AS emp ON demp.emp_no = emp.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT emp.first_name, emp.last_name, emp.sex
FROM employees AS emp
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees emp
JOIN dept_emp demp 
ON emp.emp_no = demp.emp_no
JOIN departments dep
ON dep.dept_no = demp.dept_no
WHERE dep.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees emp
JOIN dept_emp demp 
ON emp.emp_no = demp.emp_no
JOIN departments dep
ON dep.dept_no = demp.dept_no
WHERE dep.dept_name IN ('Sales', 'Development')
ORDER BY dep.dept_name ASC, emp.last_name ASC;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(emp_no) as big_family
FROM employees
GROUP BY last_name
ORDER BY big_family DESC;
