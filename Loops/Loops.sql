/*
==================
-- PL/SQL Loops --
==================
*/

https://media.geeksforgeeks.org/wp-content/uploads/20230424101737/continue-in-C.webp

-- Syntax

LOOP
   -- Code block to be executed repeatedly
END LOOP;

-- EXIT Statement

LOOP
   -- Code block
   IF condition THEN
      EXIT;
   END IF;
END LOOP;

-- Example of PL/SQL LOOP with Conditional EXIT

DECLARE
  counter NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('This is iteration number ' || counter);
    IF counter = 3 THEN
      EXIT;
    END IF;
    counter := counter + 1;
  END LOOP;
END;
/

/*
Explanation:
Initially counter variable is set to 1.
The LOOP statement repeatedly executes the code block within it.
Inside the loop, DBMS_OUTPUT.PUT_LINE is used to print Iteration number (value of counter).
The counter is incremented by 1 in each iteration.
IF statement is executed when the value of counter will become 3 and The EXIT statement is executed and loop stops.
*/

-- EXIT WHEN Statement

-- Syntax

LOOP
    -- Code block
    EXIT WHEN condition;
END LOOP;

-- Example of PL/SQL LOOP with EXIT WHEN

DECLARE
   counter NUMBER := 1;  -- Initialization of the counter variable

BEGIN
   -- Loop that prints "GeeksForGeeks" five times
   LOOP
      DBMS_OUTPUT.PUT_LINE('GeeksForGeeks');

      counter := counter + 1;  -- Increment the counter

      EXIT WHEN counter > 5;  -- Exit the loop when counter exceeds 5
   END LOOP;
END;
/

/*
Explanation:

Initially counter variable is set to 1.
The LOOP statement repeatedly executes the code block within it.
Inside the loop, DBMS_OUTPUT.PUT_LINE is used to print "GeeksForGeeks".
The counter is incremented by 1 in each iteration.
The EXIT WHEN statement is executed when the loop when the counter exceeds 5.

*/

-- Nested Loops

/*
Nested Loop is a Loop inside Loop and PL/SQL supports nested loops that allows you to have multiple levels of iteration within a program.
This is achieved by placing one or more LOOP statements inside another. 
Each nested loop has its own set of loop control statements.
*/

-- Syntax

-- Outer Loop
LOOP
     -- Code block
     -- Inner Loop
     LOOP
         -- Inner loop code block
         EXIT WHEN inner_condition;
     END LOOP;
   EXIT WHEN outer_condition;
END LOOP;

-- Example of PL/SQL Nested FOR Loop Simultaneous Iteration

DECLARE
  outer_counter NUMBER := 1;
  inner_counter NUMBER := 1;
BEGIN
  FOR outer_counter IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE('Outer Loop - Iteration ' || outer_counter);
    
    FOR inner_counter IN 1..2 LOOP
      DBMS_OUTPUT.PUT_LINE('Inner Loop - Iteration ' || inner_counter);
    END LOOP;
  END LOOP;
END;
/

-- Explanation:

/* 
There are two nested loops
The outer FOR loop (FOR outer_counter IN 1..3 LOOP) runs three times.
Inside the outer FOR loop, there is an inner FOR loop (FOR inner_counter IN 1..2 LOOP) that runs two times for each iteration of the outer loop.
DBMS_OUTPUT.PUT_LINE statements is used to print output.
*/

/*
=======================
-- PL/SQL While Loop --
=======================
*/

/*WHILE condition
LOOP
   -- Statements to be executed as long as the condition is true
END LOOP;
*/

-- Examples of PL/SQL WHILE Loop

-- Example 1: Using PL/SQL WHILE Loop for Iterative Execution

DECLARE
   counter NUMBER := 1;  -- Initialize a counter variable
BEGIN
   -- Start the WHILE loop
   WHILE counter <= 5  -- Condition to check
   LOOP
      -- Statements to be executed as long as the condition is true
      DBMS_OUTPUT.PUT_LINE('Counter value: ' || counter);
      
      -- Increment the counter
      counter := counter + 1;
   END LOOP;  -- End of the loop
