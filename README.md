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
- `accepted_loans.csv` (from LendingClub, Kaggle)  
- `rejected_loans.csv` (from LendingClub, Kaggle) 

### **Cleaning Steps:**  
1. Dropped irrelevant columns that are not needed for analysis or SQL import.  
2. Standardized column names to **snake_case** format to match SQL schema.  
3. Converted numeric fields, dates, and categorical variables to proper types.  
4. Verified that cleaned datasets are ready for sampling and visualization.  
5. Exported **cleaned CSVs** for future analysis and SQL import. 


### **Key Column Mapping:(Accepted Loans)**  

| Original Column Name | Cleaned Column Name  | Notes                                   |
| -------------------- | -------------------- | --------------------------------------- |
| Loan ID              | id                   | Primary key for accepted loans          |
| Loan Amount          | amount_requested     | Numeric format                          |
| Term                 | term                 | e.g., '36 months'                       |
| Interest Rate        | interest_rate        | Numeric percentage                      |
| Grade                | grade                | A-G                                     |
| Sub Grade            | sub_grade            | e.g., A1, B2                            |
| Employment Length    | employment_length    | e.g., '10+ years'                       |
| Home Ownership       | home_ownership       | RENT, MORTGAGE, OWN                     |
| Annual Income        | annual_income        | Numeric                                 |
| Verification Status  | verification_status  | Verified, Not Verified                  |
| Debt-to-Income Ratio | debt_to_income_ratio | Numeric                                 |
| ZIP Code             | zip_code             | First 5 digits recommended              |
| State                | state                | 2-letter US state code                  |
| FICO Low             | fico_range_low       | Lower bound                             |
| FICO High            | fico_range_high      | Upper bound                             |
| Delinquencies 2Y     | delinquencies_2yrs   | Number of delinquencies in last 2 years |
| Total Accounts       | total_accounts       | Numeric                                 |
| Loan Status          | loan_status          | Fully Paid / Charged Off / Current      |
| Policy Code          | policy_code          | Internal policy code                    |

> ⚠️ Risk score is not included in this dataset — will be computed later based on features.

### **Key Column Mapping (Rejected Loans)**  
| Original Column Name | Cleaned Column Name  | Notes                      |
| -------------------- | -------------------- | -------------------------- |
| Amount Requested     | amount_requested     | Numeric format             |
| Application Date     | application_date     | Date of application        |
| Loan Title           | loan_title           | Loan purpose / title       |
| Debt-To-Income Ratio | debt_to_income_ratio | Numeric                    |
| ZIP Code             | zip_code             | First 5 digits recommended |
| State                | state                | 2-letter US state code     |
| Employment Length    | employment_length    | e.g., '4 years'            |

### **Example Data Cleaning Code (Python / Pandas):**

```python
# 1. Load raw datasets
import pandas as pd

accepted_loans = pd.read_csv('data/accepted_loans.csv')
rejected_loans = pd.read_csv('data/rejected_loans.csv')

# 2. Drop irrelevant columns
drop_cols_accepted = ['member_id', 'url', 'desc', 'title', 'pymnt_plan', 
                      'out_prncp_inv', 'hardship_flag', 'hardship_type', 
                      'hardship_reason', 'hardship_status', 'deferral_term',
                      'hardship_amount', 'hardship_start_date', 'hardship_end_date']
accepted_loans.drop(columns=drop_cols_accepted, errors='ignore', inplace=True)

drop_cols_rejected = ['extra_column_if_any']  # remove unnecessary columns
rejected_loans.drop(columns=drop_cols_rejected, errors='ignore', inplace=True)

# 3. Rename columns to match SQL schema
accepted_loans.rename(columns={
    'id': 'loan_id',
    'loan_amnt': 'loan_amount',
    'term': 'term',
    # Additional columns mapped similarly
}, inplace=True)

rejected_loans.rename(columns={
    'amount_requested': 'loan_amount',
    'application_date': 'application_date',
    # Additional columns mapped similarly
}, inplace=True)

# 4. Convert data types
numeric_cols = ['loan_amount', 'interest_rate', 'annual_income', 'debt_to_income_ratio']
for col in numeric_cols:
    accepted_loans[col] = pd.to_numeric(accepted_loans[col], errors='coerce')
    rejected_loans[col] = pd.to_numeric(rejected_loans[col], errors='coerce')

date_cols = ['application_date']
for col in date_cols:
    accepted_loans[col] = pd.to_datetime(accepted_loans[col], format='%Y-%m-%d', errors='coerce')
    rejected_loans[col] = pd.to_datetime(rejected_loans[col], format='%Y-%m-%d', errors='coerce')

# 5. Export cleaned datasets for sampling/analysis
accepted_loans.to_csv('data/clean_data/accepted_loans_clean.csv', index=False)
rejected_loans.to_csv('data/clean_data/rejected_loans_clean.csv', index=False)

```
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
