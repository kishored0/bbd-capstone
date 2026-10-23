-- Strong products with item, number_of_orders, revenue for completed orders grouped by item, keeping only items whose revenue is greater than 20000, ordered by revenue descending.

  select item,
  count(order_id) as no_of_orders,
  sum(amount) as revenue
  from orders
  where status = 'completed'
  group by item
  having revenue > 20000
  order by revenue desc;