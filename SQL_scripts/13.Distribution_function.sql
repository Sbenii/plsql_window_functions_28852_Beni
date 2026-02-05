-- Divide customers into 4 value groups
SELECT
    c.full_name,
    SUM(t.amount) AS total_amount,
    NTILE(4) OVER (
        ORDER BY SUM(t.amount) DESC
    ) AS quartile
FROM TRANSACTIONS t
JOIN ACCOUNTS a ON t.account_id = a.account_id
JOIN CUSTOMERS c ON a.customer_id = c.customer_id
GROUP BY c.full_name;
