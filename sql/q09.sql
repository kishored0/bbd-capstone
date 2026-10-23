-- Order-level fact table with order_id, order_month, first_name, last_name, region (the customer's region), rep_name, item, quantity, amount, status for every order, produced by joining orders, customers and reps on their key columns, ordered by order_id.

  select o.order_id,
  o.order_month,
  c.first_name,
  c.last_name,
  c.region,
  r.rep_name,
  o.item,
  o.quantity,
  o.amount,
  o.status
  from orders o
  left join customers c on o.customer_id=c.customer_id
  left join reps r on c.rep_id=r.rep_id
  order by order_id;