--1 EMPS hired 1986
SELECT * 
FROM employees 
WHERE date_part('year',employees.hire_date) = 1986;

--2 EMPS WITH SALARIES
SELECT EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	EMPLOYEES.SEX
FROM EMPLOYEES
LEFT JOIN SALARIES ON EMPLOYEES.EMP_NO = SALARIES.EMP_NO;

--3 MANAGERS WITH NAMES AND DEPARTMENT
SELECT dept_manager.dept_no,
dept_manager.emp_no,
departments.dept_name,
employees.first_name,
employees.last_name
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--4 EMPS WITH DEPARTMENT
SELECT dept_emp.dept_no,
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp on employees.emp_no = dept_emp.emp_no
INNER JOIN departments on departments.dept_no = dept_emp.dept_no;

--5 EMPS WITH AN ATROCIUS NAME
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6 EMPS IN SALES 
SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no,
departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name='Sales';

--7 EMPS IN SALE OR DEVELOPMENT
SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no,
departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name='Sales' OR departments.dept_name = 'Development';

--8 MOST POPULAR LAST NAMES
SELECT last_name,
COUNT(*) AS name_frequency
FROM employees
GROUP BY last_name
ORDER BY name_frequency DESC



