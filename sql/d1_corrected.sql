-- Question - Fix the query against the real schema (keep 80,000), run it, then test the 38% claim with q11.
-- Which regions sell the most? 


  select c.region,
  SUM(o.amount) AS total_sales
  from orders o
  left join customers c
  on o.customer_id=c.customer_id
  where o.status = 'completed'
  group by c.region
  having SUM(o.amount) > 80000
  order by total_sales desc;
