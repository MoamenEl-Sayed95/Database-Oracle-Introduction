/*
 What are Views in Oracle PL/SQL?
 A PL/SQL view is a virtual table produced by a stored query. 
 Unlike the real tables that hold the data, views never save data by themselves.
 Views exactly create the dynamic view of data that comes from one or multiple tables. 
 A view behaves like a saved query, which enables easy access to data as it encapsulates all complex join, aggregations, and filters in one object.
 */

 -- Set Up the Environment
 -- Let's consider one table called employee which we will use as an 
 -- example for understanding the view in a better manner.

 CREATE TABLE employee (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employee (employee_id, first_name, last_name, department, salary) VALUES
(1, 'John', 'Smith', 'Sales', 50000),
(2, 'Alice', 'Johnson', 'Marketing', 55000),
(3, 'Michael', 'Williams', 'IT', 60000),
(4, 'Emily', 'Brown', 'Human Resources', 48000),
(5, 'David', 'Jones', 'Finance', 62000),
(6, 'Sarah', 'Martinez', 'Operations', 53000);

--1. Creating a View in Oracle PL/SQL

--Example: Creating a Simple View

CREATE VIEW employee_view AS 
SELECT employee_id, first_name, last_name, department 
FROM 
employee;

--2. Updating a View in Oracle PL/SQL

UPDATE employee_view
SET department = 'Customer Service'
WHERE employee_id = 1;

--3. Dropping a View in Oracle PL/SQL

DROP VIEW employee_view;

--Output:

Error : no such table: employee_view