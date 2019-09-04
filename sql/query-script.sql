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
  ) as total_sales
from 
  sales
where 
  sale_date between 
'2018-01-01' and '2018-12-31'
order by sale_date;