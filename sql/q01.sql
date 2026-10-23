-- Pending orders with order_id, customer_id, item, amount for orders with status pending, ordered by order_id ascending.
 
  select order_id,
  customer_id,
  item,amount
  from orders
  where status = 'pending'
  order by order_id asc;