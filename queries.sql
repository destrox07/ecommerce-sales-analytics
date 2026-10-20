
SELECT
    DATE_TRUNC('month', o.order_date)::date AS month,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM public.orders o
JOIN public.order_items oi
    ON o.order_id = oi.order_id
WHERE o.status <> 'Cancelled'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;

SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    SUM(oi.quantity * (oi.unit_price - oi.unit_cost)) AS total_profit
FROM public.order_items oi
JOIN public.orders o ON o.order_id = oi.order_id
JOIN public.products p ON p.product_id = oi.product_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_name
ORDER BY total_revenue DESC;

SELECT
    status,
    COUNT(*) AS order_count
FROM public.orders
GROUP BY status
ORDER BY order_count DESC;
