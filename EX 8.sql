-- 4. Highest, Lowest, Sum, and Average Salary of All Employees
SELECT 
    ROUND(MAX(salary)) AS Maximum,
    ROUND(MIN(salary)) AS Minimum,
    ROUND(SUM(salary)) AS Sum,
    ROUND(AVG(salary)) AS Average
FROM employees;

-- 5. Min, Max, Sum, and Avg Salary for Each Job Type
SELECT 
    job_id,
    ROUND(MIN(salary)) AS Minimum,
    ROUND(MAX(salary)) AS Maximum,
    ROUND(SUM(salary)) AS Sum,
    ROUND(AVG(salary)) AS Average
FROM employees
GROUP BY job_id;

-- 6. Number of People with the Same Job (Prompted Job Title)
-- Replace &job_title with actual job ID when prompted (e.g., 'IT_PROG')
SELECT 
    COUNT(*) AS Number_of_People
FROM employees
WHERE job_id = '&job_title';

-- 7. Number of Managers (Without Listing Them)
SELECT 
    COUNT(DISTINCT manager_id) AS "Number of Managers"
FROM employees
WHERE manager_id IS NOT NULL;

-- 8. Difference Between Highest and Lowest Salaries
SELECT 
    MAX(salary) - MIN(salary) AS Difference
FROM employees;

-- 9. Manager Number and Lowest-Paid Employee for That Manager
SELECT 
    manager_id,
    MIN(salary) AS Lowest_Salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY Lowest_Salary DESC;

-- 10. Total Employees and Hires in 1995, 1996, 1997, and 1998
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) = 1995 THEN 1 ELSE 0 END) AS Hired_1995,
    SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) = 1996 THEN 1 ELSE 0 END) AS Hired_1996,
    SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) = 1997 THEN 1 ELSE 0 END) AS Hired_1997,
    SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) = 1998 THEN 1 ELSE 0 END) AS Hired_1998
FROM employees;

-- 11. Matrix Query: Job, Salary per Department, and Total
SELECT 
    job_id,
    SUM(CASE WHEN department_id = 20 THEN salary ELSE 0 END) AS Dept_20,
    SUM(CASE WHEN department_id = 50 THEN salary ELSE 0 END) AS Dept_50,
    SUM(CASE WHEN department_id = 80 THEN salary ELSE 0 END) AS Dept_80,
    SUM(CASE WHEN department_id = 90 THEN salary ELSE 0 END) AS Dept_90,
    SUM(salary) AS Total_Salary
FROM employees
WHERE department_id IN (20, 50, 80, 90)
GROUP BY job_id;

-- 12. Department Name, Location, Number of Employees, and Average Salary
SELECT 
    d.department_name || ' - ' || l.city AS "Name-Location",
    COUNT(e.employee_id) AS "Number of People",
    ROUND(AVG(e.salary), 2) AS Salary
FROM departments d
JOIN locations l ON d.location_id = l.location_id
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name, l.city;
