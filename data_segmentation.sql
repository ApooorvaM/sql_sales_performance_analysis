--Segment products into cost ranges and count how many products fall into each segment
select cost_ranges, count(product_number)
from
(
select product_number, product_name, cost,
case when cost < 750 then 'low_value'
when cost>750 AND cost< 1500 then 'mid_value'
else 'high_value'
end cost_ranges
from gold.dim_products
)t
group by cost_ranges
order by count(product_number);



--Group customers into three segments based on their spending behaviour:
--VIP: at least 12 months of history and spending more than $5000
--Regular: At least 12 months of history but spending $5000 or less
--New: lifespan less than 12 months
--And find the total number of customers by each group.

with customer_data as
(
select c.customer_id, CONCAT(c.first_name,' ',c.last_name) as customer_name, 
min(s.order_date) as first_order_date, 
max(s.order_date) as last_order_date,
datediff(month,min(s.order_date),max(s.order_date)) as customer_lifespan, 
sum(s.sales_amount) as total_spending
from gold.dim_customers as c
Left join gold.fact_sales as s
on c.customer_key = s.customer_key
group by c.customer_id, CONCAT(c.first_name,' ',c.last_name)
)
, customer_segment AS
(
select customer_id, customer_name,
case when customer_lifespan >= 12 AND total_spending > 5000 then 'VIP'
when customer_lifespan >= 12 AND total_spending < 5000 then 'Regular'
else 'New Customer' END Customer_segment
from customer_data
)
select Customer_segment, count(customer_name) as Customer_count
from customer_segment
group by Customer_segment
Order by Customer_count;
