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

  /*================================
    7. Window functions
	================================*/

  /*---------------------------------------------
    Rank jobs by deposit success rate
   ---------------------------------------------*/
;WITH JobRates AS (
	SELECT 
		job,
		100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) /COUNT(*) AS DepositRate
	FROM [bank].[dbo].[bank]
	GROUP BY job
)

SELECT 
	job,
	DepositRate,
	ROW_NUMBER() OVER (ORDER BY DepositRate DESC) AS JOBrow_num,
    RANK()       OVER (ORDER BY DepositRate DESC) AS JOBrnk,
    DENSE_RANK() OVER (ORDER BY DepositRate DESC) AS JOBdense_rnk
FROM JobRates
ORDER BY JOBrnk;

 /*-----------------------------------------------------
    Rank individual records by balance within each job.
   -----------------------------------------------------*/
SELECT 
	job,
	age,
	Balance,
	ROW_NUMBER() OVER (PARTITION BY job ORDER BY Balance DESC) AS balrow_num,
    RANK()       OVER (PARTITION BY job ORDER BY Balance DESC) AS balrnk,
    DENSE_RANK() OVER (PARTITION BY job ORDER BY Balance DESC) AS baldense_rnk
FROM [bank].[dbo].[bank]
ORDER BY balrnk;

 /*-----------------------------------------------------
    Rank customers by balance within education level.
   -----------------------------------------------------*/
SELECT 
	education,
	age,
	Balance,
	ROW_NUMBER() OVER (PARTITION BY education ORDER BY Balance DESC) AS balrow_num,
    RANK()       OVER (PARTITION BY education ORDER BY Balance DESC) AS balrnk,
    DENSE_RANK() OVER (PARTITION BY education ORDER BY Balance DESC) AS baldense_rnk
FROM [bank].[dbo].[bank]
ORDER BY balrnk;

/*------------------------------------------------------------------------------
    Show each person's balance together with the average balance for their job.
   -----------------------------------------------------------------------------*/
SELECT 
	job,
	age,
	balance,
	AVG(balance) OVER (PARTITION BY job) AS JobAvg
FROM [bank].[dbo].[bank]
ORDER BY job;