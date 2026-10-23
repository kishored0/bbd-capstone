-- Five biggest completed orders with order_id, customer_id, item, amount for completed orders, ordered by amount descending and then order_id ascending, restricted to the first 5 rows.

  select order_id,
  customer_id,
  item,amount
  from orders
  where status = 'completed'
  order by amount desc,order_id asc
  limit 5;