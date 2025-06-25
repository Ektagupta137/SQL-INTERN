-- Create Table
CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    department TEXT,
    salary REAL DEFAULT 30000,
    joining_date DATE
);

-- Insert Data

-- 1. Full data insertion
INSERT INTO employees (id, name, age, department, salary, joining_date)
VALUES (1, 'Ravi', 25, 'HR', 35000, '2022-01-15');

-- 2. Insert with NULLs
INSERT INTO employees (id, name, age, department, salary, joining_date)
VALUES (2, 'Priya', NULL, 'IT', NULL, NULL);

-- 3. Partial insert using default salary
INSERT INTO employees (id, name, age, department)
VALUES (3, 'Amit', 30, 'Finance');

-- 4. Insert more data
INSERT INTO employees (id, name, age, department, salary, joining_date)
VALUES (4, 'Neha', 28, 'IT', 40000, '2023-03-01');

INSERT INTO employees (id, name, age, department, salary, joining_date)
VALUES (5, 'Arjun', 35, 'Marketing', 45000, '2021-06-18');

-- View data
SELECT * FROM employees;

-- Update Statement

-- Update salary of IT department employees
UPDATE employees
SET salary = 42000
WHERE department = 'IT';

-- Update multiple fields
UPDATE employees
SET age = 29, department = 'Operations'
WHERE id = 2;

-- Delete Statement

-- Delete one employee
DELETE FROM employees
WHERE id = 5;

-- Handle NULLs

-- Select employees with NULL salary
SELECT * FROM employees
WHERE salary IS NULL;

-- Select employees with known salary
SELECT * FROM employees
WHERE salary IS NOT NULL;

-- Insert using SELECT
INSERT INTO employees (id, name, age, department, salary, joining_date)
SELECT 6, 'Deepak', 27, department, salary, '2024-01-01'
FROM employees
WHERE id = 1;

-- Optional: Rollback simulation (works only in transactions or in supported tools)
-- START TRANSACTION;
-- DELETE FROM employees WHERE id = 4;
-- ROLLBACK;

-- ON DELETE CASCADE demonstration (if foreign keys are used)
-- Create dependent table with FK
CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY,
    emp_id INTEGER,
    date DATE,
    status TEXT,
    FOREIGN KEY (emp_id) REFERENCES employees(id) ON DELETE CASCADE
);

-- Insert dependent data
INSERT INTO attendance (attendance_id, emp_id, date, status)
VALUES (1, 1, '2024-06-01', 'Present'),
       (2, 1, '2024-06-02', 'Absent');

-- Delete employee id 1 and check if attendance is also deleted
-- DELETE FROM employees WHERE id = 1;

-- Final SELECTs to check data
SELECT * FROM employees;
SELECT * FROM attendance;