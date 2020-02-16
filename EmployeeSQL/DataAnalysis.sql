-- Data Analysis by Cenez Tindoc
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
	SELECT e.emp_no, 
		e.last_name, 
		e.first_name, 
		e.gender, 
		s.salary
	FROM employees e
	INNER JOIN salaries s on
	e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.

	SELECT emp_no,
		last_name,
		first_name,
		hire_date
	from employees
	where hire_date >= '1986/01/01' AND hire_date <= '1986/12/31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

	SELECT m.dept_no,
		d.dept_name,
		m.emp_no,
		e.last_name,
		e.first_name,
		m.from_date,
		m.to_date
	FROM dept_manager m
	JOIN employees e on
	m.emp_no = e.emp_no
	JOIN departments d
	on d.dept_no = m.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

	SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
	FROM employees e
	JOIN dept_emp p
	on e.emp_no = p.emp_no
	JOIN departments d
	on p.dept_no = d.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

	SELECT emp_no,
		last_name,
		first_name
	from employees
	where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

	SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
	FROM employees e
	JOIN dept_emp p
	on e.emp_no = p.emp_no
	JOIN departments d
	on p.dept_no = d.dept_no
	WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

	SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
	FROM employees e
	JOIN dept_emp p
	on e.emp_no = p.emp_no
	JOIN departments d
	on p.dept_no = d.dept_no
	WHERE dept_name = 'Sales' or dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

	SELECT last_name, COUNT (last_name) as name_count
	FROM employees
	GROUP BY last_name
	ORDER BY name_count desc;
