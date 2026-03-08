# EL SQL Task 15 - Window Functions

This project demonstrates the use of various SQL Window Functions for data analysis. It includes examples of ranking, running totals, and comparing values across rows using `employees` table data.

## Database Schema

The examples use an `employees` table with the following structure:

- `emp_id`: Primary Key
- `name`: Employee Name
- `department`: Department Name
- `salary`: Monthly Salary
- `joining_date`: Date of Joining

## Key SQL Concepts Covered

### 1. Ranking Functions

- **`ROW_NUMBER()`**: Assigns a unique sequential integer to rows within a partition.
- **`RANK()`**: Assigns a rank with gaps when there are duplicate values.
- **`DENSE_RANK()`**: Assigns a rank without gaps for duplicate values.

### 2. Aggregate Window Functions

- **`SUM() OVER()`**: Calculates a running total of salaries within each department.

### 3. Value Functions

- **`LEAD()`**: Accesses data from a subsequent row in the same result set.
- **`LAG()`**: Accesses data from a previous row in the same result set (used for calculating salary differences).

## How to Run

1. Execute the `CREATE DATABASE task15;` and `USE task15;` commands.
2. Run the `CREATE TABLE` and `INSERT` statements provided in `task15.sql`.
3. Execute the individual `SELECT` queries to see the window functions in action.

## Sample Queries

### Top Earner per Department

```sql
SELECT * FROM (
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) rn
    FROM employees
) t WHERE rn = 1;
```

### Salary Difference from Previous Employee

```sql
SELECT name, department, salary,
salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary) AS salary_diff
FROM employees;
```
