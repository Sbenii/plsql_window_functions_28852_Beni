-- List all customers even if they have no transactions
SELECT 
    c.full_name AS customer_name,
    b.branch_name,
    t.transaction_id,
    t.amount
FROM CUSTOMERS c
LEFT JOIN ACCOUNTS a 
    ON c.customer_id = a.customer_id     -- link customer to account
LEFT JOIN TRANSACTIONS t 
    ON a.account_id = t.account_id       -- link account to transactions
LEFT JOIN BRANCHES b 
    ON c.branch_id = b.branch_id         -- link customer to branch
WHERE t.transaction_id IS NULL;           -- filter customers with no transactions
