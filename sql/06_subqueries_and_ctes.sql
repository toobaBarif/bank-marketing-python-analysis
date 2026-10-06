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

  /* =====================================
       06_subqueries_and_ctes.sql
   ===================================== */

   /*--------------------------------------------------------
    1. Customers whose balance is above the overall average.
	---------------------------------------------------------*/

	;WITH AvgBalance AS (
    SELECT AVG(balance) AS bal
    FROM [bank].[dbo].[bank]
)

	SELECT
		b.age,
		b.balance
	FROM [bank].[dbo].[bank] AS b
	CROSS JOIN AvgBalance AS a
	WHERE b.balance > a.bal;

	/*--------------------------------------------------------
    2. Jobs whose average balance exceeds the overall average.
	---------------------------------------------------------*/

	;WITH AvgBalance AS (
    SELECT AVG(balance) AS bal
    FROM [bank].[dbo].[bank]
)

	SELECT
		b.job,
		b.balance
	FROM [bank].[dbo].[bank] AS b
	CROSS JOIN AvgBalance AS a
	WHERE b.balance > a.bal;

	/*--------------------------------------------------------
    3. Jobs whose deposit rate exceeds the overall deposit rate.
	---------------------------------------------------------*/
;WITH AvgDeposit AS (
    SELECT 
        AVG(CASE WHEN deposit = 'yes' THEN 1.0 ELSE 0 END) AS AVGdeposit
    FROM [bank].[dbo].[bank]
)

SELECT
    b.job,
    ROUND(
        AVG(CASE WHEN b.deposit = 'yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS DepositRate

FROM [bank].[dbo].[bank] AS b
CROSS JOIN AvgDeposit AS a

GROUP BY b.job, a.AVGdeposit

HAVING AVG(CASE WHEN b.deposit = 'yes' THEN 1.0 ELSE 0 END) > a.AVGdeposit;

	/*--------------------------------------------------------------------------------
	4. Customers whose campaign contact count exceeds the average campaign count.
	-----------------------------------------------------------------------------*/

	;WITH AvgCampaign AS (
		SELECT AVG(CAST(campaign AS DECIMAL(10,2))) AS AverageCampaign
		FROM [bank].[dbo].[bank]
	)

	SELECT
		b.age,
		b.job,
		b.campaign
	FROM [bank].[dbo].[bank] AS b
	CROSS JOIN AvgCampaign AS a
	WHERE b.campaign > a.AverageCampaign
	ORDER BY b.campaign DESC;

	/*------------------------------------------------------------
	5. Month with the highest deposit success rate.
	-------------------------------------------------------------*/
		SELECT 
		month,
		ROUND(
			100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
			2
		) AS DepositRate
	FROM [bank].[dbo].[bank]
	GROUP BY month
	ORDER BY DepositRate DESC;