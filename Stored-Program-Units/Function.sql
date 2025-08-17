-- What is a Function?

/*
A Function is a standalone program and is very similar to a procedure.
Both take parameters, which can be of any mode.
Both are different forms of PL/SQL blocks, with declarative, executable, and exception sections. Both can be stored in the database or declared within a block.
However, a procedure call is a PL/SQL statement by itself, while a function call is called as part of an expression.
In function, RETURN is mandatory, it either returns a value or raises an Exception. 
*/

-- Syntax of a function:

CREATE OR REPLACE FUNCTION <function_name> (
	<param_name> IN/OUT <datatype>
	............
	) RETURN <datatype> [ IS | AS ]
	/* Declarative section is here */
BEGIN
	/* Executable section is here */
EXCEPTION
	/* Exception section is here */
END;


-- Example: Function to calculate the yearly salary of an employee

CREATE OR REPLACE FUNCTION calculate_yearly_salary(
    emp_salary IN NUMBER  -- Input parameter: monthly salary
) RETURN NUMBER           -- Return type: yearly salary
IS
    yearly_salary NUMBER;
BEGIN
    -- Executable section
    IF emp_salary < 0 THEN
        -- Raise an exception if salary is invalid
        RAISE_APPLICATION_ERROR(-20002, 'Salary cannot be negative');
    ELSE
        -- Calculate yearly salary
        yearly_salary := emp_salary * 12;
    END IF;

    RETURN yearly_salary;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        RETURN 0;  -- Return 0 in case of error
END calculate_yearly_salary;
/

------------------------------------------------------------

DECLARE
    yearly_sal NUMBER;
BEGIN
    -- Call the function
    yearly_sal := calculate_yearly_salary(5000);
    DBMS_OUTPUT.PUT_LINE('Yearly Salary: ' || yearly_sal);
END;
/