SELECT employee_id, last_name, salary*12 AS "ANNUAL SALARY"
FROM employees;

DESC departments;
SELECT * FROM departments;


SELECT employee_id, last_name, job_id, hire_date
FROM employees;


SELECT employee_id, last_name, job_id, hire_date AS STARTDATE
FROM employees;


SELECT DISTINCT job_id
FROM employees;


SELECT last_name || ', ' || job_id AS "EMPLOYEE and TITLE"
FROM employees;


SELECT employee_id || ', ' || first_name || ', ' || last_name || ', ' || email || ', ' || phone_number || ', ' || hire_date || ', ' || job_id || ', ' || salary || ', ' || commission_pct || ', ' || manager_id || ', ' || department_id AS THE_OUTPUT
FROM employees;


SELECT partner_name
FROM partners
WHERE authorized_expense_amount IS NULL
   OR authorized_expense_amount = 0;

SELECT last_name AS "Possible Candidates"
FROM employees
WHERE last_name LIKE '%s';

SELECT song_title
FROM songs
WHERE type_code IN (77, 12, 1);

SELECT last_name
FROM employees
WHERE last_name LIKE '%e%' AND last_name LIKE '%i%'
  AND company = 'Global Fast Foods';

-- 3. Employees making more than $6.50/hour and not order takers
SELECT last_name, job_id, salary
FROM employees
WHERE salary/2080 > 6.50
  AND job_id <> 'ORDER_TAKER'
  AND company = 'Global Fast Foods';

-- 4. Last names starting with D and containing a and e
SELECT last_name
FROM employees
WHERE last_name LIKE 'D%' AND last_name LIKE '%a%' AND last_name LIKE '%e%';

-- 5. Venues for events not in private homes
SELECT DISTINCT venue
FROM events
WHERE venue NOT LIKE '%Private Home%';

-- 6. Operator precedence (answer: NOT, AND, OR)

SELECT first_name, last_name, hire_date, salary
FROM employees
WHERE hire_date > DATE '1998-05-31'
  AND hire_date < DATE '1999-06-01'
  AND salary < 8000
  AND last_name LIKE '%en%';


SELECT first_name, last_name, email, hire_date, salary, commission_pct
FROM employees
WHERE hire_date >= DATE '1996-01-01'
  AND hire_date < DATE '1997-01-01'
  AND salary > 9000
  AND commission_pct IS NULL;
