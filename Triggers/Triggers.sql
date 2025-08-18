-- PL/SQL Triggers

-- PL/SQL stands for Procedural Language/ Structured Query Language.

/*
It has block structure programming features.PL/SQL supports SQL queries.
It also supports the declaration of the variables, control statements, Functions, Records, Cursor, Procedure, and Triggers.
PL/SQL contains a declaration section, execution section, and exception-handling section. Declare and exception handling sections are optional.
*/

-- Syntax:

Declaration section

BEGIN

Execution section

EXCEPTION

Exception section

END;

-- PL/SQL Triggers

/*
PL/SQL triggers are block structures and predefined programs invoked automatically when some event occurs.
They are stored in the database and invoked repeatedly in a particular scenario.
There are two states of the triggers, they are enabled and disabled.
When the trigger is created it is enabled. CREATE TRIGGER statement creates a trigger.
A triggering event is specified on a table, a view, a schema, or a database.
BEFORE and AFTER are the trigger Timing points.DML triggers are created on a table or view, and triggers.
Crossedition triggers are created on Edition-based redefinition. System Triggers are created on schema or database using DDL or database operation statements.It is applied on new data only ,it don't affect existing data.
*/

-- They are associated with response-based events such as a

-- 1. Database Definition Language statements such as CREATE, DROP or ALTER.
-- 2. Database Manipulation Language statements such as UPDATE, INSERT or DELETE.
-- 3. Database operations such as LOGON, LOGOFF, STARTUP, and SHUTDOWN .

-- Why are Triggers important?

-- The importance of Triggers are:

-- 1. Automated Action: It helps to automate actions in response to events on table or views.
-- 2. Data integrity: Constraint can be applied to the data with the help of trigger.It is used to ensure referential integrity.
-- 3. Consistency: It helps to maintain the consistency of the database by performing immediate responses to specific events.
-- 4. Error handling: It helps in error handling by responding to the errors. For example, If specific condition is not met it will provide an error message.

--PL/SQL Trigger Structure

/*
Triggers are fired on the tables or views which are in the database.
Either table, view ,schema, or a database are the basic requirement to execute a trigger.
The trigger is specified first and then the action statement are specified later.
*/

-- Syntax:

CREATE OR REPLACE TRIGGER trigger_name

BEFORE or AFTER or INSTEAD OF     -- trigger timings 

INSERT  or UPDATE or  DELETE      -- Operation to be performed 

of column_name

on Table_name

FOR EACH ROW

DECLARE

Declaration section

BEGIN

Execution section

EXCEPTION

Exception section

END;

/

-- Query operation to be performed i.e INSERT,DELETE,UPDATE.

/*
CREATE [ OR REPLACE ] TRIGGER trigger_name is used to create a trigger or replace the existing trigger.|
BEFORE | AFTER | INSTEAD OF specifies trigger timing.
INSERT | UPDATE | DELETE are the DML operations performed on table or views.
OF column_name specifies the column that would be updated.
ON table_name species the table for the operation.
FOR EACH ROW specify that trigger is executed on each row .
*/

-- Types of PL/SQL Triggers

/*
Trigger timing and operations forms different combinations such as BEFORE INSERT OR BEFORE DELETE OR BEFORE UPDATE .
BEFORE and AFTER are known as conditional triggers.
*/

-- Conditional Trigger: Before

-- Trigger is activated before the operation on the table or view is performed.

-- Query:

-- Create Geeks table
CREATE TABLE Geeks (
    Id INT,
    Name VARCHAR2(20),
    Score INT
);

-- Insert into Geeks Table 
INSERT INTO Geeks (Id, Name, Score) VALUES (1, 'Sam', 800);
INSERT INTO Geeks (Id, Name, Score) VALUES (2, 'Ram', 699);
INSERT INTO Geeks (Id, Name, Score) VALUES (3, 'Tom', 250);
INSERT INTO Geeks (Id, Name, Score) VALUES (4, 'Om', 350);
INSERT INTO Geeks (Id, Name, Score) VALUES (5, 'Jay', 750);
-- insert statement should be written for each entry in Oracle Sql Developer

CREATE TABLE Affect (
    Id INT,
    Name VARCHAR2(20),
    Score INT
);

-- BEFORE INSERT trigger
CREATE OR REPLACE TRIGGER BEFORE_INSERT
BEFORE INSERT ON Geeks
FOR EACH ROW
BEGIN
    INSERT INTO Affect (Id, Name, Score)
    VALUES (:NEW.Id, :NEW.Name, :NEW.Score);
