USE da_project;
SELECT * FROM pizza_sales;

SELECT SUM(total_price) AS total_revenue FROM pizza_sales;

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS avg_order_value 
FROM pizza_sales;

SELECT SUM(quantity) AS total_pizza_sold FROM pizza_sales;

SELECT (COUNT(DISTINCT order_id)) AS total_order FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS avg_pizza_per_order FROM pizza_sales;

-- SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
-- FROM pizza_sales
-- GROUP BY DAYNAME(order_date);    -- ERROR

-- select MONTH (order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
-- from pizza_sales
-- GROUP BY MONTH(order_date);     -- ERROR

SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_size, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_size;

SELECT pizza_name, SUM(total_price) AS total_revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS total_quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS total_order FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_order DESC
LIMIT 5;