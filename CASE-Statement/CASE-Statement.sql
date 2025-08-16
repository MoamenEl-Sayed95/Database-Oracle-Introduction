--CASE Statement in PL/SQL

--Syntax

CASE
   WHEN condition_1 THEN
      -- code block for condition_1
   WHEN condition_2 THEN
      -- code block for condition_2
   ...
   ELSE
      -- default code block
END CASE;
/

--1. Simple CASE Statement

DECLARE
   day_number NUMBER := 1;
   day_name VARCHAR2(20);
BEGIN
   CASE day_number
      WHEN 1 THEN
         day_name := 'Monday';
      WHEN 2 THEN
         day_name := 'Tuesday';
      WHEN 3 THEN
         day_name := 'Wednesday';
      WHEN 4 THEN
         day_name := 'Thursday';
      WHEN 5 THEN
         day_name := 'Friday';
      WHEN 6 THEN
         day_name := 'Saturday';
      WHEN 7 THEN
         day_name := 'Sunday';
      ELSE
         day_name := 'Invalid day';
   END CASE;

   DBMS_OUTPUT.PUT_LINE('The day is: ' || day_name);
END;
/

--2. Searched CASE Statement

DECLARE
   product_price NUMBER := 120.50;
   product_category VARCHAR2(20);
BEGIN
   CASE
      WHEN product_price < 50 THEN
         product_category := 'Low Cost';
      WHEN product_price >= 50 AND product_price <= 100 THEN
         product_category := 'Medium Cost';
      WHEN product_price > 100 THEN
         product_category := 'High Cost';
      ELSE
         product_category := 'Invalid Price';
   END CASE;

   DBMS_OUTPUT.PUT_LINE('The product falls into the category: ' || product_category);
END;
/