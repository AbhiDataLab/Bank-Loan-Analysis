 ==========================================
--IMPORTANT KPIs FOR ANLYSIS 
 ==========================================


-- KPI 1: Total Loan Applications
use bank_loan ;
SELECT COUNT(*) AS Total_Loan_Applications
FROM bank_loan;

-- kpi 2 Total funded amount 

select sum(loan_amount) as total_funded_amount
from bank_loan;


-- KPI 3 How much money has the bank received back from borrowers?

select sum(total_payment) as total_money_recevied 
from bank_loan;


KPI 4 What is the average loan amount issued by the bank?

SELECT ROUND(avg(LOAN_AMOUNT),2) AS AVGERAGE_LOAN_AMOUNT
FROM BANK_LOAN ;


-- KPI 5 What is the average interest rate charged on loans?

SELECT ROUND(avg(INT_RATE),2) AS AVERAGE_LOAN_RATE
FROM BANK_LOAN

-- KPI 6 Average Debt-to-Income (DTI) 

SELECT  ROUND(AVG(DTI),2)  AS AVGERAGE_DEBT_TO_INCOME 
FROM BANK_LOAN;

-- KPI 7 BAD AND GOOD LOAN ALONG WITH THE PERCENTAGE

SELECT 
	COUNT(*) AS GOOD_LOAN_APPLICATION ,
    ROUND(COUNT(*) *100.0/(SELECT COUNT(*) FROM BANK_LOAN),2) AS Good_Loan_Percentage

FROM BANK_LOAN
WHERE LOAN_STATUS IN  ("FULLY PAID" , "CURRENT"),


SEELCT 
    COUNT(*) AS BAD_LOAN_APPLICATION ,
    ROUND(COUNT(*) *100.0/(SELECT COUNT(*) FRIM BANK_LOAN ),2) AS BAD_LOAN_PERCENTAGE
FROM BANK_LOAN 
WHERE LOAN_STATUS = CHARGED_OFF" ;


- KPI 8 LOAN ANALYIS 

SELECT 
LOAN_STATUS , 
ROUND(SUM(LOAN_AMOUNT),2)TOTAL_FUNDED_AMOUNT,
ROUND(SUM(TOTAL_PAYMENT), 2) AS TOTAL_AMOUNT_RECEVIED ,
ROUND(AVG(INT_RATE),2) AS AVERAGE_INTEREST_RATE,
ROUND(AVG(DTI),2 AS AVERAGE_DIT

FROM BANK_LOAN
GROUP BY LOAN_STATUS
ORDER BY TOTAL_APPLICATION DESC ;


