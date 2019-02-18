/*Create a database called umuzi and use it*/
CREATE DATABASE Umuzi;
USE Umuzi;

/*Create a table for cusomer*/
CREATE TABLE customer(customerID INTEGER auto_increment PRIMARY KEY,
                        FirstName VARCHAR,
                        LastName VARCHAR,
                        Gender VARCHAR,
                        Address VARCHAR,
                        Phone INTEGER(10),
                        Email VARCHAR(100),
                        City VARCHAR,
                        Country VARCHAR
                        );

/*Create a table for employees*/
CREATE TABLE Employees(EmployeeID INTEGER auto_increment PRIMARY KEY,
                        FirstName VARCHAR(50),
                        LastName VARCHAR(50),
                        Email VARCHAR(100),
                        JobTitle VARCHAR(50)
                        );

/*Create a table for orders*/
CREATE TABLE Orders(OrderId INTEGER auto_increment PRIMARY KEY,
                    OrderDate DATETIME,
                    RequiredDate DATETIME,
                    ShippedDate DATETIME,
                    Status VARCHAR(50)
                    );

/*Create a table for payments*/
CREATE TABLE Payments(PaymentsID INTEGER auto_increment PRIMARY KEY,
                    CustomerId INTEGER,
                    PaymentDate DATETIME,
                    Amount DECIMAL,
                    FOREIGN KEY customID(CustomerId) REFERENCES Payments(PaymentID)
                    );

/*Create a table for products*/
CREATE TABLE Products(ProductsId INTEGER auto_increment PRIMARY KEY,
                    ProductName VARCHAR(50),
                    Description VARCHAR(100),
                    BuyPrice DECIMAL
                    );

/*inserting data into Customer's Table*/
INSERT INTO customers VALUES
    (1, 'John', 'Hibert', 'Male', '284 Chaucer st', 084789657, 'john@gmail.com', 'Johannesburg', 'South Africa'),
    (2, 'Thando', 'Sithole', 'Female', '240 Sect 1', 0794445584, 'thando@gmail.com', 'Cape Town', 'South Africa'),
    (3, 'Leon', 'Glen', 'Male', '81 Everton Rd Gillits', 0820832830, 'Leon@gmail.com', 'Durban', 'South Africa'),
    (4, 'Charl', 'Muller', 'Male', '290A Dorset Ecke', +4485687255, 'Charl.muller@gmail.com', 'Berlin', 'Germany'),
    (5, 'julia', 'Stein', 'Female', '2 Wernerring', +4486724458, 'Js234@yahoo.com', 'Frankfurt', 'Germany');

/*inserting data into Employees Table*/
INSERT INTO Employees VALUES
    (1, 'Kani', 'Matthew', 'Kmat@gmail.com', 'Manager'),
    (2, 'Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk'),
    (3, 'Gideon', 'Maduku', 'Gm@gmail.com', 'Accountant');

/*inserting data into Orders Table*/
INSERT INTO Orders VALUES
    (1, '2018-09-01', '2018-09-05', '2018-09-02', 'Not Shipped'),
    (2, '2018-09-01', '2018-09-04', '2018-09-03', 'Shipped'),
    (3, '2018-09-01', '2018-09-03', '2018-09-02', 'Not Shipped');

/*inserting data into Payments Table*/
INSERT INTO Payments VALUES
    (1, 1, '2018-09-01', 100.00),
    (2, 2, '2018-09-01', 250.75);

/*inserting data into Products Table*/
INSERT INTO Products VALUES
    (1, 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75),
    (2, 'Classic Car', 'Turnable front wheels, steering function', 550.75),
    (3, 'Sports Car', 'Turnable front wheels, steering function', 700.60);

/*Get all records from the customer table*/
SELECT * FROM customer;

/*Get only the first names from the customer table*/
SELECT FirstName FROM customer;

/*Get a name from the customers table at a specific row*/
SELECT FirstName FROM customer WHERE customerID=1;


/*Update first and last name at a specific row*/
UPDATE Customers SET FirstName='Lerato', LastName='Mabitso' WHERE CustomerID=2;

/*Delete a specific row from customers*/
DELETE FROM customer WHERE customerID=2;

/*Get all unique values from the products table*/
SELECT DISTINCT * FROM Products;

/*Get the maximun price from the products table*/
SELECT MAX(Amount) FROM Payments;

/*Get all details from the custormers ordered by country*/
SELECT * FROM customer ORDER BY country;

/*Select details where the price is between R100 and R600*/
SELECT * FROM Products WHERE BuyPrice BETWEEN 100 AND 600;

/*Select all details at where city is Durban and Cape Town*/
SELECT * FROM Customers WHERE Country='Germany' AND City='Berlin';

/*Select all details at where city is Durban or Cape Town*/
SELECT * FROM customer WHERE City='Cape Town' OR City='Durban';

/*Select all details where price is more that 500*/
SELECT * FROM Products WHERE BuyPrice>500;

/*get the sum of all values in the amount field*/
SELECT SUM(Amount) FROM Payments;

/*Occurence of the status shipped orders*/
SELECT COUNT(Status) FROM Orders WHERE Status='Shipped';

/*Average of the price in Rands and Dollars*/
SELECT CONCAT('$', FORMAT(AVG(BuyPrice * 12), 2)) AS 'Dollar Price', CONCAT ('R', FORMAT(AVG(BuyPrice), 2)) AS 'Rand Price' FROM Products;

/*Get details of all orders with customer information*/
SELECT Orders.OrderId, customer.FirstName, customer.LastName, customer.Email FROM Orders INNER JOIN customer ON Orders.OrderId=customer.customerID;


