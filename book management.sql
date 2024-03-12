-- Create the database
CREATE DATABASE IF NOT EXISTS BookstoreDB;
USE BookstoreDB;

-- Create the Authors table
CREATE TABLE IF NOT EXISTS Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(255) NOT NULL,
    Country VARCHAR(255)
);

-- Create the Books table
CREATE TABLE IF NOT EXISTS Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT,
    Price DECIMAL(10, 2),
    Quantity INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create the Customers table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(20)
);

-- Insert sample data into Authors table
INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES
(1, 'George Orwell', 'United Kingdom'),
(2, 'Harper Lee', 'United States'),
(3, 'F. Scott Fitzgerald', 'United States'),
(4, 'Jane Austen', 'United Kingdom'),
(5, 'J.K. Rowling', 'United Kingdom');

-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone) VALUES
(1, 'Alice Smith', 'alice@example.com', '123-456-7890'),
(2, 'Bob Johnson', 'bob@example.com', '456-789-0123'),
(3, 'Charlie Brown', 'charlie@example.com', '789-012-3456');

-- Insert sample data into Books table
INSERT INTO Books (BookID, Title, AuthorID, Price, Quantity) VALUES
(1, '1984', 1, 12.99, 50),
(2, 'To Kill a Mockingbird', 2, 10.99, 75),
(3, 'The Great Gatsby', 3, 9.99, 60),
(4, 'Pride and Prejudice', 4, 11.99, 80),
(5, 'Harry Potter and the Philosopher''s Stone', 5, 15.99, 100);

-- Retrieve all books
SELECT * FROM Books;

-- Retrieve all authors
SELECT * FROM Authors;

-- Retrieve all customers
SELECT * FROM Customers;

-- Update the price of a book
UPDATE Books SET Price = 14.99 WHERE BookID = 5;

-- Update the email of a customer
UPDATE Customers SET Email = 'alice.smith@example.com' WHERE CustomerID = 1;

-- Delete a book
DELETE FROM Books WHERE BookID = 1;

-- Delete a customer
DELETE FROM Customers WHERE CustomerID = 3;

-- Retrieve books with author names using INNER JOIN
SELECT Books.Title, Authors.AuthorName
FROM Books
INNER JOIN Authors ON Books.AuthorID = Authors.AuthorID;