END;
/
INSERT INTO Geeks (Id, Name, Score) VALUES (6, 'Arjun', 500);

-- BEFORE DELETE trigger
CREATE OR REPLACE TRIGGER BEFORE_DELETE
BEFORE DELETE ON Geeks
FOR EACH ROW
BEGIN
    INSERT INTO Affect (Id, Name, Score)
    VALUES (:OLD.Id, :OLD.Name, :OLD.Score);
END;
/
DELETE FROM Geeks WHERE Id = 3;

-- BEFORE UPDATE trigger
CREATE OR REPLACE TRIGGER BEFORE_UPDATE
BEFORE UPDATE ON Geeks
FOR EACH ROW
BEGIN
    INSERT INTO Affect (Id, Name, Score)
    VALUES (:OLD.Id, :OLD.Name, :OLD.Score);
END;
/
UPDATE Geeks SET Score = 900 WHERE Id = 5;
SELECT * FROM Affect; 
SELECT * FROM Geeks; 

https://media.geeksforgeeks.org/wp-content/uploads/20240121194351/Conditional-Trigger-_Before.jpeg

-- Explanation:

-- BEFORE_INSERT Trigger is fired before adding a row in Geeks Table,and row is inserted in the Affect table.
-- BEFORE_DELETE Trigger is activated before the row is delete from the Geeks table and row which satisfy the condition is added to Affect table.
-- BEFORE_UPDATE TRIGGER is activated before the row with Id=5 is updated and row with old values is added to Affect table

https://media.geeksforgeeks.org/wp-content/uploads/20240121194428/Conditional-Trigger-Before.jpeg

-- Conditional Trigger: After

-- Trigger is activated after the operation on the table or view is performed.

-- Query:

SET SERVEROUTPUT ON;


CREATE TABLE Geeks (
    Id INT,
    Name VARCHAR2(20),
    Score INT
);


-- Insert into Geeks Table 
INSERT INTO Geeks (Id, Name, Score) VALUES (1, 'Sam', 800);
INSERT INTO Geeks (Id, Name, Score) VALUES (2, 'Ram', 699);
INSERT INTO Geeks (Id, Name, Score) VALUES (3, 'Tom', 250);
INSERT INTO Geeks (Id, Name, Score) VALUES (4, 'Om', 350);
INSERT INTO Geeks (Id, Name, Score) VALUES (5, 'Jay', 750);
-- insert statement should be written for each entry in Oracle Sql Developer


CREATE TABLE Affect (
    Id INT,
    Name VARCHAR2(20),
    Score INT
);
SELECT * FROM Geeks; 
-- AFTER DELETE trigger
CREATE OR REPLACE TRIGGER AFTER_DELETE
AFTER DELETE ON Geeks
FOR EACH ROW
BEGIN
    INSERT INTO Affect (Id, Name, Score)
    VALUES (:OLD.Id, :OLD.Name, :OLD.Score);
END;
/
DELETE FROM Geeks WHERE Id = 4;


-- AFTER UPDATE trigger
CREATE OR REPLACE TRIGGER AFTER_UPDATE
AFTER UPDATE ON Geeks
FOR EACH ROW
BEGIN
    INSERT INTO Affect (Id, Name, Score)
    VALUES (:NEW.Id, :NEW.Name, :NEW.Score);
END;
/
UPDATE Geeks SET Score = 1050 WHERE Id = 5;
SELECT * FROM Affect; 
SELECT * FROM Geeks; 

https://media.geeksforgeeks.org/wp-content/uploads/20240121194512/Conditional-Trigger-After.jpeg

-- Explanation: After the deletion of the row from the Geek table trigger is fired and the row which is deleted is added to the Affect Table.In second trigger i.e After_update trigger is fired after performing update on Geeks table and the row is added to Affect Table.Output contains the Affect table and the Geek table after the trigger events.

-- Common Use Cases of PL/SQL Triggers

-- To automate the actions in response to the events and reducing manual task.
-- To apply constraint to ensure referential integrity and to prevent invalid data in table or database.
-- In error handling to response to errors.

-- Conclusion

/*
In conclusion, Oracle PL/SQL triggers offer a powerful way to automate actions before or after specified events, such as INSERT, UPDATE or DELETE, on a table.
By executing custom code, handling exceptions, and enforcing business rules, triggers improve database performance and data integrity.
*/