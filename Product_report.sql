/*
_______________________________________________________________________________________________________
-------------------------------------------------------------------------------------------------------
                                        Product report
_______________________________________________________________________________________________________
-------------------------------------------------------------------------------------------------------
         
         Purpose: This report consolidates key product metrics and behaviours.
         Highlights:
         1. Gathers essential fields such as product name, category, subcategory and cost.
         2. Segments products by revenue to identify High performers, mid-range and low-performers.
         3. Aggregates product-level metrics:
             - Total orders
             - Total sales
             - Total quantity sold
             - Total customers (unique)
             - Lifespan (in months)
         4. Calculates valuable KPIs:
             - recency (months since last sale)
             - Average order revenue (AOR)
             - Average monthly revenue

__________________________________________________________________________________________________________
----------------------------------------------------------------------------------------------------------
*/

CREATE VIEW product_report AS

with cte_products AS
(
select p.product_key, product_id, product_name, category, subcategory, cost, 
count(s.order_number) as total_orders, sum(s.sales_amount) as total_sales, 
sum(s.quantity) as total_quantity_sold, 
DATEDIFF(month, min(order_date),max(order_date)) as lifespan,
count(s.customer_key) as total_customers,
DATEDIFF(month, max(s.order_date), getdate()) as recency
from gold.dim_products as p
left join gold.fact_sales as s on s.product_key = p.product_key
--where s.order_number IS NOT NULL
group by p.product_key, product_id, product_name, category, subcategory, cost
)

select product_key, product_id, product_name, category, subcategory, cost,
case when total_sales > 70000 then 'Top Performer'
when total_sales Between 40000 AND 70000 then 'Mid Range'
else 'Low Performer'
End Product_segment,
total_orders,total_sales,total_quantity_sold,total_customers,lifespan,recency,
total_sales/total_orders as Avg_order_value,
total_sales/lifespan as Avg_monthly_revenue
from cte_products;

select * from product_report;
