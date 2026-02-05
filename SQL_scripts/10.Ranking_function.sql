-- Rank customers within each branch based on total transaction value
SELECT *
FROM (
    SELECT
        b.branch_name,
        c.full_name,
        SUM(t.amount) AS total_amount,
        RANK() OVER (
            PARTITION BY b.branch_name
            ORDER BY SUM(t.amount) DESC
        ) AS rank_no
    FROM TRANSACTIONS t
    JOIN ACCOUNTS a ON t.account_id = a.account_id
    JOIN CUSTOMERS c ON a.customer_id = c.customer_id
    JOIN BRANCHES b ON c.branch_id = b.branch_id
    GROUP BY b.branch_name, c.full_name
) ranked_customer
WHERE rank_no <= 3;
