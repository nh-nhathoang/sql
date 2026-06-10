-- 1378. Replace Employee ID With The Unique Identifier
SELECT e.name, eu.unique_id
FROM Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;

-- 1068. Product Sales Analysis I
SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
ON p.product_id = s.product_id;

-- 1581. Customer Who Visited but Did Not Make Any Transactions
SELECT customer_id, COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id;

-- 1661. Average Time of Process per Machine
SELECT a1.machine_id, ROUND(AVG(a1.timestamp - a2.timestamp), 3) as processing_time
FROM Activity a1
JOIN Activity a2
ON a1.machine_id = a2.machine_id AND a1.process_id = a2.process_id
WHERE a1.activity_type = 'end' AND a2.activity_type = 'start'
GROUP BY machine_id;

-- 577. Employee Bonus
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;

-- 1280. Students and Examinations
SELECT st.student_id, st.student_name, sub.subject_name, COUNT(ex.subject_name) as attended_exams
FROM Students st
CROSS JOIN Subjects sub
LEFT JOIN Examinations ex
ON st.student_id = ex.student_id AND sub.subject_name = ex.subject_name
GROUP BY st.student_id, st.student_name, sub.subject_name
ORDER BY st.student_id, sub.subject_name;

-- 197. Rising Temperature
SELECT w1.id
FROM Weather w1 
JOIN Weather w2
ON DATEDIFF(w1.recordDAte, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;