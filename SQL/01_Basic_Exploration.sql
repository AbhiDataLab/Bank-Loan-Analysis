-- ==========================================
-- BANK LOAN ANALYSIS PROJECT
-- Basic Exploration
-- ==========================================

USE bank_loan_analysis;

-- View first 10 rows
SELECT *
FROM bank_loan
LIMIT 10;

-- 2. Count total records
SELECT COUNT(*) AS total_records
FROM bank_loan;

-- 3. View table structure
DESCRIBE bank_loan;

-- 4. Check distinct loan status
SELECT DISTINCT loan_status
FROM bank_loan;

-- 5. Check distinct loan purpose
SELECT DISTINCT purpose
FROM bank_loan;

-- 6. Check distinct home ownership
SELECT DISTINCT home_ownership
FROM bank_loan;

-- 7. Check distinct grades
SELECT DISTINCT grade
FROM bank_loan;

-- 8. Check distinct verification status
SELECT DISTINCT verification_status
FROM bank_loan;