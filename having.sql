-- get order numbers, the number of items sold per order, and total sales for each from the orderdetails table
SELECT 
    ordernumber,
    -- tot number of items
    SUM(quantityOrdered) AS itemsCount,
    -- tot amount
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber;

-- which order has total sales greater than 1000 by using the HAVING clause
SELECT 
    ordernumber,
    -- tot number of items
    SUM(quantityOrdered) AS itemsCount,
    -- tot amount
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING total > 1000;

--  find orders that have total amounts greater than 1000 and contain more than 600 items
SELECT 
    ordernumber,
    -- tot number of items
    SUM(quantityOrdered) AS itemsCount,
    -- tot amount
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING total > 1000 and itemsCount > 600;

-- find all orders that already shipped and have a total amount greater than 1500
SELECT 
    ordernumber,
    -- tot amount
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
INNER JOIN
    orders
USING (`orderNumber`)
GROUP BY ordernumber,
    status
-- if 'status' referred in having then it also be contained in group by
HAVING total > 1500 and orders.status = 'Shipped';
