-- This Query gives the customers and their respective Number of Orders

select dense_rank() over (order by count(co.order_id) desc) as ID,
c.customer_id,c.customer_name,count(co.order_id) as Number_of_orders
from customers as c
join customer_orders as co on c.customer_id=co.customer_id
group by customer_id
order by Number_of_orders desc;