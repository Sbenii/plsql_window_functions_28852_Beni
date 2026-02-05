-- Display all transactions and the associated customer names
SELECT 
    c.full_name,
    t.transaction_id,
    t.amount
FROM CUSTOMERS c
RIGHT JOIN ACCOUNTS a 
    ON c.customer_id = a.customer_id
RIGHT JOIN TRANSACTIONS t 
    ON a.account_id = t.account_id;
