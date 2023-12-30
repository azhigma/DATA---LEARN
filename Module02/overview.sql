-- Запрос для вывода общей суммы продаж за все время
SELECT 
  SUM(sales) AS total_sales 
FROM 
  orders;

-- Запрос для вывода общей суммы прибыли за все время
SELECT 
  SUM(profit) AS total_profit 
FROM 
  orders;

-- Запрос для вывода прибыли на каждый сделанный пользователем заказ
SELECT 
  order_id, 
  SUM(profit) AS profit_per_order 
FROM 
  orders 
GROUP BY 
  order_id;

-- Запрос для выводы суммы продажи на каждый сделанный пользователем заказ
SELECT 
  customer_id, 
  SUM(sales) AS sales_per_customer 
FROM 
  orders 
GROUP BY 
  customer_id 
ORDER BY 
  2 DESC;
  
-- Запрос для выводы средней величины скидки, округленной до двух знаков после запятой
SELECT 
  round(
    avg(discount), 
    2
  ) AS avg_discount 
FROM 
  orders;

-- Запрос для подсчета коэффициента прибыли на сумму заказа
SELECT 
  order_id, 
  sales, 
  round(
    (
      sales / sum(sales) over()* 100
    ), 
    2
  ) AS profit_ratio 
FROM 
  orders 
GROUP BY 
  order_id, 
  sales 
ORDER BY 
  1, 
  3 DESC 
  
-- Запрос для подсчета суммы продаж опеределенного сегмента в каждом месяце года
SELECT 
  date_part('month', order_date) AS month, 
  segment, 
  SUM(sales) AS sales 
FROM 
  orders 
GROUP BY 
  segment, 
  MONTH 
ORDER BY 
  segment, 
  MONTH;

-- Запрос для подсчета суммы продаж опеределенного категории товаров в каждом месяце года
SELECT 
  date_part('month', order_date) AS month, 
  category, 
  SUM(sales) AS sales 
FROM 
  orders 
GROUP BY 
  category, 
  MONTH 
ORDER BY 
  category, 
  MONTH;

-- Запрос для подсчета суммы продаж для каждой категории товаров
SELECT 
  category, 
  SUM(sales) AS sales 
FROM 
  orders 
GROUP BY 
  category 
ORDER BY 
  category;

-- Запрос для подсчета прибыли и суммы продаж на каждого пользователя
SELECT 
  customer_id, 
  sum(sales) AS sales, 
  sum(profit) AS profit 
FROM 
  orders 
GROUP BY 
  1 
ORDER BY 
  1;

-- Запрос для подсчета объемов продаж на регион
SELECT 
  region, 
  sum(sales) AS sales 
FROM 
  orders 
GROUP BY 
  region 
ORDER BY 
  region;
  
 -- Запрос для ранжирования пользователей в зависимости от величины суммы продаж, сделанный данным пользователем
SELECT 
  customer_id, 
  sales_per_customer, 
  RANK() OVER(
    ORDER BY 
      sales_per_customer DESC
  ) 
FROM 
  (
    SELECT 
      customer_id, 
      SUM(sales) AS sales_per_customer 
    FROM 
      orders 
    GROUP BY 
      customer_id 
    ORDER BY 
      2 DESC
  ) t1



