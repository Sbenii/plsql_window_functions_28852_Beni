-- Compare current month total with previous month
SELECT
    branch_name,
    month,
    monthly_total,
    monthly_total -
    LAG(monthly_total) OVER (
        PARTITION BY branch_name
        ORDER BY month
    ) AS monthly_growth
FROM (
    SELECT
        b.branch_name,
        TRUNC(t.transaction_date,'MM') AS month,
        SUM(t.amount) AS monthly_total
    FROM TRANSACTIONS t
    JOIN ACCOUNTS a ON t.account_id = a.account_id
    JOIN CUSTOMERS c ON a.customer_id = c.customer_id
    JOIN BRANCHES b ON c.branch_id = b.branch_id
    GROUP BY b.branch_name, TRUNC(t.transaction_date,'MM')
) monthly_summary ;
