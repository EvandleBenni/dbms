SELECT e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

SELECT DISTINCT e.job_id, j.job_title, d.location_id
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id = 80;

SELECT e.last_name, d.department_name, d.location_id, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;

SELECT e.last_name, j.job_title, e.department_id, d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

SELECT e.last_name, j.job_title, e.department_id, d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

SELECT e.last_name AS Employee, e.employee_id AS "Emp#", 
       m.last_name AS Manager, m.employee_id AS "Mgr#"
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

SELECT e.last_name AS Employee, e.employee_id AS "Emp#", 
       m.last_name AS Manager, m.employee_id AS "Mgr#"
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
ORDER BY e.employee_id;

-- Assuming we want to find all employees in the same department as employee with employee_id = 101
SELECT e1.last_name AS Employee_Last_Name, e1.department_id AS Department_Number,
       e2.last_name AS Colleague_Last_Name
FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id
WHERE e1.employee_id = 101;

-- Show structure of JOB_GRADES table (syntax varies by DBMS)
DESC job_grades; -- MySQL/Oracle
-- or
PRAGMA table_info(job_grades); -- SQLite
-- or
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'job_grades';

-- Query:
SELECT e.last_name, j.job_title, d.department_name, e.salary, g.grade_level
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN job_grades g ON e.salary BETWEEN g.lowest_sal AND g.highest_sal;

-- Show structure of JOB_GRADES table (syntax varies by DBMS)
DESC job_grades; -- MySQL/Oracle
-- or
PRAGMA table_info(job_grades); -- SQLite
-- or
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'job_grades';

-- Query:
SELECT e.last_name, j.job_title, d.department_name, e.salary, g.grade_level
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN job_grades g ON e.salary BETWEEN g.lowest_sal AND g.highest_sal;

SELECT e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date > (
  SELECT hire_date FROM employees WHERE last_name = 'Davies'
);

SELECT e.last_name AS Employee, e.hire_date AS "Emp Hired",
       m.last_name AS Manager, m.hire_date AS "Mgr Hired"
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;
