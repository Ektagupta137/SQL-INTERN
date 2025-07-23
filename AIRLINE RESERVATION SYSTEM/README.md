Project Report: Airline Reservation System (SQL Project)

Objective:
To design and implement a relational database for managing flight schedules, customer records, bookings, and seat availability using SQL.

Tools Used:
- MySQL Workbench

-----------------------------------------------------------
Database Schema Design:

1. Customers Table
CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
phone VARCHAR(15)
);

2. Flights Table
CREATE TABLE Flights (
flight_id INT PRIMARY KEY,
flight_number VARCHAR(10),
origin VARCHAR(50),
destination VARCHAR(50),
departure_time DATETIME,
arrival_time DATETIME
);

3. Seats Table
CREATE TABLE Seats (
seat_id INT PRIMARY KEY,
flight_id INT,
seat_number VARCHAR(10),
is_booked BOOLEAN DEFAULT FALSE,
FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

4. Bookings Table
CREATE TABLE Bookings (
booking_id INT PRIMARY KEY,
customer_id INT,
flight_id INT,
seat_id INT,
booking_time DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);

-----------------------------------------------------------
Sample Data Insertion:

-- Insert Customers
INSERT INTO Customers VALUES (1, 'John Doe', 'john@example.com', '1234567890');
INSERT INTO Customers VALUES (2, 'Jane Smith', 'jane@example.com', '9876543210');

-- Insert Flights
INSERT INTO Flights VALUES 
(101, 'AI202', 'Delhi', 'Mumbai', '2025-08-01 10:00:00', '2025-08-01 12:00:00'),
(102, 'AI303', 'Mumbai', 'Bangalore', '2025-08-02 14:00:00', '2025-08-02 16:30:00');

-- Insert Seats
INSERT INTO Seats VALUES 
(1, 101, '1A', FALSE),
(2, 101, '1B', FALSE),
(3, 102, '1A', FALSE),
(4, 102, '1B', FALSE);

-- Insert Booking and Update Seat Status
INSERT INTO Bookings VALUES (1, 1, 101, 1, '2025-07-23 09:00:00');
UPDATE Seats SET is_booked = TRUE WHERE seat_id = 1;

-----------------------------------------------------------
SQL Queries:

-- 1. View Available Seats for a Flight
SELECT seat_number
FROM Seats
WHERE flight_id = 101 AND is_booked = FALSE;

-- 2. Search Flights by Route
SELECT *
FROM Flights
WHERE origin = 'Delhi' AND destination = 'Mumbai';

-- 3. Generate Booking Summary Report
SELECT 
B.booking_id,
C.name AS customer_name,
F.flight_number,
F.origin,
F.destination,
S.seat_number,
B.booking_time
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
JOIN Flights F ON B.flight_id = F.flight_id
JOIN Seats S ON B.seat_id = S.seat_id;

-----------------------------------------------------------
Trigger:

-- Trigger to Update Seat Status After Booking
DELIMITER //
CREATE TRIGGER AfterBooking
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
UPDATE Seats SET is_booked = TRUE WHERE seat_id = NEW.seat_id;
END;
//
DELIMITER ;

-----------------------------------------------------------
Deliverables:
- Database Schema (CREATE TABLE statements)
- Insert Queries
- Queries for available seats and booking report
- Trigger to automate seat update
- Summary report using JOINs

-----------------------------------------------------------
Outcome:
This project simulates a real-world airline booking system. It improves understanding of schema design, relational queries, normalization, and SQL triggers.

Developer: Ekta Gupta
