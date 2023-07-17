--  Using MySQL LEFT JOIN clause to join two tables
SELECT
-- details of customers who made an order
    c.customerNumber,
    customername,
    `orderNumber`
FROM
    customers c
LEFT JOIN orders o
    ON c.customerNumber = o.customerNumber;

-- uses the LEFT JOIN to find customers who have no order:
SELECT
-- details of customers who made an order
    c.customerNumber,
    customername,
    `orderNumber`
FROM
    customers c
LEFT JOIN orders o
    ON c.customerNumber = o.customerNumber
WHERE
    `orderNumber` is NULL;


-- Using MySQL LEFT JOIN to join three tables
SELECT 
    lastName, 
    firstName, 
    customerName, 
    checkNumber, 
    amount
FROM
    employees
LEFT JOIN customers ON 
    employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = customers.customerNumber
ORDER BY 
    customerName, 
    checkNumber;

-- LEFT JOIN clause to query data from the tables orders and  orderDetails. The query returns the order and its line items of the order number 10123.
SELECT
    t1.ordernumber,
    orderlinenumber
FROM
    orders t1
LEFT JOIN
    orderdetails t2
USING(`orderNumber`)
WHERE `orderNumber` = 10123;