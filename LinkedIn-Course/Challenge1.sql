/*
Created by: Luan Santos
Create date: 12/07/2023
Challenge 1
1. How many transactions took place between the years 2011 and 2012?
2. How much money did WSDA Music make during the same period?
*/

SELECT
	count(*) as [Total Transactions],
	sum(total) as [Total Sales]
FROM
	Invoice
WHERE
	date(InvoiceDate) BETWEEN '2011-01-01' AND '2012-12-31'
