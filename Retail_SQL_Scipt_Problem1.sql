use market_star_schema;

SELECT 
		p.Product_Category,
        p.Product_Sub_Category,
        SUM(m.Profit) as Profits
FROM
	market_fact_full as m
INNER JOIN
	prod_dimen as p
ON 
	m.prod_id = p.prod_id
GROUP BY
		p.Product_Category,
        p.Product_Sub_Category
ORDER BY
		p.Product_Category,
		SUM(m.Profit);
        
SELECT 
		p.Product_Category,
        p.Product_Sub_Category,
        SUM(m.Profit) as Profits
FROM
	market_fact_full as m
INNER JOIN
	prod_dimen as p
ON 
	m.prod_id = p.prod_id
GROUP BY
		p.Product_Category,
        p.Product_Sub_Category
ORDER BY
		SUM(m.Profit);
        
        
-- Exploring Order table
SELECT 	
		COUNT(*) as total_rows,
		COUNT(distinct ord_id) as cnt_id,
		COUNT(distinct order_number) as cnt_num
from orders_dimen;

-- We found that for every ord_id we can have multiple order_number

-- Doing further analysis
SELECT * 
FROM orders_dimen
WHERE order_number 
IN (
	SELECT order_number
	FROM 
			orders_dimen
	GROUP BY order_number
	HAVING COUNT(ord_id)>1
);

-- We found here that orders with diffrent Order_Priority have different Order_Number

-- Average profit per order
SELECT 
		p.Product_Category,
        SUM(m.Profit) as Profits,
        ROUND(SUM(m.Profit)/COUNT(DISTINCT o.order_number),2) as Avg_Profit_Per_Order
FROM
	market_fact_full as m
INNER JOIN
	prod_dimen as p
	ON 
		m.prod_id = p.prod_id
		INNER JOIN
        orders_dimen as o
        ON m.ord_id = o.ord_id
	
GROUP BY
		p.Product_Category
ORDER BY
		p.Product_Category,
		ROUND(SUM(m.Profit)/COUNT(DISTINCT o.order_number),2);
        
-- Average Profit Percentage and Average Order Value

SELECT 
		p.Product_Category,
        SUM(m.Profit) as Profits,
        COUNT(DISTINCT o.order_number) as no_of_orders,
        ROUND(SUM(m.Profit)/COUNT(DISTINCT o.order_number),2) as Avg_Profit_Per_Order,
        ROUND(SUM(m.Sales)/COUNT(DISTINCT o.order_number),2) as Avg_Order_Value,
        ROUND(SUM(m.Profit)/SUM(m.Sales),2)*100 as Avg_Profit_Percentage
FROM
	market_fact_full as m
INNER JOIN
	prod_dimen as p
	ON 
		m.prod_id = p.prod_id
		INNER JOIN
        orders_dimen as o
        ON m.ord_id = o.ord_id
	
GROUP BY
		p.Product_Category
ORDER BY
		p.Product_Category,
		SUM(m.Profit)/SUM(m.Sales);
        
        
SELECT 
		p.Product_Category,
        p.Product_Sub_Category,
        SUM(m.Profit) as Profits,
        COUNT(DISTINCT o.order_number) as no_of_orders,
        ROUND(SUM(m.Profit)/COUNT(DISTINCT o.order_number),2) as Avg_Profit_Per_Order,
        ROUND(SUM(m.Sales)/COUNT(DISTINCT o.order_number),2) as Avg_Order_Value,
        ROUND(SUM(m.Profit)/SUM(m.Sales),2)*100 as Avg_Profit_Percentage
FROM
	market_fact_full as m
INNER JOIN
	prod_dimen as p
	ON 
		m.prod_id = p.prod_id
		INNER JOIN
        orders_dimen as o
        ON m.ord_id = o.ord_id
	
GROUP BY
		p.Product_Category,
        p.Product_Sub_Category
ORDER BY
		p.Product_Category,
		ROUND(SUM(m.Profit)/SUM(m.Sales),2);

-- We find that Technology is the most profitable category followed by Office Supplies followed by Furniture.

/* The average profit percentage per order for furniture products is quite low (2%)
compared to the other product categories. Such low values of the average profit and profit percentage per order for furniture
show that these products are not doing well. Their sale should ideally be stopped or
 the company should come up with a robust plan to deal with this issue. */
 
-- We can try to cross-sell Furniture products with Technology products to increase their Sales.