END;
/

-- Example 2: Using EXIT WHEN for Loop Termination

DECLARE
   total_sum NUMBER := 0;  -- Initialize a variable to store the sum
   current_number NUMBER := 1;  -- Initialize a variable for the loop
BEGIN
   -- Start the WHILE loop with EXIT WHEN statement
   WHILE total_sum < 10
   LOOP
      -- Add the current number to the total sum
      total_sum := total_sum + current_number;

      -- Display the current state
      DBMS_OUTPUT.PUT_LINE('Current Number: ' || current_number);
      DBMS_OUTPUT.PUT_LINE('Total Sum: ' || total_sum);
      
      -- Increment the current number
      current_number := current_number + 1;

      -- Exit the loop when the total sum exceeds or equals 10
      EXIT WHEN total_sum >= 10;
   END LOOP;  -- End of the loop
END;
/

/*
=====================
-- PL/SQL For Loop --
=====================
*/


/*
FOR LOOP in PL/SQL
Along with SQL queries PL/SQL supports looping. 
FOR loop is a type of control statement. 
It is used to perform repetitive tasks. 
It is used to execute the set of statements for a specific number of times. 
To execute for loop, start and end values are provided. 
During each iteration counter is incremented by 1.
*/

-- Syntax

DECLARE
        --declare loop variable and provide its datatype
loop_varaible datatype;
BEGIN
        --for loop with start and end value
FOR loop_variable in start_value .. end_value LOOP
set of statements 
END LOOP;
END;
/

-- Example: Print Number From 1 to 5 Using FOR Loop in PL/SQL

SET SERVEROUTPUT ON;
DECLARE
counter NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE('PL/SQL FOR LOOP EXECUTION');
FOR counter IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('COUNTER VALUE: '|| counter);
END LOOP;
END;
/

https://media.geeksforgeeks.org/wp-content/uploads/20240113215227/PLSQL-FOR-LOOP.jpeg

-- PL/SQL NESTED FOR LOOP

/*
PL/SQL supports nested for loop.
The nested for loop contains an outer loop and one or more inner loop.
For each increment of the loop variable , of the outer loop, the inner loops executes the set of statements within it for a specific number of times.
This process repeats until loop variable of outer loop reaches its end value.
Nested for loops are used for executing complex operations, designing patterns, and many more operations.
*/

-- Syntax

BEGIN
          --outer loop 
FOR loop_variable1 IN start_value1 ..end_value1 LOOP
          --inner loop
FOR  loop_variable2 IN start_value2 ..end_value2 LOOP
          --set of statements 
END LOOP;
          --inner loop end
END LOOP;
          --outer loop end
END;
/

-- Example: Using Nested FOR Loops to Print a Pattern

-- In this example, we will print the numbers 1, 2, and 3 in a pattern using nested loops.

SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('PL/SQL NESTED FOR LOOP EXECUTION');
    FOR counter IN 1..3 LOOP
        FOR counter1 IN 1..3 LOOP
            DBMS_OUTPUT.PUT( counter1);
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END;
/

https://media.geeksforgeeks.org/wp-content/uploads/20240113225354/PLSQL-NESTED-FOR-LOOP.jpeg

-- Using the REVERSE Keyword in a PL/SQL FOR Loop

/* 
Reverse keyword is used in FOR loop to iterate from end value to start value.
REVERSE keyword is mentioned before the start value.
*/

-- Syntax

BEGIN
FOR loop_variable IN REVERSE start_value .. end_value  LOOP
    set_of_statements
END LOOP;
END;
/

-- Example: Print Number From 5 to 1 Using the REVERSE Keyword

SET SERVEROUTPUT ON;
DECLARE
counter NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE('FOR LOOP WITH REVERSE KEYWORD');
FOR counter IN REVERSE 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('REVERSE VALUE: '|| counter);
END LOOP;
END;
/

https://media.geeksforgeeks.org/wp-content/uploads/20240113234915/FOR-LOOP-WITH-REVERSE-KEYWORD.jpeg