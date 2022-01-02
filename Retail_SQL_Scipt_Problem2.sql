use market_star_schema;

-- Finding Profitable Customers
-- Using Tables market_fact_full and cust_dimen
        
WITH customer_sales AS 
(
	SELECT
		c.cust_id,
        ROW_NUMBER() OVER(ORDER BY SUM(m.profit) DESC) AS RNK,
		c.Customer_Name,
		ROUND(SUM(m.profit),2) as Profit,
		c.city as Customer_City,
		c.state as Customer_State,
		ROUND(SUM(m.sales),2) as Sales
	FROM 
		market_fact_full as m
	INNER JOIN
		cust_dimen as c
	ON  
		m.cust_id = c.cust_id
	GROUP BY
		c.cust_id
)

-- To select top 10 customers by profit generated
SELECT * 
FROM
	customer_sales
WHERE 
	rnk<=10;