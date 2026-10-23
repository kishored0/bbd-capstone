-- Orders by status with status, number_of_orders, total_amount for all orders, grouped by status and ordered by number_of_orders descending. 

  select status,
  count(order_id) as no_of_orders,
  sum(amount) as total_amount
  from orders
  group by status
  order by no_of_orders desc;