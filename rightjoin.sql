-- uses the RIGHT JOIN clause join the table customers with the table employees.
SELECT 
-- of employees
    employeeNumber, 
-- of cutomers
    customerNumber
FROM
    customers
RIGHT JOIN employees 
-- left = `employees` (only those are reps of customers)
-- right = customers (all)
-- 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
	employeeNumber;

-- RIGHT JOIN clause to find employees who do not in charge of any customers
SELECT 
-- of employees
    employeeNumber
FROM
    customers
RIGHT JOIN employees 
-- left = `employees` (only those are reps of customers)
-- right = customers (all)
-- 
    ON salesRepEmployeeNumber = employeeNumber
WHERE
    `customerNumber` is NULL;