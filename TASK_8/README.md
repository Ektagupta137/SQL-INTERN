# Task 8 – Stored Procedures and Functions

*Objective:* Learn to write and use stored procedures and functions in MySQL.


## 🛠 Tools Used
- DB Browser for SQLite 


## What I Did

### 📌 1. Created a Student Table
Includes:
- student_id (INT, Primary Key)
- name (VARCHAR)
- marks (INT)

### 📌 2. Inserted Sample Data
Added five students with different marks.

### 📌 3. Created a Stored Procedure: GetTopStudents(min_marks)
- Accepts a minimum mark value as input
- Displays students whose marks are *greater than or equal to* the input

```sql
CALL GetTopStudents(80);