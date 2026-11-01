# Bank Marketing Analysis

## Project Overview

This project analyzes a bank marketing dataset to identify the customer characteristics and campaign factors associated with successful term deposit subscriptions.

The project combines Python, SQL, Power BI, and statistical analysis to examine customer demographics, financial characteristics, campaign performance, deposit outcomes, and patterns associated with successful conversions.

## Tools Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook
- SQL Server
- T-SQL
- Power BI
- Power Query
- DAX

## Analysis Areas

### Python Analysis

The Python analysis includes:

- Initial data inspection
- Data quality assessment
- Duplicate detection
- Missing-value assessment
- Data type review
- Outlier analysis
- Customer filtering
- Feature engineering
- Grouped analysis
- Data visualization
- Business-focused analysis

### SQL Analysis

The SQL analysis includes:

- Data retrieval and filtering
- Aggregation and summary metrics
- Deposit rate analysis
- Customer segmentation using CASE WHEN
- Group filtering using HAVING
- Subqueries and Common Table Expressions
- Window function analysis

### Power BI Analysis

The Power BI report includes four interactive pages:

1. Executive Overview
2. Customer Profile
3. Campaign Performance
4. Customer Detail

The report includes:

- KPI cards
- Customer and campaign analysis
- Slicers
- Cross-filtering
- Drill-through
- Tooltips
- Reset filters
- Appropriate category and chronological sorting
- Interactive deposit outcome analysis

### Statistical Analysis

The statistical analysis focuses on comparing customers with:

```text
deposit = yes
```

and:

```text
deposit = no
```

The analysis includes:

- Count
- Mean
- Median
- Mode
- Minimum and maximum
- Range
- Variance
- Standard deviation
- Quartiles
- Interquartile range
- Distribution analysis
- Skewness assessment
- Outlier assessment
- Mean versus median comparison
- Normality assessment

Variables analyzed include:

- Age
- Balance
- Duration
- Campaign contacts
- Pdays
- Previous contacts

## Business Questions

The project investigates questions such as:

- Which customer job groups have the highest deposit success rates?
- Which age groups have the highest deposit success rates?
- How do housing and personal loans relate to deposit outcomes?
- How does education relate to deposit success?
- Which months perform best?
- Which contact methods perform best?
- How does customer balance differ between successful and unsuccessful deposits?
- Do successful deposit calls tend to last longer?
- How does campaign contact frequency relate to deposit success?
- How does previous campaign outcome relate to current deposit success?
- How do successful and unsuccessful customers differ statistically?

## Repository Structure

```text
bank-marketing-analysis/
├── README.md
├── data/
│   └── bank.xlsx
├── python/
│   └── bank_marketing_analysis.ipynb
├── sql/
│   ├── README.md
│   ├── 01_data_retrieval_filtering.sql
│   ├── 02_aggregation_summary_metrics.sql
│   ├── 03_deposit_rate_analysis.sql
│   ├── 04_customer_segmentation_case_when.sql
│   ├── 05_group_filtering_having.sql
│   ├── 06_subqueries_and_ctes.sql
│   └── 07_window_function_analysis.sql
├── powerbi/
│   ├── bank_marketing_dashboard.pbix
│   └── screenshots/
└── statistics/
    └── bank_marketing_statistics.ipynb
```

## Project Status

Completed:

- Python analysis
- SQL analysis
- Power BI dashboard

In progress:

- Statistical analysis

Planned extension:

- Machine learning analysis

## Author

**Tooba Binte Arif**

Entry-Level Data Analyst

LinkedIn:  
https://www.linkedin.com/in/tooba-binte-arif-599750221
