-- Region and month report with region, order_month, number_of_orders, number_of_customers (distinct customers), total_revenue, average_revenue.

-- why left join was chosen:
-- i have used left join in this case bring together customers information and orders information.
-- by adding the filter where o.status = 'completed' the query only include completed orders .

-- #why distinct is necessary:
-- count(distinct c.customer_id) is required because a single customer can place multiple completed orders in same month, 
-- use distinct each custonmer count only once rather than counting duplicate orders.  

  select c.region,
  o.order_month,
  count(o.order_id) as no_of_orders,
  count(distinct c.customer_id) as no_of_customers,
  sum(o.amount) as total_revenue,
  avg(o.amount) as average_revenue
  from customers c
  left join orders o
  on c.customer_id=o.customer_id
  where o.status = 'completed'
  group by c.region,o.order_month
  order by c.region,o.order_month;