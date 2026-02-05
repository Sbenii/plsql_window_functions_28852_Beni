-- Combine all customers and transactions to get full overview
SELECT 
    c.full_name AS customer_name,
    a.account_id,
    t.transaction_id,
    t.amount
FROM CUSTOMERS c
FULL OUTER JOIN ACCOUNTS a 
    ON c.customer_id = a.customer_id
FULL OUTER JOIN TRANSACTIONS t 
    ON a.account_id = t.account_id
ORDER BY c.full_name;
