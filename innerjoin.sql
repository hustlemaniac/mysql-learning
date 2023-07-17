
SELECT 
-- of products
    productCode, 
    productName, 
-- of productlines
    textDescription
FROM
    products t1
INNER JOIN productlines t2 rd
-- all rows that have same productline
-- the table products has the column productLine that references the column  productline of the table productlines . 
-- The column productLine in the table products is called the foreign key column.
    ON t1.productline = t2.productline;

-- returns order number, order status, and total sales from the orders and orderdetails tables using the INNER JOIN clause with the GROUP BYclause:
SELECT
-- of orders
t1.ordernumber,
t1.status,
-- of orderdetails
sum(quantityordered * priceeach) total
FROM
orders t1
INNER JOIN orderdetails t2
on t1.ordernumber = t2.ordernumber
GROUP BY ordernumber;

-- query uses two INNER JOIN clauses to join three tables: orders, orderdetails, and products
SELECT 
-- orders 
    orderNumber,
    orderDate,
-- orderdetails
    orderLineNumber,
    quantityOrdered,
    priceEach,
-- products
    productName
FROM
    orders
INNER JOIN
-- orders and orderdetails
    orderdetails USING (orderNumber)
INNER JOIN
-- orderdetails and products
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;

-- three INNER JOIN clauses to query data from the four tables
SELECT 
-- orders
    orderNumber,
    orderDate,
-- customers
    customerName,
-- orderdetails
    orderLineNumber,
    quantityOrdered,
    priceEach,
-- products
    productName
FROM
    orders
INNER JOIN orderdetails 
-- orders and orderdetails
    USING (orderNumber)
INNER JOIN products 
-- orderdetails and products
    USING (productCode)
INNER JOIN customers 
-- productsand customers
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;

-- query uses a less-than ( <) join to find the sales price of the product whose code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product.
SELECT 
    orderNumber, 
    productName, 
    msrp, 
-- sales price is same as `priceEach`
    priceEach
FROM
    products p
INNER JOIN orderdetails o 
    ON p.productcode = o.productcode
        AND p.msrp > o.priceEach
WHERE
    p.productcode = 'S10_1678';