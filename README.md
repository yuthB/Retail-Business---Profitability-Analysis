# Retail Business - Analysis
For the purpose of better understanding I have divided the problem in three parts. Problem 1 will deal with Profitability Analysis, Problem 2 will deal with identifying Profitable Customers and Problem 3 will deal with identifying fraud Customers.

## Problem 1: Profitability Analysis

Identify the sustainable (profitable) product categories so that the growth team can capitalise on them to increase sales. The data related to the problem can be accessed [here]. [This] image contains ERD for the schema.

### Metrics

Some of the metrics that can be used for performing the profitability analysis are as follows:

- Profits per product category
- Profits per product subcategory
- Average profit per order
- Average_Order_Value
- Average profit percentage per order

Determining the average profit per order helps in estimating the maximum cost that company should incur for each order. This will help ensure that profits are maximised after the required amount of money is spent on delivering each order to the relevant customer.

As a decision maker, to increase company's sales, one can procure more stock of telephones, fax machines and other similar products to cater to the huge demand.
They can also start an advertising campaign to inform existing and potential customers that these products are popular.
### Tables
The tables that I will be using to solve this problem are as follows:

- 'market_fact_full'
- 'prod_dimen'
- 'orders_dimen'

### Reports:
- [Profits per product category]
- [Profits per product subcategory]
- [Average profit per order]
- [Average profit percentage per order]

### Summary:
We find that Category `Technology` performs better than `Office Supplies`. `Furniture` ranks lowest in generating profits.

We also find that Sub-categories `Tables` and `Bookcases` in `Furniture` Category and Sub-categories `Scissors, Rulers and Trimmers` and `Rubber Bands` in `Office Supplies` Category are loss-making Sub-categories. Whereas, `Telephones an Communication` and `Office Machines` from `Technology` Category and `Binders and Binder Accessories` from `Office Suppies` Category are the top profit-making Sub-categories.

Category `Furniture` with Average Profit Per Order of ~$75 ranks the lowest and `Technology` being the highest with Average Profit Per Order of $417.
Though, Average Order Value(AOV) of `Furniture` Category is the highest but low profits produce Average Profit Percentage of only 2%.
Category `Office Supplies` as well as `Technology` give a good Average profit percentage of 14% and 15% respectively.

Sub-category wise `Labels` from `Office Supplies` top the Average Profit Percentage list (35%).

One can fairly argue that the company should discontinue selling `Tables`.

As a decision maker, to increase company's sales, one can procure more stock of telephones, fax machines and other similar products to cater to the huge demand.
They can also start an advertising campaign to inform existing and potential customers that these products are popular.


## Problem 2: Customer Identification
This problem has two goals:-
1. To find out TOP 10 Customers by Profit Generated.
2. To find out Customers who have not ordered yet.

### Tables: 
The tables that are required for solving this problem are as follows:

- 'cust_dimen'
- 'market_fact_full'

### Reports:
- [Top_10_Customers_by_profit_generated]

### Summary:
Top Customer is `Emily Phan` who generated a Profit of `$28,664`.
There are total **1832** customers, out of which there are no customers who have not ordered yet.

## Problem 3: Fraud Customers Identification
The company has come up with an attractive offer for new customers: each new customer who signs up can avail a discount of 75% on their first order with a maximum cap of ₹500. An unexpectedly large number of customers are signing up on a daily basis. What could be the reason for this?

### Tables: 
The tables that are required for solving this problem are as follows:

- 'cust_dimen'
- 'market_fact_full'

### Reports:
- [Fraud Customers]

### Summary:
There are **276** fraud customers. All these customers are from **Mysore**.

** Work on the project is still in progress


[here]: <https://github.com/yuthB/Retail-Business---Profitability-Analysis/blob/main/Market_Star_Schema.sql>
[This]:<https://github.com/yuthB/Retail-Business---Profitability-Analysis/blob/main/Market_Schema_ERD.png>
[Profits per product category]:<https://github.com/yuthB/Retail-Business---Profitability-Analysis/blob/main/Profits_Per_Product_Category.csv>
[Profits per product subcategory]:<https://github.com/yuthB/Retail-Business---Profitability-Analysis/blob/main/Profits_Per_Product_Sub_Category.csv>
[Average profit per order]:<https://github.com/yuthB/Retail-Business---Profitability-Analysis/blob/main/Avg_Profit_Percentage.csv>
[Average profit percentage per order]:<https://github.com/yuthB/Retail-Business---Profitability-Analysis/blob/main/Avg_Profit_Percentage_Sub_Category.csv>
[Top_10_Customers_by_profit_generated]:<https://github.com/yuthB/Retail-Business---Profitability-Analysis/blob/main/Top_10_Customers_by_profit_generated.csv>
[Fraud Customers]:<https://github.com/yuthB/Retail-Business---Profitability-Analysis/blob/main/Fraud_Customers_Identified.csv>
