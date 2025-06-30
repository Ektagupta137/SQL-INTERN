-- Create Customers table 
CREATE TABLE Customers ( CustomerID INT PRIMARY KEY, CustomerName VARCHAR(50), ContactName VARCHAR(50), Country VARCHAR(50) );

-- Create Orders table 
CREATE TABLE Orders ( OrderID INT PRIMARY KEY, CustomerID INT, OrderDate DATE, Amount DECIMAL(10,2), FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) );

-- Insert data 
INSERT INTO Customers VALUES (1, 'John Doe', 'John', 'USA'), (2, 'Jane Smith', 'Jane', 'UK'), (3, 'Mike Brown', 'Mike', 'Canada'), (4, 'Sara Lee', 'Sara', 'Australia');

INSERT INTO Orders VALUES (101, 1, '2024-06-01', 250.00), (102, 1, '2024-06-15', 450.00), (103, 2, '2024-06-17', 150.00), (104, 3, '2024-06-20', 300.00);

-- INNER JOIN 
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN 
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN 
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- FULL OUTER JOIN (MySQL workaround) 
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID UNION SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;