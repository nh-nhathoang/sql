# 1934. Confirmation Rate

## Problem Description

Given two tables:

### Signups

| Column Name | Type     |
| ----------- | -------- |
| user_id     | int      |
| time_stamp  | datetime |

* `user_id` is unique.
* Each row represents a registered user.

### Confirmations

| Column Name | Type     |
| ----------- | -------- |
| user_id     | int      |
| time_stamp  | datetime |
| action      | ENUM     |

* `(user_id, time_stamp)` is the primary key.
* `action` can be:

  * `confirmed`
  * `timeout`

The **confirmation rate** of a user is defined as:

```text
confirmed_messages / total_confirmation_requests
```

If a user has never requested a confirmation message, the confirmation rate is `0`.

The result should be rounded to **two decimal places**.

## Example

### Input

#### Signups

| user_id | time_stamp          |
| ------- | ------------------- |
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |

#### Confirmations

| user_id | time_stamp          | action    |
| ------- | ------------------- | --------- |
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |

### Output

| user_id | confirmation_rate |
| ------- | ----------------- |
| 6       | 0.00              |
| 3       | 0.00              |
| 7       | 1.00              |
| 2       | 0.50              |

### Explanation

| User | Confirmed | Total Requests | Confirmation Rate |
| ---- | --------- | -------------- | ----------------- |
| 6    | 0         | 0              | 0.00              |
| 3    | 0         | 2              | 0.00              |
| 7    | 3         | 3              | 1.00              |
| 2    | 1         | 2              | 0.50              |

## Key SQL Concepts

* LEFT JOIN
* GROUP BY
* Conditional Aggregation (`CASE WHEN`)
* COUNT()
* SUM()
* NULLIF()
* COALESCE()
* ROUND()

## Complexity Analysis

* **Time Complexity:** O(n)
* **Space Complexity:** O(1)

where `n` is the number of rows in the `Confirmations` table.
