# Bank Marketing Analysis - SQL

## Overview

This section analyzes the Bank Marketing dataset using Microsoft SQL Server and T-SQL.

The SQL analysis progresses from basic data retrieval and filtering to aggregation, customer segmentation, subqueries, CTEs, and window functions.

The dataset was imported into SQL Server and analyzed independently without using Python to calculate the SQL results.

## Database

- Database: `bank`
- Schema: `dbo`
- Table: `bank`
- SQL Platform: Microsoft SQL Server
- Language: T-SQL

The source dataset is available in the main project under:

`../data/bank.xlsx`

## Dataset Summary

The dataset contains 11,162 customer records.

Key summary values calculated in SQL:

| Metric | Result |
|---|---:|
| Total Records | 11,162 |
| Average Age | 41 |
| Average Balance | 1,528 |
| Minimum Balance | -6,847 |
| Maximum Balance | 81,204 |
| Successful Deposits | 5,289 |
| Unsuccessful Deposits | 5,873 |

## SQL Analysis Structure

### 01. Data Retrieval and Filtering

File:

`01_data_retrieval_filtering.sql`

Covers:

- `SELECT`
- `WHERE`
- `AND`
- `OR`
- `BETWEEN`
- `IN`
- `NOT`
- `ORDER BY`

Analysis includes:

- Retrieving all customer records
- Selecting specific columns
- Customers aged over 50
- Customers with negative balances
- Customers with balances above 10,000
- Management customers
- Successful deposit customers
- Customers with housing loans
- Customers without housing or personal loans
- Customers aged between 30 and 40

---

### 02. Data Aggregation and Summary Metrics

File:

`02_aggregation_summary_metrics.sql`

Covers:

- `COUNT`
- `SUM`
- `AVG`
- `MIN`
- `MAX`
- `GROUP BY`

Analysis includes:

- Total number of records
- Average customer age
- Average customer balance
- Minimum and maximum balances
- Successful and unsuccessful deposit counts
- Customer count by job
- Average balance by job
- Successful deposit count by job

---

### 03. Deposit Success Rate Analysis

File:

`03_deposit_rate_analysis.sql`

Calculates successful deposit percentages by:

- Job
- Marital status
- Education
- Housing-loan status
- Personal-loan status
- Contact type
- Month
- Number of previous contacts
- Number of campaign contacts
- Previous campaign outcome

Deposit rate is calculated as:

`Successful Deposits / Total Customers × 100`

---

### 04. Customer Segmentation with CASE WHEN

File:

`04_customer_segmentation_case_when.sql`

Uses `CASE WHEN` to create analytical customer groups.

Includes:

#### Age Groups

- 18 to 29
- 30 to 39
- 40 to 49
- 50 to 59
- 60+

Deposit success rates are compared across age groups.

#### Balance Categories

Customers are grouped into meaningful balance ranges and their deposit performance is compared.

#### Loan Status

Customers are classified as:

- No Loan
- Housing Only
- Personal Only
- Both

Deposit rates are then compared across loan-status groups.

---

### 05. Group Filtering with HAVING

File:

`05_group_filtering_having.sql`

Uses grouped filtering to identify:

- Jobs containing more than 500 customer records
- Jobs with deposit rates above the overall deposit rate
- Months containing more than 500 contacts
- Education categories with average balances above the overall average balance

---

### 06. Subqueries and CTEs

File:

`06_subqueries_and_ctes.sql`

Uses subqueries and Common Table Expressions to analyze:

- Customers whose balance is above the overall average
- Jobs whose average balance exceeds the overall average
- Jobs whose deposit rate exceeds the overall deposit rate
- Customers whose campaign contact count exceeds the average
- Month with the highest deposit success rate

Where appropriate, analyses are implemented using both subqueries and CTEs.

---

### 07. Window Function Analysis

File:

`07_window_function_analysis.sql`

Uses SQL window functions including:

- `RANK()`
- `DENSE_RANK()`
- `ROW_NUMBER()`
- `AVG() OVER()`

Analysis includes:

- Ranking jobs by deposit success rate
- Ranking customers by balance within each job
- Ranking customers by balance within education groups
- Comparing individual customer balances with the average balance for their job
- Calculating the difference between customer balance and job-group average balance

## SQL Skills Demonstrated

- Data retrieval
- Filtering
- Conditional logic
- Aggregation
- Grouped analysis
- Percentage calculations
- Customer segmentation
- Group filtering
- Subqueries
- Common Table Expressions
- Window functions
- Ranking
- Analytical SQL

## Key Business Findings

The SQL analysis identified several patterns in customer deposit behavior:

- The overall deposit success rate was approximately **47.38%**, with 5,289 successful deposits out of 11,162 customer records.

- **Students had the highest deposit success rate among job categories at 74.72%**, followed by retired customers at 66.32%.

- **Management customers generated the largest number of successful deposits**, with 1,301 successful subscriptions out of 2,566 records.

- Customers aged **60 and above had the highest deposit success rate at 76.92%**. Customers aged 18 to 29 also performed strongly at 59.83%.

- Customers without a housing loan had a substantially higher deposit rate:
  - No housing loan: **57.03%**
  - Housing loan: **36.64%**

- Customers without a personal loan also performed better:
  - No personal loan: **49.53%**
  - Personal loan: **33.15%**

- Customers with tertiary education had the highest deposit rate among known education categories at **54.11%**.

- Previous campaign outcome was strongly associated with current deposit success. Customers whose previous campaign outcome was `success` had a **91.32%** current deposit success rate.

- Cellular contact produced a **54.33%** deposit success rate, compared with only **22.59%** for records where contact type was `unknown`.

- December had the highest deposit success rate at **90.91%**, although it contained relatively few customer contacts. March also performed strongly at **89.86%**.

- May produced the **largest number of successful deposits, with 925**, but its success rate was only **32.75%** because it also contained a large number of total contacts.

- Campaign frequency showed a general decline in success as customers were contacted repeatedly. Customers contacted once during the current campaign had a **53.38%** success rate, compared with 36.77% for five contacts and 25.00% for eight contacts.

- Customers who had been contacted in previous campaigns generally showed higher success rates than customers with no previous contacts.

- Successful deposit customers also had higher average balances:
  - Successful deposits: approximately **1,804**
  - Unsuccessful deposits: approximately **1,280**

These findings suggest that customer age, loan status, previous campaign performance, contact method, campaign frequency, and customer balance are all useful characteristics when evaluating deposit subscription performance.

## Notes

The dataset does not contain a reliable unique customer identifier.

For this reason, an artificial customer ID was not created solely to demonstrate SQL joins. Join practice should use a dataset containing a legitimate relationship between multiple tables.
