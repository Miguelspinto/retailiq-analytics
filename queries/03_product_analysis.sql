SELECT
    ct.category_name_english AS product_categories,
    COUNT(o.order_id) AS order_number
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN category_translation ct ON p.category_name = ct.category_name
GROUP BY ct.category_name_english
ORDER BY order_number DESC
LIMIT 10;