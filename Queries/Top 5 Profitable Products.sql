SELECT p.product_id,p.product_name,a.frequency,(p.selling_price-p.actual_price) as profit,
(frequency*(p.selling_price-p.actual_price)) as profit_earned
from products as p
right join (SELECT product_id, count(product_id) as Frequency  
FROM orders
GROUP BY product_id) as a on a.product_id=p.product_id
order by profit_earned desc 
limit 5;
