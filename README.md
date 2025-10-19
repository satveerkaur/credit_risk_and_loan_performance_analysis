# 💼 Credit Risk and Loan Performance Analysis | FinTech & Banking Analytics Project

## 🏢 Project Background  

You are a **Data Analyst at LendingClub**, the largest U.S. peer-to-peer lending platform. LendingClub connects borrowers seeking personal and business loans with investors looking for fixed-income opportunities.  

The **risk management division** noticed rising defaults in the loan portfolio, particularly for personal loans used for **debt consolidation, home improvement, and major purchases**. This created financial exposure for the company and made it harder to assess which applicants are high-risk versus low-risk.  

You have been tasked with leading a **Credit Risk and Loan Performance Analysis** project using the LendingClub dataset. The dataset contains detailed historical information on **accepted loans**, including loan amounts, interest rates, FICO scores, employment history, debt-to-income ratios, home ownership status, and payment history.  

Your objectives are:  
- Identify **patterns in borrower behavior** that predict loan defaults or full repayment.  
- Analyze **loan performance trends** by grade, term, interest rate, and applicant characteristics.  
- Build a **data pipeline and clean dataset** ready for SQL analysis and visualization.  
- Provide actionable **business insights to reduce credit loss** and improve portfolio performance.  

This project showcases **end-to-end data analytics skills** — from raw data cleaning in Excel/Pandas, SQL database preparation, exploratory analysis, to dashboard-ready visualizations — applied in a **real-world financial context**.  

---

## 🎯 Executive Summary  

### **Business Problem**  
LendingClub faces the challenge of **approving loans that maximize revenue** while **minimizing default risk**. Misclassifying high-risk applicants as low-risk results in financial loss, while rejecting creditworthy applicants leads to missed business opportunities.

### **Proposed Solution**  
- Clean and structure the accepted loans dataset for SQL import.  
- Conduct **exploratory analysis** to uncover patterns and relationships in borrower data.  
- Prepare the dataset for **risk modeling and dashboard visualization**.  

### **Expected Business Impact**  
- Reduce potential losses by accurately identifying risky applicants.  
- Support **risk-based pricing strategies** using data insights.  
- Provide management with **dashboards and reports** to monitor portfolio performance over time.  

---

## 📊 Business Objectives  
1. Clean, standardize, and prepare the accepted loans dataset for analysis.  
2. Align Excel column names with SQL schema standards.  
3. Enable comparison with rejected loans to identify key decision factors.  
4. Build a foundation for **risk prediction and business reporting dashboards**.  

---

## 🧹 Data Preparation Process  

### **Dataset:**  
`accepted_loans.csv` (from LendingClub, Kaggle)  

### **Cleaning Steps:**  
1. Removed duplicates and blank rows.  
2. Standardized column names to **snake_case** format to match SQL.  
3. Converted numeric fields, dates, and categorical variables to proper types.  
4. Handled missing or inconsistent values.  
5. Exported **cleaned CSV** ready for SQL Server import.  

### **Key Column Mapping:**  

| Original Column Name | Cleaned Column Name | Notes |
|----------------------|-------------------|-------|
| Loan ID              | loan_id           | Primary key for accepted loans |
| Loan Amount          | loan_amount       | Numeric format |
| Term                 | term              | e.g., '36 months' |
| Interest Rate        | interest_rate     | Numeric percentage |
| Grade                | grade             | A-G |
| Sub Grade            | sub_grade         | e.g., A1, B2 |
| Employment Length    | employment_length | e.g., '10+ years' |
| Home Ownership       | home_ownership    | RENT, MORTGAGE, OWN |
| Annual Income        | annual_income     | Numeric |
| Verification Status  | verification_status | Verified, Not Verified |
| Debt-to-Income Ratio | debt_to_income_ratio | Numeric |
| ZIP Code             | zip_code          | First 5 digits recommended |
| State                | state             | 2-letter US state code |
| FICO Low             | fico_range_low    | Lower bound |
| FICO High            | fico_range_high   | Upper bound |
| Delinquencies 2Y     | delinquencies_2yrs | Number of delinquencies in last 2 years |
| Total Accounts       | total_accounts    | Numeric |
| Loan Status          | loan_status       | Fully Paid / Charged Off / Current |

> ⚠️ Risk score is not included in this dataset — will be computed later based on features.

---

## 🧰 Tools & Skills Used  
- **Excel / Power Query** – Data cleaning and formatting  
- **SQL Server** – Database creation, table import, queries  
- **Python (Pandas)** – Data cleaning, preprocessing, and exploration  
- **Tableau** – Visualizations and dashboarding  
- **Skills Demonstrated:** Data cleaning, SQL schema design, exploratory analysis, business storytelling  

---

## 📈 Next Steps  
- Import cleaned CSV into **SQL Server** for querying.  
- Conduct **EDA** to identify risk patterns by borrower characteristics.  
- Compare accepted and rejected loans to detect approval decision patterns.  
- Build **dashboard visualizations** in Tableau for executive reporting.  
- Develop **predictive model** to identify high-risk applicants.  

---

👩‍💻 **Author:** Satveer Kaur  
📅 **Phase:** Data Cleaning Completed | SQL Import Ready  
🏦 **Industry Focus:** FinTech, Banking, Risk Analytics