-- Customers who never ordered with customer_id, first_name, last_name, region for customers that have no order at all 

  select c.customer_id,
  c.first_name,
  c.last_name,
  c.region
  from customers c
  left join orders o
  on c.customer_id=o.customer_id
  where o.customer_id is null
  order by c.customer_id;