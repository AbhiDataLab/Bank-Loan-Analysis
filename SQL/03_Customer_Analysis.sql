-- ==========================================
-- Customer Analysis 
-- ==========================================

-- 1. Which states have the highest number of loan applications?
 SELECT 
 ADDRESS_STATE , 
 COUNTM(*) AS TOTAL_APPLICATION 
 FROM BANK_LOAN 
 GROUP BY ADDRESS_STATE 
 ORDER BY TOTAL_APPLICATION DESC ;

 --2 Which states received the highest loan funding? 

 SELECT 
address_state , 
SUM(LOAN_AMOUNT)  AS TOTAL_FUNDED_AMOUNT 
FROM bank_loan
group by ADDRESS_STATE 
ORDER BY TOTAL_FUNDED_AMOUNT desc;

--3 Why are customers taking loans? 

SELECT PURPOSE , 
    COUNT(*) AS TOTAL_APPLICATION 
    FROM BANK_LOAN 
    GROUP BY PURPOSE 
    ;


--4 Home Ownership Analysis

SELECT HOUSE_OWNERSHIP ,
    COUNT(*) AS TOTAL_APPLICATION 
    FROM BANK_LOAN 
    GROUP BY HOUSE_OWNERSHIP 
    ORDER BY TOTAL_APPLICATION DESC ;


-- Employment Length Analysis 

SELECT emp_length , 
	COUNT(*) AS TOTAL_APPLICATION 
    FROM BANK_LOAN 
    GROUP BY emp_length
    ORDER BY TOTAL_APPLICATION desc;

    