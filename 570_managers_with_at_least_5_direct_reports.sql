-- Table: Employee

-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the name of an employee, their department, and the id of their manager.
-- If managerId is null, then the employee does not have a manager.
-- No employee will be the manager of themself.
 

-- Write a solution to find managers with at least five direct reports.

-- Return the result table in any order.

-- Write your MySQL query statement below
SELECT e2.name
FROM Employee e1
JOIN Employee e2
ON e1.ManagerId = e2.id
GROUP BY e1.managerId, e2.name
HAVING COUNT(*) >= 5 