-- Table: Prices

-- (product_id, start_date, end_date) is the primary key (combination of columns with unique values) for this table.
-- Each row of this table indicates the price of the product_id in the period from start_date to end_date.
-- For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.
 

-- Table: UnitsSold

-- This table may contain duplicate rows.
-- Each row of this table indicates the date, units, and product_id of each product sold. 
 

-- Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0.

-- Return the result table in any order.

-- Write your MySQL query statement below
SELECT p.product_id, ROUND(IFNULL(SUM(u.units * p.price) / SUM(u.units), 0), 2) as average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id AND u.purchase_date >= p.start_date 
AND u.purchase_date <= p.end_date
GROUP BY product_id