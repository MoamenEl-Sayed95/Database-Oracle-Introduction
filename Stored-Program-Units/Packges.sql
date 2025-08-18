-- PL/SQL Packages

/*
PL/SQL 
is a programming language that extends SQL by incorporating features of procedural programming languages.
It is a highly structured language.
A key feature of PL/SQL is the use of packages, which allow developers to group related procedures, functions, variables, and other PL/SQL constructs into a single, organized unit within Oracle databases.
*/

-- What is a PL/SQL Package?

/*
PL/SQL packages are a way to organize and encapsulate related procedures, functions, variables, triggers, and other PL/SQL items into a single item.
Packages provide a modular approach to write and maintain the code.
It makes it easy to manage large codes.

A package is compiled and then stored in the database, which then can be shared with many applications.
The package also has specifications, which declare an item to be public or private.
Public items can be referenced from outside of the package.
A PL/SQL package is a collection of related Procedures, Functions, Variables, and other elements that are grouped for Modularity and Reusability.
*/

-- Key Benefits of Using PL/SQL Packages

-- The needs of the Packages are described below:

-- 1. Modularity: Packages provide a modular structure, allowing developers to organize and manage code efficiently.
-- 2. Code Reusability: Procedures and functions within a package can be reused across multiple programs, reducing redundancy.
-- 3. Private Elements: Packages support private procedures and functions, limiting access to certain code components.
-- 4. Encapsulation: Packages encapsulate related logic, protecting internal details and promoting a clear interface to other parts of the code.

-- Structure of a PL/SQL Package

-- A PL/SQL package consists of two parts:

-- 1. A package Specification
-- 2. A package Body

-- 1. Package Specification

-- The package specification declares the public interface of the package. 
-- It includes declarations of procedures, functions, variables, cursors, and other constructs that are meant to be accessible from outside the package.
-- The specification is like a header file that defines what a package can do.

-- Example of Package Specification:

CREATE [OR REPLACE] PACKAGE package_name 
IS 
   -- declarations (procedures, functions, variables, cursors, etc.)
END package_name;
/

---------------------------------------

CREATE OR REPLACE PACKAGE my_package AS
   PROCEDURE my_procedure(p_param1 NUMBER);
   FUNCTION calculate_sum(x NUMBER, y NUMBER) RETURN NUMBER;
   -- Other declarations...
END my_package;
/

-- 2. Package Body

/*
The package body contains the implementation of the details of the package.
It includes the coding of the procedures or functions which are decalared in the package specification.
The body can also contain private variables and procedures that are not exposed to outside the code.
*/

-- Example

CREATE [OR REPLACE] PACKAGE BODY package_name 
{IS | AS}
   -- Implementations (Procedures, Functions, etc.)
END package_name;
/

------------------------------------------------

-- Example of Package Body:

CREATE OR REPLACE PACKAGE BODY my_package AS
   PROCEDURE my_procedure(p_param1 NUMBER) IS
   BEGIN
      -- Implementation code...
   END my_procedure;

   FUNCTION calculate_sum(x NUMBER, y NUMBER) RETURN NUMBER IS
   BEGIN
      -- Implementation code...
   END calculate_sum;
   -- Other implementation details...
END my_package;
/
-- Using Oracle PL/SQL Packages in Code

DECLARE
   result NUMBER;
BEGIN
   -- Call a procedure from the package
   my_package.my_procedure(42);

   -- Call a function from the package
   result := my_package.calculate_sum(10, 20);

   -- Other code...
END;
/