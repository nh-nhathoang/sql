-- Table: Weather

-- id is the column with unique values for this table.
-- There are no different rows with the same recordDate.
-- This table contains information about the temperature on a certain day.
 

-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

-- Return the result table in any order.

-- Write your MySQL query statement below
SELECT w1.id
FROM Weather w1 
JOIN Weather w2
ON DATEDIFF(w1.recordDAte, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature