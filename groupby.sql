-- you want to group values of the order’s status into subgroups
select
status 
from orders
group by status;

-- DISTINCT can be also used to imitate the above
SELECT DISTINCT
status 
FROM
orders;

-- if you want to know the number of orders in each status, you can use the COUNT function with the GROUP BY
SELECT
status, COUNT(*)
FROM
orders
GROUP BY status;

-- To get the total amount of all orders by status, you join the orders table with the orderdetails table and use the SUM function to calculate the total amount
SELECT
status,
(quantityOrdered * priceEach) as 'Total Amount'
FROM
orders
INNER JOIN orderdetails
USING(`orderNumber`)
GROUP BY status;

-- returns the order numbers and the total amount of each order.
SELECT
orderNumber,
(quantityOrdered * priceEach) as 'Total Amount'
FROM
orderdetails
GROUP BY `orderNumber`;

-- following query gets the total sales for each year.
SELECT 
-- get only year from date
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
-- match all the orderNumbers
    USING (orderNumber)
WHERE
-- consider only shipped orders
    status = 'Shipped'
GROUP BY 
-- orderyear as subgroup
    YEAR(orderDate);

-- uses the HAVING clause to select the total sales of the years after 2003
SELECT 
-- get only year from date
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
-- match all the orderNumbers
    USING (orderNumber)
WHERE
-- consider only shipped orders
    status = 'Shipped'
GROUP BY 
-- orderyear as subgroup
    YEAR(orderDate)
HAVING
    year > 2003;

-- if you want to get the number of orders by status and sort the status in descending order, you can use the GROUP BY clause with DESC as the following query
SELECT 
    status, 
    COUNT(*)
FROM
    orders
GROUP BY status
ORDER BY status DESC;

-- select the unique states of customers from the customers table
SELECT
state
FROM
customers
GROUP BY state
