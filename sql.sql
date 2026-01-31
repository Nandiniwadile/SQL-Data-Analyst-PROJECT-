use bank;
SELECT * FROM transactions

-- 1. detecting recursive fraudulent transactions

WITH RECURSIVE fraud_chain as(
select 
 nameOrig as initial_account,
 namedest as next_account,
 step,
 amount,
 newbalanceOrg
from 
transactions 
where isfraud = 1 and type='transfer'

union all

select fc.initial_account,
t.namedest,
t.step,
t.amount,
t.newbalanceOrg
from fraud_chain fc
join transactions t
 on fc.next_account= t.nameOrig
 and fc.step < t.step
where t.isfraud = 1 
 and t.type='transfer'
 )

select*from fraud_chain;


-- 2. Analyzing Fraudulent Activity over Time

with rolling_fraud as
(select nameOrig, step,
sum(isfraud) over( partition by nameOrig order by step rows between 4 preceding and current row)
 as fraud_rolling from transactions)
 
select*from rolling_fraud
where fraud_rolling > 0
 
-- 3.Complex Fraud Detection Using Multiple CTEs

with  large_transfers as(
select nameOrig,step,amount 
from transactions 
where type = 'transfer' and amount > 500000),

no_balance_change as(
select nameOrig,step,oldbalanceOrg,newbalanceOrg  from transactions
where oldbalanceOrg = newbalanceOrg ),

flagged_transactions as(
select nameOrig,step from transactions where isflaggedfraud =1)

select 
  it.nameOrig
from 
  large_transfers as it 
join
 no_balance_change nbc on it.nameOrig= nbc.nameOrig and it.step = nbc.step
join
 flagged_transactions ft on it.nameOrig= ft.nameOrig and it.step = ft.step;


-- 4.Write me a query that checks if the computed

WITH CTE AS (
    SELECT 
        amount,
        nameOrig,
        oldbalancedest,
        newbalancedest,
        (amount + oldbalancedest) AS new_updated_Balance 
    FROM 
        transactions
)
SELECT 
    * 
FROM 

    cte 
WHERE 
    new_updated_Balance = newbalancedest;
    
-- 5.Detect Transactions with Zero Balance Before or After

SELECT 
    nameOrig, 
    nameDest, 
    oldbalanceDest, 
    newbalanceDest, 
    amount
FROM 
    transactions
WHERE 
    oldbalanceDest = 0 OR newbalanceDest = 0;
