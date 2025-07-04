-- DROP existing views (if already created)
DROP VIEW IF EXISTS high_salary_employees;
DROP VIEW IF EXISTS employee_department_view;
DROP VIEW IF EXISTS finance_only;
DROP VIEW IF EXISTS avg_salary_by_dept;

-- DROP existing tables (to avoid duplication)
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create 'departments' table
CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

-- Create 'employees' table
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
designation VARCHAR(50),
salary INT,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert data into 'departments'
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering');

-- Insert data into 'employees'
INSERT INTO employees (emp_id, emp_name, designation, salary, dept_id) VALUES
(101, 'Alice', 'Manager', 90000, 1),
(102, 'Bob', 'Developer', 70000, 3),
(103, 'Charlie', 'Accountant', 80000, 2),
(104, 'David', 'Engineer', 60000, 3),
(105, 'Eva', 'Clerk', 50000, 1);

-- View 1: Employees earning more than 70000
CREATE VIEW high_salary_employees AS
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary > 70000;

-- View 2: Employee and department info (JOIN)
CREATE VIEW employee_department_view AS
SELECT 
e.emp_id, 
e.emp_name, 
e.designation, 
d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- View 3: Only Finance department employees (with CHECK OPTION)
CREATE VIEW finance_only AS
SELECT emp_id, emp_name, designation
FROM employees
WHERE dept_id = 2
WITH CHECK OPTION;

-- View 4: Average salary per department
CREATE VIEW avg_salary_by_dept AS
SELECT 
d.dept_name, 
AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;


-- View 1 result
SELECT * FROM high_salary_employees;

-- View 2 result
SELECT * FROM employee_department_view;

-- View 3 result
SELECT * FROM finance_only;

-- View 4 result
SELECT * FROM avg_salary_by_dept;

-- Insert into View 3 (valid entry - allowed)
INSERT INTO employees (emp_id, emp_name, designation, salary, dept_id) 
VALUES (106, 'Frank', 'Auditor', 75000, 2);

-- Test if new Finance employee appears in the view
SELECT * FROM finance_only;

