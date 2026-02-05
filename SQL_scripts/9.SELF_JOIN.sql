-- Find customers who registered on the same date
SELECT 
    c1.full_name AS customer_1,
    c2.full_name AS customer_2,
    c1.registration_date
FROM CUSTOMERS c1
JOIN CUSTOMERS c2
    ON c1.registration_date = c2.registration_date
    AND c1.customer_id < c2.customer_id;
