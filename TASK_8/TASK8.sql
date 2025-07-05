-- Drop if exists
DROP TABLE IF EXISTS Student;
DROP PROCEDURE IF EXISTS GetTopStudents;
DROP FUNCTION IF EXISTS GetGrade;

-- Create the Student table
CREATE TABLE Student (
student_id INT PRIMARY KEY,
name VARCHAR(100),
marks INT
);

-- Insert sample data
INSERT INTO Student (student_id, name, marks) VALUES
(1, 'Anita', 82),
(2, 'Ravi', 90),
(3, 'Geeta', 70),
(4, 'Aman', 45),
(5, 'Sita', 95);

-- Create stored procedure to get students above a certain mark
DELIMITER //

CREATE PROCEDURE GetTopStudents(IN min_marks INT)
BEGIN
SELECT * FROM Student WHERE marks >= min_marks;
END //

-- Create function to return grade based on marks
CREATE FUNCTION GetGrade(score INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
DECLARE grade VARCHAR(10);

IF score >= 90 THEN
SET grade = 'A+';
ELSEIF score >= 75 THEN
SET grade = 'A';
ELSEIF score >= 60 THEN
SET grade = 'B';
ELSEIF score >= 40 THEN
SET grade = 'C';
ELSE
SET grade = 'F';
END IF;

RETURN grade;
END //

DELIMITER ;

-- 🔽 Call the stored procedure (example)
CALL GetTopStudents(80);

-- 🔽 Use the function (example)
SELECT name, marks, GetGrade(marks) AS grade FROM Student;