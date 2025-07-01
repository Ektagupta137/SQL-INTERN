-- Create tables
CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
salary INT,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert sample data
INSERT INTO Departments VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO Employees VALUES
(101, 'Alice', 50000, 1),
(102, 'Bob', 60000, 2),
(103, 'Charlie', 55000, 1),
(104, 'David', 80000, 2),
(105, 'Eve', 45000, 3);

-- 1. Subquery in SELECT: Show all employees with department name
SELECT 
emp_name,
salary,
(SELECT dept_name FROM Departments WHERE dept_id = Employees.dept_id) AS department
FROM Employees;

-- 2. Subquery in WHERE: Employees with salary > average salary
SELECT * FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- 3. Subquery using IN: Employees in IT and HR departments
SELECT emp_name FROM Employees
WHERE dept_id IN (SELECT dept_id FROM Departments WHERE dept_name IN ('HR', 'IT'));

-- 4. Subquery using EXISTS: Employees in departments that have more than 1 employee
SELECT * FROM Employees E
WHERE EXISTS (
SELECT 1 FROM Employees E2
WHERE E2.dept_id = E.dept_id AND E2.emp_id != E.emp_id
);

-- 5. Scalar subquery: Show employee with highest salary
SELECT emp_name, salary FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);

-- 6. Correlated subquery: Employees whose salary is above the average of their department
SELECT * FROM Employees E1
WHERE salary > (
SELECT AVG(salary) FROM Employees E2
WHERE E1.dept_id = E2.dept_id
);

-- 7. Subquery in FROM: Average salary per department
SELECT D.dept_name, A.avg_salary
FROM Departments D
JOIN (
SELECT dept_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY dept_id
) A ON D.dept_id = A.dept_id;