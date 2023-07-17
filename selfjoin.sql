-- REVISIT!!!! 
-- you need to join a table to itself, which is known as a self join.
SELECT 
-- after choosing the e.no of manager rows get the names them as manager
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
-- choosing only those e.no with e.no is reports to(has a maanger) and get their names
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
-- to get all employees who are managers
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;

-- LEFT JOIN clause instead of INNER JOIN to include the President:
SELECT 
    CONCAT(e.lastname, ', ', e.firstname) AS 'President'
FROM
    employees e
LEFT JOIN employees m ON 
    m.employeeNumber = e.reportsto
WHERE e.`reportsTo` is NULL;

-- or
SELECT 
    IFNULL(CONCAT(m.lastname, ', ', m.firstname),
            'Top Manager') AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM
    employees e
LEFT JOIN employees m ON 
    m.employeeNumber = e.reportsto
ORDER BY 
    manager DESC;

-- you can display a list of customers who locate in the same city by joining the customers table to itself
SELECT 
    c1.city, 
    c1.customerName, 
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON 
    c1.city = c2.city
    -- so customer names dont get repeated
    AND c1.customername > c2.customerName
ORDER BY 
    c1.city;