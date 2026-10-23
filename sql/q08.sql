-- Customer profile by region with region, number_of_customers, average_age, min_age, max_age from the customers table, grouped by region and ordered by region. 

  select region,
  count(customer_id) as no_of_customers,
  avg(age) as average_age,
  min(age) as min_age,
  max(age) as max_age
  from customers
  group by region
  order by region;
