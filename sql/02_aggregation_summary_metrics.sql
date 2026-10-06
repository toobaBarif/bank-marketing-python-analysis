SELECT [age]
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

Section 02: Aggregation

Purpose:
Summarize the dataset using:
COUNT, SUM, AVG, MIN, MAX, GROUP BY
============================================================
*/


-- 1. Total number of records
SELECT
    COUNT(*) AS TotalRecords
FROM [bank].[dbo].[bank];


-- 2. Average customer age
SELECT
    AVG(age) AS AverageAge
FROM [bank].[dbo].[bank];


-- 3. Average customer balance
SELECT
    AVG(balance) AS AverageBalance
FROM [bank].[dbo].[bank];


-- 4. Minimum balance
SELECT
    MIN(balance) AS MinimumBalance
FROM [bank].[dbo].[bank];


-- 5. Maximum balance
SELECT
    MAX(balance) AS MaximumBalance
FROM [bank].[dbo].[bank];


-- 6. Number of successful deposits
SELECT
    SUM(CASE
        WHEN deposit = 'yes' THEN 1
        ELSE 0
    END) AS SuccessfulDeposits
FROM [bank].[dbo].[bank];


-- 7. Number of unsuccessful deposits
SELECT
    SUM(CASE
        WHEN deposit = 'no' THEN 1
        ELSE 0
    END) AS UnsuccessfulDeposits
FROM [bank].[dbo].[bank];


-- 8. Number of customers in each job category
SELECT
    job,
    COUNT(*) AS CustomerCount
FROM [bank].[dbo].[bank]
GROUP BY job;


-- 9. Average balance for each job category
SELECT
    job,
    AVG(balance) AS AverageBalance
FROM [bank].[dbo].[bank]
GROUP BY job;


-- 10. Successful deposit count by job
SELECT
    job,
    SUM(CASE
        WHEN deposit = 'yes' THEN 1
        ELSE 0
    END) AS DepositCount
FROM [bank].[dbo].[bank]
GROUP BY job;