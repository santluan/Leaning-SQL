/*
Created by: Luan Santos
Create Date: 12-07-2023
Challenge 3 - Queries that perform in-depth analysis with the aim of finding employees who may have been 
financially motivated to commit a crime
*/

-- 1. Get a list of employees who exceeded the average transaction amount from sales they generated during 2011 and 2012

SELECT
	e.FirstName,
	e.LastName,
	sum(i.total) AS [Total Sales]
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE
	i.total >
(SELECT
	round(avg(total),2) AS [Avg Total]
FROM
	Invoice
WHERE
	date(InvoiceDate) BETWEEN '2011-01-01' AND '2012-12-31')
AND
	date(InvoiceDate) BETWEEN '2011-01-01' AND '2012-12-31'
GROUP BY
	e.FirstName,
	e.LastName
ORDER BY
	e.LastName
	

-- 2. Create a Commission Payout column that displays each employee’s commission  based on 15% of the sales transaction amount.

SELECT
	e.FirstName,
	e.LastName,
	sum(i.total) AS [Total Sales],
	round(sum(i.total)*.15, 2) AS [Commission Payout]
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <='2012-12-31'
GROUP BY
	e.FirstName,
	e.LastName
ORDER BY
	e.LastName
	

-- 3. Which employee made the highest commission?
-- Jane Peacock $ 199,77
	
-- 4.  List the customers that the employee identified in the last question

SELECT
	c.FirstName AS [Customer FN],
	c.LastName AS [Customer LN],
	e.FirstName AS [Employee FN],
	e.LastName AS [Employee LN],
	sum(i.total) AS [Total Sales],
	round(sum(i.total)*.15, 2) AS [Commission Payout]
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <='2012-12-31' 
AND e.LastName = 'Peacock'
GROUP BY
	c.FirstName,
	c.LastName
ORDER BY
	[Total Sales] DESC

-- 5. Which customer made the highest purchase?
-- John Doeein
	
-- 6.  Look at this customer record—do you see anything suspicious?
	
SELECT
	c.FirstName AS [Customer FN],
	c.LastName AS [Customer LN],
	e.FirstName AS [Employee FN],
	e.LastName AS [Employee LN],
	i.InvoiceId,
	i.total
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE
	c.LastName = 'Doeein'

--- alternative
SELECT
 *
FROM
 Customer c
WHERE
 c.LastName = 'Doeein'
