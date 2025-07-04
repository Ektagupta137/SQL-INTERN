# Task 7: Creating Views (SQL Developer Internship)

## Objective
Learn to create and use SQL views for abstraction, reusability, and data security.

##  Tools Used
- DB Browser for SQLite 
---

## 📋 Description
This task demonstrates the creation and usage of different types of views in SQL using a simple *Employee-Department* schema.

---

## 📁 Files Included
- task7.sql: Full SQL code containing:
- Table creation
- Sample data
- Multiple views
- Queries and insert statements

---

##  Views Created

1. ### high_salary_employees
- *Description:* Lists employees with a salary greater than 70000.
- *Purpose:* Filtering data using a view.
- *Query Example:*
sql
SELECT * FROM high_salary_employees;


2. ### employee_department_view
- *Description:* Combines employee and department info using a JOIN.
- *Purpose:* Abstract JOIN logic into a reusable view.
- *Query Example:*
sql
SELECT * FROM employee_department_view;


3. ### finance_only
- *Description:* Shows only Finance department employees.
- *Note:* WITH CHECK OPTION is not supported in SQLite.
- *Query Example:*
sql
SELECT * FROM finance_only;


4. ### avg_salary_by_dept
- *Description:* Shows the average salary for each department.
- *Purpose:* Use of aggregation in views.
- *Query Example:*
sql
SELECT * FROM avg_salary_by_dept;