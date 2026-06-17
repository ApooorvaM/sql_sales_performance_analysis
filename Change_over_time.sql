-- Analyze sales performance over time

-- Sales by order date
select order_date, sum(sales_amount) as sales_daywise
from gold.fact_sales
where order_date IS NOT NULL
group by order_date
order by order_date asc;

-- Sales year wise
select Year(order_date) as order_year, 
sum(sales_amount) as sales_yearwise,
count(customer_key) as customer_count,
sum(quantity) as quantity_sold
from gold.fact_sales
where Year(order_date) IS NOT NULL
group by year(order_date)
order by year(order_date) asc;

--Sales month wise
select format(order_date,'yyyy MMM') as order_month, 
SUM(sales_amount) as sales_monthwise,
COUNT(customer_key) as customer_count,
SUM(quantity) as quantity_sold
from gold.fact_sales
where format(order_date,'yyyy MMM') IS NOT NULL
group by format(order_date,'yyyy MMM')
order by format(order_date,'yyyy MMM') asc;
