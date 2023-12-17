SELECT SUM(sales) AS total_sales FROM orders;

SELECT SUM(profit) AS total_profit FROM orders;

SELECT order_id, SUM(profit) AS profit_per_order FROM orders GROUP BY order_id;

SELECT customer_id, 
SUM(sales) AS sales_per_customer 
FROM orders 
GROUP BY customer_id;

SELECT round(avg(discount), 2) AS avg_discount FROM orders;

--Посмотреть, как высчитавает коэфициент прибыли, а то у меня что-то совсем маленькие значения
SELECT order_id, sales, round((sales / sum(sales) over()*100), 2) AS profit_ratio 
FROM orders
GROUP BY order_id, sales 
ORDER BY 1, 3 DESC

SELECT date_part('month', order_date) AS month, segment, SUM(sales) AS sales
FROM orders 
GROUP BY segment, MONTH 
ORDER BY segment, MONTH;

SELECT date_part('month', order_date) AS month, category , SUM(sales) AS sales
FROM orders 
GROUP BY category, MONTH 
ORDER BY category , MONTH;

SELECT category , SUM(sales) AS sales
FROM orders 
GROUP BY category
ORDER BY category ;


SELECT customer_id, sum(sales) AS sales, sum(profit) AS profit
FROM orders
GROUP BY 1
ORDER BY 1 --Почему в прибыли есть отрицательные значения и это вообще в порядке вещей или нет

SELECT region, sum(sales) AS sales
FROM orders 
GROUP BY region 
ORDER BY region 


SELECT customer_id, sales_per_customer, RANK() OVER(ORDER BY sales_per_customer DESC)
FROM (SELECT customer_id, 
SUM(sales) AS sales_per_customer
FROM orders 
GROUP BY customer_id
ORDER BY 2 DESC) t1





