-- Which category contribute the most to overall sales?

with prod_sales as
(
select p.category, sum(s.sales_amount) as prod_sales
from gold.fact_sales as s
left join gold.dim_products as p on p.product_key = s.product_key
group by p.category 
)
select category, prod_sales,
concat(round(cast(prod_sales as float) *100/sum(prod_sales) over (),2),'%') as percent_contri
from prod_sales
order by percent_contri desc;

