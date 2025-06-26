-- Create table: employees
CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary INTEGER
);

-- Insert data into employees
INSERT INTO employees VALUES (1, 'Raj Singh', 'IT', 55000);
INSERT INTO employees VALUES (2, 'Asha Verma', 'HR', 40000);
INSERT INTO employees VALUES (3, 'Kunal Rao', 'Finance', 48000);
INSERT INTO employees VALUES (4, 'Meera Jain', 'IT', 62000);
INSERT INTO employees VALUES (5, 'Aman Gupta', 'HR', 39000);

-- Create table: projects
CREATE TABLE projects (
    pid INTEGER PRIMARY KEY,
    project_name TEXT,
    emp_id INTEGER,
    status TEXT
);

-- Insert data into projects
INSERT INTO projects VALUES (101, 'Payroll System', 1, 'Ongoing');
INSERT INTO projects VALUES (102, 'HR Dashboard', 2, 'Complete');
INSERT INTO projects VALUES (103, 'Budget Tracker', 3, 'Ongoing');
INSERT INTO projects VALUES (104, 'Cloud Migration', 4, 'Pending');
INSERT INTO projects VALUES (105, 'Training Module', 5, 'Complete');

-- 1. SELECT all employees
SELECT * FROM employees;

-- 2. SELECT specific columns
SELECT name, department FROM employees;

-- 3. WHERE with AND / OR
SELECT * FROM employees WHERE department = 'HR' AND salary > 38000;
SELECT * FROM employees WHERE department = 'IT' OR department = 'Finance';

-- 4. LIKE
SELECT * FROM employees WHERE name LIKE '%a%';

-- 5. BETWEEN
SELECT * FROM employees WHERE salary BETWEEN 40000 AND 60000;

-- 6. ORDER BY
SELECT * FROM employees ORDER BY salary ASC;
SELECT * FROM employees ORDER BY name DESC;

-- 7. LIMIT
SELECT * FROM employees LIMIT 3;

-- 8. IN vs =
SELECT * FROM employees WHERE department = 'HR';
SELECT * FROM employees WHERE department IN ('IT', 'Finance');

-- 9. Aliasing
SELECT name AS Employee_Name, salary AS Monthly_Salary FROM employees;

-- 10. DISTINCT
SELECT DISTINCT department FROM employees;

-- 11. JOIN with projects table
SELECT e.name, p.project_name, p.status
FROM employees e
JOIN projects p ON e.id = p.emp_id;

-- 12. Projects with status 'Ongoing'
SELECT * FROM projects WHERE status = 'Ongoing';

-- 13. All project names in descending order
SELECT project_name FROM projects ORDER BY project_name DESC;

-- 14. Projects assigned to employees from HR department
SELECT p.project_name, e.name
FROM projects p
JOIN employees e ON p.emp_id = e.id
WHERE e.department = 'HR';