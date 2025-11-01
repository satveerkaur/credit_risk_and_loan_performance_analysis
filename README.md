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

## 🛠️ Project Phases & Analytical Highlights

The project is structured across several sequential phases within Jupyter Notebooks:

| Notebook | Focus | Key Analytical Deliverable | Status |
| :--- | :--- | :--- | :--- |
| **01** | Data Setup & Cleaning | Final clean CSVs. | Completed |
| **02** | Target Sampling & Initial EDA | Stratified sample created; initial risk patterns identified. | Completed |
| **03** | **Feature Engineering & Validation** | **Monotonicity** of new risk segments confirmed via ODR analysis. **Primary risk factors finalized.** | **Completed** |
| **04** | **Final Analysis & Reporting** | **Executive Risk Tables** and **Final Analytical Report** summarizing key findings. | **In Progress** |

### **Feature Engineering Highlights (Notebook 03)**

* **Risk Segmentation:** Created categorical segments for FICO score, DTI ratio, and Annual Income.
* **Validation:** Developed a custom Python utility to plot **Observed Default Rate (ODR)** against **Volume Percentage** to prove segment stability and monotonicity.
* **Output:** Saved the final, structured dataset (`binned_sample_for_reporting.csv`) ready for direct analytical reporting.

---

## 🧰 Tools & Skills Used

-   **Python (Pandas, NumPy)** – Data cleaning, feature engineering, and data manipulation.
-   **Seaborn / Matplotlib** – Advanced data visualization and custom risk plot generation.
-   **Jupyter Notebooks** – Analysis documentation and pipeline execution.
-   **Git** – Version control and project history management.
-   **Skills Demonstrated:** Data cleaning, Feature Engineering, Risk Segmentation, Monotonicity Validation, and Business Storytelling.


👩‍💻 **Author:** Satveer Kaur  
📅 **Phase:** Feature Engineering Completed | Reporting Phase Started
🏦 **Industry Focus:** FinTech, Banking, Risk Analytics
