-- ===============================================
-- Project: Credit Risk and Loan Performance Analysis
-- Purpose: Create database, import accepted and rejected loan applications csv files, clean columns, and set loan status
-- Author: Satveer Kaur
-- Date: 2025-10-17
-- Notes: Includes database creation, table creation, BULK INSERT, and basic cleaning
-- ===============================================

-- ========================================================
-- Step 1: Create the database
-- Checks if database already exists and creates it if not
-- ========================================================
IF DB_ID('credit_risk_and_loan_performance') IS NULL
BEGIN
	CREATE DATABASE credit_risk_and_loan_performance
END
ELSE
BEGIN
	PRINT 'Database credit_risk_and_loan_performance already exists'
END
GO

-- ========================================================
-- Step 2: Switch to the new database
-- ========================================================
USE credit_risk_and_loan_performance;
GO

-- ========================================================
-- Step 3: Create table for accepted loans
-- Includes applicant profile, loan details, and key credit metrics
-- ========================================================
CREATE TABLE loans_accepted(
    id BIGINT PRIMARY KEY,                           -- Unique identifier for accepted loan
    amount_requested FLOAT,                          -- Requested loan amount by the applicant
    funded_amount FLOAT,                             -- Amount actually funded
    funded_amount_invested FLOAT,                    -- Amount funded by investors
    term VARCHAR(20),                                -- Loan term (e.g., '36 months')
    interest_rate FLOAT,                             -- Interest rate for the loan
    installment FLOAT,                               -- Monthly installment amount
    grade CHAR(1),                                   -- Loan grade (A-G)
    sub_grade VARCHAR(2),                            -- Loan sub-grade (e.g., A1, B2)
    risk_score INT,                                  -- Risk score assigned to applicant
    employment_length VARCHAR(20),                   -- Years of employment
    home_ownership VARCHAR(20),                      -- Home ownership status (RENT, MORTGAGE, OWN)
    annual_income FLOAT,                             -- Annual income of applicant
    verification_status VARCHAR(50),                 -- Income verification status
    debt_to_income_ratio FLOAT,                      -- Debt-to-Income ratio (numeric)
    zip_code VARCHAR(10),                            -- Applicant zip code (first 5 digits recommended)
    state CHAR(2),                                   -- Two-letter US state code
    fico_range_low INT,                              -- Lower bound of FICO score
    fico_range_high INT,                             -- Upper bound of FICO score
    delinquencies_2yrs INT,                          -- Number of delinquencies in last 2 years
    open_accounts INT,                               -- Number of open credit accounts
    public_records INT,                              -- Number of derogatory public records
    revolving_balance FLOAT,                         -- Total revolving balance
    revolving_utilization FLOAT,                     -- Revolving line utilization percentage
    total_accounts INT,                              -- Total number of credit accounts
    policy_code INT,                                 -- Internal policy code
    application_date DATE,                           -- Date application was submitted
    loan_title VARCHAR(255),                         -- Title / purpose of the loan
    loan_status VARCHAR(20) DEFAULT 'approved'       -- Approved by default
);	
GO

-- ========================================================
-- Step 3: Create table for rejected loans
-- Excludes payment performance metrics since no transaction data is available
-- Auto-incremented primary key for uniqueness
-- ========================================================
CREATE TABLE loans_rejected (
    rejected_id BIGINT IDENTITY(1,1) PRIMARY KEY,    -- Auto-increment ID for rejected loans
    amount_requested FLOAT,                          -- Requested loan amount
    term VARCHAR(20),                                -- Loan term (e.g., '36 months')
    interest_rate FLOAT,                             -- Proposed interest rate
    installment FLOAT,                               -- Proposed monthly installment
    grade CHAR(1),                                   -- Proposed loan grade
    sub_grade VARCHAR(2),                            -- Proposed sub-grade
    risk_score INT,                                  -- Risk score assigned to applicant
    employment_length VARCHAR(20),                   -- Years of employment
    home_ownership VARCHAR(20),                      -- Home ownership status
    annual_income FLOAT,                             -- Annual income of applicant
    verification_status VARCHAR(50),                 -- Income verification status
    debt_to_income_ratio FLOAT,                      -- Debt-to-Income ratio (numeric)
    zip_code VARCHAR(10),                            -- Applicant zip code (first 5 digits)
    state CHAR(2),                                   -- Two-letter US state code
    policy_code INT,                                 -- Internal policy code
    application_date DATE,                           -- Date application was submitted
    loan_title VARCHAR(255),                         -- Title / purpose of the loan
    loan_status VARCHAR(20) DEFAULT 'rejected'      -- Rejected by default
);
GO