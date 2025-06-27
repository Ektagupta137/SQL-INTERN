-- Drop table if it exists 
DROP TABLE IF EXISTS employees;

-- 1. Create the 'employees' table
CREATE TABLE employees (
id INT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
salary INT,
experience INT
);

-- 2. Insert sample data
INSERT INTO employees (id, name, department, salary, experience) VALUES
(1, 'Alice', 'HR', 50000, 5),
(2, 'Bob', 'Engineering', 70000, 4),
(3, 'Charlie', 'HR', 55000, 6),
(4, 'David', 'Engineering', 80000, 7),
(5, 'Eve', 'Sales', 60000, 3),
(6, 'Frank', 'Sales', 62000, 4);

-- 3. Total salary by department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 4. Average experience by department
SELECT department, AVG(experience) AS avg_experience
FROM employees
GROUP BY department;

-- 5. Count of employees in each department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 6. Departments having total salary greater than 100000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

-- 7. Rounded average salary per department
SELECT department, ROUND(AVG(salary), 2) AS rounded_avg_salary
FROM employees
GROUP BY department;

-- 8. Highest salary per department
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- 9. Count of distinct departments
SELECT COUNT(DISTINCT department) AS total_departments
FROM employees;

-- 10. Count of non-null salaries
SELECT COUNT(salary) AS non_null_salary_count
FROM employees;