select * from sales;


-- running total	
select
  sale_date,
  salesorderid,
  subtotal,
  sum(subtotal) 
  over(
  	partition by sale_date 
	order by salesorderid
  ) as total_sales,
  min(subtotal)
  over(
    partition by sale_date 
    order by salesorderid 
  ) min_sales, 
  avg(subtotal)
  over(
    partition by sale_date 
    order by salesorderid 
  ) avg_sales
from 
  sales
where 
  sale_date between 
'2018-01-01' and '2018-12-31'
order by sale_date;


-- top sales in each month by subtotal
select
  ordermonth,
  sale_date,
  salesorderid,
  subtotal,
  rank() over(
    partition by ordermonth
  	order by subtotal desc
  	) as sales_rank
from 
  sales
where 
  sale_date between 
'2018-01-01' and '2018-12-31'
order by ordermonth, sales_rank;

-- top sales in each month by subtotal
select
  ordermonth,
  sale_date,
  salesorderid,
  subtotal,
  rank() over(
  	order by subtotal desc
  	) as sales_rank
from 
  sales
where 
  sale_date between 
'2018-01-01' and '2018-12-31'
order by sales_rank;

