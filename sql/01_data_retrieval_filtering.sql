SELECT TOP (1000) [age]
      ,[job]
      ,[marital]
      ,[education]
      ,[default]
      ,[balance]
      ,[housing]
      ,[loan]
      ,[contact]
      ,[day]
      ,[month]
      ,[duration]
      ,[campaign]
      ,[pdays]
      ,[previous]
      ,[poutcome]
      ,[deposit]
  FROM [bank].[dbo].[bank]

  /*
============================================================
BANK MARKETING DATA ANALYSIS
SQL Server / T-SQL

Section 01: Basic Queries

Purpose:
Practice data retrieval and filtering using:
SELECT, WHERE, AND, OR, BETWEEN, IN, NOT, ORDER BY
============================================================
*/


-- 1. Return all columns
SELECT *
FROM [bank].[dbo].[bank];


-- 2. Return age, job, balance, and deposit
SELECT
    age,
    job,
    balance,
    deposit
FROM [bank].[dbo].[bank];


-- 3. Find customers aged over 50
SELECT *
FROM [bank].[dbo].[bank]
WHERE age > 50
ORDER BY age DESC;


-- 4. Find customers with negative balances
SELECT *
FROM [bank].[dbo].[bank]
WHERE balance < 0
ORDER BY balance ASC;


-- 5. Find customers with balances above 10,000
SELECT *
FROM [bank].[dbo].[bank]
WHERE balance > 10000
ORDER BY balance DESC;


-- 6. Find customers whose job is management
SELECT *
FROM [bank].[dbo].[bank]
WHERE job = 'management';


-- 7. Find customers who made a deposit
SELECT *
FROM [bank].[dbo].[bank]
WHERE deposit = 'yes';


-- 8. Find customers who have a housing loan
SELECT *
FROM [bank].[dbo].[bank]
WHERE housing = 'yes';


-- 9. Find customers without either type of loan
SELECT *
FROM [bank].[dbo].[bank]
WHERE housing = 'no'
  AND loan = 'no';


-- 10. Find customers aged between 30 and 40
SELECT *
FROM [bank].[dbo].[bank]
WHERE age BETWEEN 30 AND 40
ORDER BY age ASC;


/*
============================================================
Additional Operator Practice
============================================================
*/

-- OR
-- Customers who have either a housing loan or a personal loan
SELECT *
FROM [bank].[dbo].[bank]
WHERE housing = 'yes'
   OR loan = 'yes';


-- IN
-- Customers working in selected job categories
SELECT *
FROM [bank].[dbo].[bank]
WHERE job IN ('management', 'technician', 'admin.');


-- NOT
-- Customers who are not in management
SELECT *
FROM [bank].[dbo].[bank]
WHERE NOT job = 'management';


-- AND
-- Customers aged 30 to 40 who successfully made a deposit
SELECT *
FROM [bank].[dbo].[bank]
WHERE age BETWEEN 30 AND 40
  AND deposit = 'yes';


-- ORDER BY
-- Customers ordered from highest to lowest balance
SELECT
    age,
    job,
    balance,
    deposit
FROM [bank].[dbo].[bank]
ORDER BY balance DESC;