/* Analyze the yearly sales performance of each product by comparing its product's sales to both its average
 sales performance over the years and the previous year's sales */

select *, AVG(sales) over (partition by product_name) as avg_sales
,lag(sales) over (partition by product_name order by order_year asc) as py_sales,
sales - AVG(sales) over (partition by product_name) as difference_from_avg,
case when sales - AVG(sales) over (partition by product_name)> 0 then 'Above Average'
when sales - AVG(sales) over (partition by product_name) < 0 then 'Below Average'
else 'Average' END comparison_by_avg,
sales - lag(sales) over (partition by product_name order by order_year asc) as py_diff,
case when sales - lag(sales) over (partition by product_name order by order_year asc)> 0 then 'Increased'
when sales - lag(sales) over (partition by product_name order by order_year asc) < 0 then 'Decreased'
else 'No change' END py_comparison
from
(
select p.product_number, p.product_name, 
sum(s.sales_amount) as sales, year(s.order_date) as order_year 
from gold.dim_products as p
left join gold.fact_sales as s on p.product_key = s.product_key
where year(s.order_date) IS NOT NULL
group by p.product_number, p.product_name, year(order_date)
)t
order by product_name asc;

