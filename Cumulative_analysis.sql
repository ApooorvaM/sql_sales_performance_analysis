---Calculate the total sales per month and the running total of sales over time

select * ,
SUM(total_sales) over (PARTITION BY year(order_month) order by order_month rows between unbounded preceding and current row) as running_total
from
(
select datetrunc(month,order_date) as order_month, 
SUM(sales_amount) as total_sales
from gold.fact_sales
where datetrunc(month,order_date) IS NOT NULL
group by datetrunc(month,order_date)
)t
