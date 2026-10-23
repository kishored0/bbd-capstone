-- Rep performance against target for completed orders

  select r.rep_name,
  o.order_month,
  r.monthly_target,
  sum(o.amount) as revenue,
  case
    when sum(o.amount) < r.monthly_target then 'Below Target'
    when sum(o.amount) >= r.monthly_target and sum(o.amount) < 1.1*r.monthly_target then 'On Target'
  else 'Above Target'
  end as 'Performance_Tier'
  from reps r
  left join customers c
  on r.rep_id=c.rep_id
  left join orders o
  on c.customer_id=o.customer_id
  where o.status = 'completed'
  group by r.rep_name,o.order_month,r.monthly_target
  order by r.rep_name,o.order_month;
