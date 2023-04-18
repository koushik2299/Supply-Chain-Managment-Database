-- TOP 5 Customers who purchased more number of items
select c.customer_id,ce.customer_name,sum(selling_price) as Amount
from customer_orders as c
join orders as co on c.order_id=co.order_id
join customers as ce on c.customer_id=ce.customer_id
group by c.customer_id
order by Amount desc
limit 5;