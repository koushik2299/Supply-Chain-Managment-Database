SELECT inventory_id, sum(quantity) as Total_Stock 
from inventory_stocks
group by inventory_id
order by Total_Stock desc;