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

Section 03: Deposit Rates

Purpose:
Calculate the percentage of successful deposits across
different customer and campaign characteristics.
============================================================
*/


-- 1. Deposit rate by job
SELECT
    job,
    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate
FROM [bank].[dbo].[bank]
GROUP BY job;


-- 2. Deposit rate by marital status
SELECT
    marital,
    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate
FROM [bank].[dbo].[bank]
GROUP BY marital;


-- 3. Deposit rate by education
SELECT
    education,
    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate
FROM [bank].[dbo].[bank]
GROUP BY education;


-- 4. Deposit rate by housing-loan status
SELECT
    housing,
    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate
FROM [bank].[dbo].[bank]
GROUP BY housing;


-- 5. Deposit rate by personal-loan status
SELECT
    loan,
    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate
FROM [bank].[dbo].[bank]
GROUP BY loan;


-- 6. Deposit rate by contact type
SELECT
    contact,
    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate
FROM [bank].[dbo].[bank]
GROUP BY contact;


-- 7. Deposit rate by month
SELECT
    month,
    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate
FROM [bank].[dbo].[bank]
GROUP BY month;


-- 8. Deposit rate by number of previous contacts
SELECT
    previous,
    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate
FROM [bank].[dbo].[bank]
GROUP BY previous;


-- 9. Deposit rate by number of campaign contacts
SELECT
    campaign,
    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate
FROM [bank].[dbo].[bank]
GROUP BY campaign;


-- 10. Deposit rate by previous campaign outcome
SELECT
    poutcome,
    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate
FROM [bank].[dbo].[bank]
GROUP BY poutcome;