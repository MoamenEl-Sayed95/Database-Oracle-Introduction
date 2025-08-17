-- PL/SQL Loops
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

-- PL/SQL While Loop

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