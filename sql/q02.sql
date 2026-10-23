-- Missing amounts with order_id, customer_id, item, status for orders whose amount is missing, ordered by order_id.

  select order_id,
  customer_id,
  item,status
  from orders
  where amount is NULL
  order by order_id;