-- Retrieve all transactions along with customer name and branch
SELECT 
    t.transaction_id,
    c.full_name AS customer_name,
    b.branch_name,
    t.transaction_date,
    t.amount,
    t.channel_type
FROM TRANSACTIONS t
INNER JOIN ACCOUNTS a 
    ON t.account_id = a.account_id       -- link transaction to account
INNER JOIN CUSTOMERS c 
    ON a.customer_id = c.customer_id     -- link account to customer
INNER JOIN BRANCHES b 
    ON c.branch_id = b.branch_id         -- link customer to branch
ORDER BY t.transaction_date;
