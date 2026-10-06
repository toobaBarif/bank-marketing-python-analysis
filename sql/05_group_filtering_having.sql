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


  /*==================================================
		5: HAVING CLAUSE
	===================================================*/

  /*-------------------------------------------
		Jobs containing more than 500 records.
	--------------------------------------------*/

	SELECT job, COUNT(deposit) AS JobCount
	FROM [bank].[dbo].[bank]
	GROUP BY job
	HAVING COUNT (deposit) > 500
	ORDER BY JobCount ASC

	/*----------------------------------------------------------
		Jobs with deposit rates above the overall deposit rate.
	------------------------------------------------------------*/
	SELECT 
		job,

		ROUND(
			100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
			2
		) AS DepositRate

	FROM [bank].[dbo].[bank]

	GROUP BY job

	HAVING
		1.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*)
		>
		(
			SELECT
				1.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*)
			FROM [bank].[dbo].[bank]
		)

	ORDER BY DepositRate ASC;


	/*----------------------------------------------------------
		Months containing more than 500 contacts.
	------------------------------------------------------------*/

	SELECT month, COUNT(contact) AS ContactCount
	FROM [bank].[dbo].[bank]
	GROUP BY month
	HAVING COUNT (contact) > 500
	ORDER BY ContactCount ASC

	/*---------------------------------------------------------------------------------------
		Education categories with average balance greater than the overall average balance.
	-----------------------------------------------------------------------------------------*/
SELECT	
    education, 
    AVG(balance) AS BalanceAVG
FROM [bank].[dbo].[bank]
GROUP BY education
HAVING AVG(balance) > (
    SELECT AVG(balance)
    FROM [bank].[dbo].[bank]
)
ORDER BY BalanceAVG ASC;