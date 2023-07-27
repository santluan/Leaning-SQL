/*
Created By: Luan Santos
Create Date: 12-07-2023
Challenge 2
*/

-- 1. Get a list of customers who made purchases between 2011 and 2012.

SELECT
	c.FirstName,
	c.LastName,
	i.InvoiceDate,
	i.total
FROM
	Invoice i
INNER JOIN
	Customer c
ON
	i.CustomerId = c.CustomerId
WHERE
	date(InvoiceDate) BETWEEN '2011-01-01' AND '2012-12-31'
ORDER BY
	i.total DESC

	
-- 2. Get a list of customers, sales reps, and total transaction amounts for each customer  between 2011 and 2012.

SELECT
	c.FirstName AS [Customer FN],
	c.LastName AS [Customer LN],
	e.FirstName AS [Employee FN],
	e.LastName AS [Employee LN],
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
	date(InvoiceDate) BETWEEN '2011-01-01' AND '2012-12-31'
ORDER BY
	i.total DESC


-- 3.  How many transactions are above the average transaction amount during the same time period?

SELECT
	count(total) AS [Num of Transactions Above Avg]
FROM
	Invoice
WHERE
	total > 
(SELECT
	round(avg(total), 2) AS [Avg Transaction Amount]
FROM
	Invoice
WHERE
	date(InvoiceDate) BETWEEN '2011-01-01' AND '2012-12-31')
AND
	date(InvoiceDate) BETWEEN '2011-01-01' AND '2012-12-31'


-- 4. What is the average transaction amount for each year that WSDA Music has been in business?

SELECT
	strftime('%Y', InvoiceDate) AS Year,
	round(avg(total), 2) AS [Avg Transaction Amount]
FROM
	Invoice
GROUP BY
	Year
