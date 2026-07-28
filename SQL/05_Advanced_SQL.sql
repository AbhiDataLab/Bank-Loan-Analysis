=========================================
-- Advanced SQL 
==========================================

--Top 10 Highest Loan Amounts

 select id , grade, loan_status, annual_income , loan_amount
 from bank_loan 
 order by loan_amount desc
 limit 10 ;

 --: Rank States by Total Funded Amount

select address_state , 
sum(loan_amount) as total_funded_amount,  
rank() over(order by sum(loan_amount) desc) as state_rank
	from bank_loan 
    group by address_state;


 --Find the top 5 states that received the highest loan amount 

select address_state , 
sum(loan_amount) as highest_loan_amount
from bank_loan 
group by address_state
order by highest_loan_amount desc
limit 5 ;

--Classify each loan as Small, Medium, or Large based on the loan amount."

select id ,
loan_amount , 
case 
	when loan_amount < 5000 then "Small_loan"
    when loan_amount between 5000  and 15000 then "medium_loan"
	when loan_amount > 15000 then "large_loan"
end as loan_category
from bank_loan ;


--"Show all customers whose loan amount is greater than the average loan amount." 

 select *
 from bank_loan 
 where loan_amount > 
 (
    select round( avg(loan_amount),2) avgerage_loan 
    from bank_loan
);
     
--"Show all customers whose annual income is greater than the average annual income." 
 select *
 from bank_loan 
 where annual_income > 
 (
	select round(avg(annual_income),2) avgerage_annual_income
	from bank_loan
) ;

-- "Show all states whose average loan amount is greater than ₹12,000."

WITH state_avg AS
(
    SELECT
        address_state,
        AVG(loan_amount) AS avg_loan
    FROM bank_loan
    GROUP BY address_state
)
SELECT *
FROM state_avg
WHERE avg_loan > 12000;


--"Find the total funded amount for ea h grade, then show only the grades  where the total funded amount is greater than ₹50,00,000."

with grades as 
	( select grade ,
    sum(loan_amount ) as total_funded_amount 
    from bank_loan
    group by grade) 
    
    select * from grades
    where total_funded_amount > 5000000;

    -- Rank all states based on the total funded loan amount (highest first). 

select address_state , 
sum(loan_amount) as total_amount_funded ,
rank() over(order  by (sum(loan_amount))desc) as rank_based_on_funded
from bank_loan 
group by address_state ;



--Rank all grades based on the average interest rate using DENSE_RANK(). 

SELECT
    grade,
    ROUND(AVG(int_rate),2) AS average_interest_rate,
    DENSE_RANK() OVER (
        ORDER BY ROUND(AVG(int_rate),2) DESC
    ) AS interest_rate_rank
FROM bank_loan
GROUP BY grade;



