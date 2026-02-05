-- Running monthly transaction totals per branch
SELECT
    b.branch_name,
    TRUNC(t.transaction_date, 'MM') AS month,
    SUM(t.amount) AS monthly_total,
    SUM(SUM(t.amount)) OVER (
        PARTITION BY b.branch_name
        ORDER BY TRUNC(t.transaction_date,'MM')
    ) AS running_total
FROM TRANSACTIONS t
JOIN ACCOUNTS a ON t.account_id = a.account_id
JOIN CUSTOMERS c ON a.customer_id = c.customer_id
JOIN BRANCHES b ON c.branch_id = b.branch_id
GROUP BY b.branch_name, TRUNC(t.transaction_date,'MM')
ORDER BY b.branch_name, month;
