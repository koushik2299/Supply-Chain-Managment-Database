-- Inventories in Boston Location
SELECT i.inventory_id, i.inventory_name ,l.location_zip,sum(ise.quantity) as Stock_Level
from inventory as i 
join locations as l on i.location_id = l.location_id 
join inventory_stocks as ise on i.inventory_id = ise.inventory_id
where l.location_name = "Boston"
group by ise.inventory_id
order by Stock_level desc;