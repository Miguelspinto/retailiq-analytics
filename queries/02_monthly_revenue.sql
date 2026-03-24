SELECT
    TO_CHAR(DATE_TRUNC('month', o.order_purchase_timestamp), 'YYYY-MM') AS month,
    ROUND(SUM(op.payment_value), 2) AS monthly_revenue
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY DATE_TRUNC('month', o.order_purchase_timestamp) DESC;