-- Target customer segment with customer_id, first_name, last_name, region, age for customers in the North or West region whose age is between 25 and 40 inclusive, ordered by age ascending and then customer_id ascending. Use the IN and BETWEEN operators.

  select customer_id,
  first_name,
  last_name,
  region,
  age
  from customers
  where region in ('north','west') and age between 25 and 40 
  order by age asc,customer_id asc;