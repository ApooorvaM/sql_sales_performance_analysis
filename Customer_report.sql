/*
____________________________________________________________________________________________
--------------------------------------------------------------------------------------------
                                    Customer Report
____________________________________________________________________________________________
--------------------------------------------------------------------------------------------

Purpose: This report consolidates key customer metrics and behaviours

Highlights:
- Gathers essential fields such as names, ages and transaction details
- Segments customers into categories (VIP, Regular, New) and age groups
- Aggregates customer level metrics:
    -total orders
    -total sales
    -total quantity purchased
    -total products
    -lifespan(in months)
-Calculates valueable KPIs:
-recency (months since last order)
-average order value
-average monthly spend */
create VIEW customer_report AS

with cte_customer as
(
select c.customer_key,c.Customer_id, CONCAT(c.first_name, ' ' , c.last_name) as Name,
DATEDIFF(year, c.birthdate, getdate()) as Age,
COUNT(s.order_number) as total_orders,
SUM(s.sales_amount) as total_sales,
sum(s.quantity) as total_quantity_purchased,
count(p.product_key) as total_products,
DATEDIFF(month, min(s.order_date), max(s.order_date)) as lifespan,
AVG(s.sales_amount) as avg_order_value,
datediff(month, max(order_date), getdate()) as recency

from gold.fact_sales as s
left join gold.dim_customers as c on s.customer_key = c.customer_key
left join gold.dim_products as p on s.product_key = p.product_key

group by c.Customer_id, CONCAT(c.first_name, ' ' , c.last_name) ,c.customer_key,
DATEDIFF(year, c.birthdate, getdate()) 
)

select customer_key, Name, Age, 
--Customer segment by categories
case when lifespan>12 AND total_sales > 5000 then 'VIP'
when lifespan>12 AND total_sales<5000 then 'Regular'
else 'New' END customer_seg,
--Customer segment by age
case when Age<20 then 'Under 20'
when Age>=20 AND Age<30 then '20-30'
when Age>=30 AND Age<40 then '30-40'
when Age>=40 AND Age<50 then '40-50'
else 'Above 50'
End Customer_by_Age,
total_orders, total_sales, total_quantity_purchased,  total_products, lifespan,
recency, avg_order_value, 
--Avg monthly spend = total sales/no. of orders 
case when lifespan = 0 then total_sales    /* when lifespan = 0 i.e. only one order. then avg spending = total sales/1*/
else total_sales/lifespan
End avg_monthly_spend
from cte_customer


select * from Customer_report
