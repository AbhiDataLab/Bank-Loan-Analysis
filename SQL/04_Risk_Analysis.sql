-- ==========================================
-- Risk Analysis 
-- ==========================================

-- Loan Applications by Grade 

SELECT GRADE , 
     COUNT(*) AS TOTAL_APPLICATION 
     FROM BANK_LOAN 
     GROUP BY GRADE 
     ORDER BY TOTAL_APPLICATION DESC ;


--Default Analysis by Grade (CHARGED OFF) 

SELECT GRADE , 
     COUNT(*) AS TOTAL_APPLICATION 
     FROM BANK_LOAN 
     WHERE LOAN_STATUS = "CHARGED OFF" 
     GROUP BY GRADE 
     ORDER BY  TOTAL_APPLICATION DESC;



-- Default RATE BY GRADE 

SELECT GRADE ,
COUNT(*) AS TOTAL_LOANS , 
SUM( CASE 
		WHEN LOAN_STATUS = "CHARGED OFF" THEN 1 
        ELSE 0 
        END ) AS DEFAULATED_LOAN ,
	ROUND(
    SUM(CASE
			WHEN LOAN_STATUS = "CHARGED OFF" THEN 1 
            ELSE 0 
            END) *100.0/ COUNT(*) ,
		2) AS DEFAULT_RATE_PERCENTAGE 
        
	FROM BANK_LOAN 
    GROUP BY GRADE 


--  Verification Status Analysis

SELECT verification_status , 
    COUNT(*) AS TOTAL_APPLICATION 
    FROM BANK_LOAN 
    GROUP BY verification_status
    ORDER BY TOTAL_APPLICATION desc;
    

    --LOAN_ TERM _ANALYIS 

    SELECT term , 
	count(*) AS TOTAL_APPLICATION ,
    SUM(LOAN_AMOUNT) AS TOTAL_FUNDED_AMOUNT ,
    SUM(TOTAL_PAYMENT) AS TOTAL_PAYMENT_RECEVIED 
    FROM BANK_LOAN
    GROUP BY TERM 
    ORDER BY TOTAL_PAYMENT_RECEVIED desc;


--: Loan Purpose Default Analysis

SELECT PURPOSE ,
COUNT(*) AS  DEFAULTED_LOANS 
	 FROM  BANK_LOAN 
     WHERE LOAN_STATUS = "CHARGED OFF" 
     group by PURPOSE 
     ORDER BY DEFAULTED_LOANS desc;

     