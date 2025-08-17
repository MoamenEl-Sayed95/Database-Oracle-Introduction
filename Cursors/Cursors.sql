/*
=======================
-- Cursors in PL/SQL --
=======================
*/

-- A Cursor in PL/SQL is a pointer to a context area that stores the result set of a query.

-- Cursor Actions

-- Key actions involved in working with cursors in PL/SQL are:


-- 1. Declare Cursor: A cursor is declared by defining the SQL statement that returns a result set.
-- 2. Open: A Cursor is opened and populated by executing the SQL statement defined by the cursor.
-- 3. Fetch: When the cursor is opened, rows can be fetched from the cursor one by one or in a block to perform data manipulation.
-- 4. Close: After data manipulation, close the cursor explicitly.
-- 5. Deallocate: Finally, delete the cursor definition and release all the system resources associated with the cursor.

-- Types of Cursors in PL/SQL

-- Cursors are classified depending on the circumstances in which they are opened.

/* 

Implicit Cursor: If the Oracle engine opened a cursor for its internal processing it is known as an Implicit Cursor. 
It is created "automatically" for the user by Oracle when a query is executed and is simpler to code.
Explicit Cursor: A Cursor can also be opened for processing data through a PL/SQL block, on demand.
Such a user-defined cursor is known as an Explicit Cursor.

*/

-- Explicit cursor

-- An explicit cursor is defined in the declaration section of the PL/SQL Block. It is created on a SELECT Statement which returns more than one row.

-- Syntax for creating cursor

CURSOR cursor_name IS select_statement;

-- Where,

-- cursor_name: A suitable name for the cursor.
-- select_statement: A select query which returns multiple rows


-- How to use Explicit Cursor?

There are four steps in using an Explicit Cursor.

-- 1. DECLARE the cursor in the Declaration section.
-- 2. OPEN the cursor in the Execution Section.
-- 3. FETCH the data from the cursor into PL/SQL variables or records in the Execution Section.
-- 4. CLOSE the cursor in the Execution Section before you end the PL/SQL Block.

-- Syntax

-- General Syntax of using an explicit cursor in PL/SQL is:

DECLARE
  variables;
  records;
  CURSOR cursor_name IS select_statement;
BEGIN
  OPEN cursor_name;
  LOOP
    FETCH cursor_name INTO variables OR records;
    EXIT WHEN cursor_name%NOTFOUND;
    
    process the records;
  END LOOP;
  CLOSE cursor_name;
END;

-- Example

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR2(50),
  salary NUMBER(10,2),
  department_id INT
);

INSERT INTO employees VALUES (1, 'Ali', 5000, 10);
INSERT INTO employees VALUES (2, 'Sara', 6000, 10);
INSERT INTO employees VALUES (3, 'Omar', 4500, 20);
INSERT INTO employees VALUES (4, 'Mona', 7000, 10);
INSERT INTO employees VALUES (5, 'Hassan', 5500, 30);

COMMIT;

DECLARE
  v_id     employees.employee_id%TYPE;
  v_name   employees.first_name%TYPE;
  v_salary employees.salary%TYPE;

  CURSOR emp_cursor IS
    SELECT employee_id, first_name, salary
    FROM employees
    WHERE department_id = 10;
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor INTO v_id, v_name, v_salary;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ' | Name: ' || v_name || ' | Salary: ' || v_salary);
  END LOOP;
  CLOSE emp_cursor;
END;
/