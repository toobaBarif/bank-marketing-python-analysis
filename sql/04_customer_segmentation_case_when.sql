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

  /* =====================================
   1. DEPOSIT RATE BY AGE GROUP
   ===================================== */
 SELECT
    CASE
        WHEN age BETWEEN 18 AND 29 THEN '18 to 29'
        WHEN age BETWEEN 30 AND 39 THEN '30 to 39'
        WHEN age BETWEEN 40 AND 49 THEN '40 to 49'
        WHEN age BETWEEN 50 AND 59 THEN '50 to 59'
        WHEN age >= 60 THEN '60+'
    END AS AgeGroup,

    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate

FROM [bank].[dbo].[bank]

GROUP BY
    CASE
        WHEN age BETWEEN 18 AND 29 THEN '18 to 29'
        WHEN age BETWEEN 30 AND 39 THEN '30 to 39'
        WHEN age BETWEEN 40 AND 49 THEN '40 to 49'
        WHEN age BETWEEN 50 AND 59 THEN '50 to 59'
        WHEN age >= 60 THEN '60+'
    END

ORDER BY MIN(age);


/* =====================================
   2. DEPOSIT RATE BY BALANCE CATEGORY
   ===================================== */
   SELECT
    CASE
        WHEN balance <0 THEN 'Negative Balance'
        WHEN balance BETWEEN 0 AND 1999 THEN 'Low Balance'
        WHEN balance BETWEEN 2000 AND 2999 THEN 'Moderate Balance'
		WHEN balance BETWEEN 3000 AND 3999 THEN 'High Balance'
        WHEN balance BETWEEN 4000 AND 4999 THEN 'Very High Balance'
        WHEN balance <5000 THEN 'Super High Balance'
    END AS BalanceGroup,

    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate

FROM [bank].[dbo].[bank]

GROUP BY
    CASE
        WHEN balance <0 THEN 'Negative Balance'
        WHEN balance BETWEEN 0 AND 1999 THEN 'Low Balance'
        WHEN balance BETWEEN 2000 AND 2999 THEN 'Moderate Balance'
		WHEN balance BETWEEN 3000 AND 3999 THEN 'High Balance'
        WHEN balance BETWEEN 4000 AND 4999 THEN 'Very High Balance'
        WHEN balance <5000 THEN 'Super High Balance'
    END

ORDER BY MIN(balance);

/* =====================================
   3. DEPOSIT RATE BY LOAN STATUS
   ===================================== */
   SELECT
    CASE
        WHEN housing = 'no' AND loan = 'no' THEN 'No Loan'
		WHEN housing = 'no' AND loan = 'yes' THEN 'Personal Loan' 
		WHEN housing = 'yes' AND loan = 'no' THEN 'Housing Loan'
		WHEN housing = 'yes' AND loan = 'yes' THEN 'No Loan'
    END AS LoanStatus,

    ROUND(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS DepositRate

FROM [bank].[dbo].[bank]

GROUP BY
    CASE
        WHEN housing = 'no' AND loan = 'no' THEN 'No Loan'
		WHEN housing = 'no' AND loan = 'yes' THEN 'Personal Loan' 
		WHEN housing = 'yes' AND loan = 'no' THEN 'Housing Loan'
		WHEN housing = 'yes' AND loan = 'yes' THEN 'No Loan'
    END

ORDER BY MIN(loan);