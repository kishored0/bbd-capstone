-- Product contribution tiers with item, total_revenue, contribution_tier for completed orders 

 select p.item,
  sum(o.amount) as total_revenue,
  case
    when sum(o.amount) >= 60000 then 'High'
    when sum(o.amount) >= 15000 and sum(o.amount) <60000 then 'Medium'
  else 'Low' 
  end as 'contribution_tier'
  from products p
  left join orders o
  on p.item=o.item
  where o.status = 'completed'
  group by p.item
  order by total_revenue desc;