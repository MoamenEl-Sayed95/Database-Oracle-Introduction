-- PL/SQL Subqueries

-- Syntax

SELECT column_name
FROM table_name
WHERE column_name = (SELECT column_name FROM another_table WHERE condition);

-- Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location_id INT
);

INSERT INTO departments (department_id, department_name, location_id)
VALUES
    (1, 'HR', 100),
    (2, 'IT', 200),
    (3, 'Finance', 100),
    (4, 'Marketing', 300),
    (5, 'Operations', 200);

-- Employees Table

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (employee_id, employee_name, department_id, salary)
VALUES
    (1, 'John Doe', 1, 5000),
    (2, 'Jane Smith', 2, 7000),
    (3, 'Sam Brown', 3, 6000),
    (4, 'Lisa White', 1, 5500),
    (5, 'Tom Johnson', 4, 7500),
    (6, 'Nancy Allen', 2, 7200),
    (7, 'Steve Adams', 5, 6300),
    (8, 'Mike Taylor', 3, 5800),
    (9, 'Sophie King', 1, 5200);


-- 1. Single-Row Subquery
SELECT employee_name
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = 100);

-- 2. Multiple-Row Subquery

SELECT employee_id, employee_name, salary
FROM employees
WHERE department_id IN (
  SELECT department_id
  FROM departments
  WHERE location_id = 200
);

--3. Correlated Subquery

SELECT employee_name
FROM employees emp
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = emp.department_id);

--4. Nested Subquery

SELECT employee_name
FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE location_id = (SELECT location_id FROM locations WHERE city = 'New York');

-- Scalar Subquery

SELECT employee_name,
(SELECT department_name FROM departments WHERE department_id = employees.department_id) AS department_name
FROM employees;

-- Subqueries in the SELECT Clause

SELECT employee_name, 
       (SELECT department_name 
        FROM departments 
        WHERE department_id = employees.department_id) AS department_name
FROM employees;

-- Subqueries in the FROM Clause

SELECT e.employee_name, avg_salary
FROM employees e,
     (SELECT department_id, AVG(salary) AS avg_salary 
      FROM employees 
      GROUP BY department_id) avg_dept
WHERE e.department_id = avg_dept.department_id;

-- Subqueries with WHERE Clause

SELECT employee_name
FROM employees
WHERE department_id = (SELECT department_id 
                       FROM departments 
                       WHERE department_name = 'Sales');