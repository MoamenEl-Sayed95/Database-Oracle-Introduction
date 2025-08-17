-- Procedure

-- A Procedure in PL/SQL is a named subprogram unit that consists of a group of PL/SQL statements. There are two types of PL/SQL blocks: anonymous and named.

-- An anonymous block is a block of code that is compiled each time it is issued. It is not stored in the database and it cannot be invoked from another PL/SQL block of code.
-- A named block is the block of code that is compiled and stored in the database and can be called by another block of code.

-- Characteristics of Procedure block in PL/SQL:

-- 1. PL/SQL procedure contains declaration part (optional), execution part, exception handling part (optional).
-- 2. It can have three types of parameters – IN, OUT, or IN OUT.
-- 3. A Procedure in SQL can have a RETURN statement to return the control to the calling block, but it cannot return any values through the RETURN statement.

-- Types of Parameters in PL/SQL code:

-- 1. IN Parameter: It is used to pass input values to the program and the value of this parameter cannot be changed during its execution inside the program.
-- 2. OUT parameter: It is used to pass output values to the program and the value of this parameter can be changed during its execution inside the program.
-- 3. IN OUT parameter: It is used for both giving input and for getting output from the program and the value of this parameter can be changed during its execution inside the program.

-- Syntax of a procedure:

CREATE OR REPLACE PROCEDURE <procedure_name> (
	<param_name> IN/OUT/IN OUT <datatype>
	........
	) IS/AS
	/* Declarative section is here */
BEGIN
	/* Executable section is here */
EXCEPTION
	/* Exception section is here */
END [procedure_name];

-----------------------------------------------------------

-- Example: Procedure to calculate the bonus of an employee

CREATE OR REPLACE PROCEDURE calculate_bonus(
    emp_id IN NUMBER,           -- Input parameter: Employee ID
    salary IN NUMBER,           -- Input parameter: Employee salary
    bonus OUT NUMBER            -- Output parameter: Calculated bonus
)
IS
BEGIN
    -- Executable section
    IF salary < 0 THEN
        -- Raise an exception if salary is invalid
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative');
    ELSE
        -- Calculate 10% bonus
        bonus := salary * 0.10;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        -- Handle any other exceptions
        bonus := 0;
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END calculate_bonus;
/

---------------------------------------------------------

DECLARE
    emp_bonus NUMBER;
BEGIN
    -- Call the procedure
    calculate_bonus(emp_id => 101, salary => 5000, bonus => emp_bonus);
    DBMS_OUTPUT.PUT_LINE('Calculated Bonus: ' || emp_bonus);
END;
/