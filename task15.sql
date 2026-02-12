create DATABASE task15;
use task15;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    joining_date DATE
);
-- Insert Sample Data
INSERT INTO employees VALUES
(1,'Amit','IT',60000,'2021-01-10'),
(2,'Sara','IT',75000,'2020-03-15'),
(3,'John','HR',50000,'2022-07-01'),
(4,'Priya','HR',52000,'2021-06-20'),
(5,'Raj','IT',75000,'2019-11-11'),
(6,'Meena','Finance',65000,'2020-09-09'),
(7,'Arun','Finance',72000,'2022-02-02'),
(8,'Kiran','Finance',72000,'2023-01-01');
--ROW_NUMBER (Unique rank per department)
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY salary DESC
) AS row_num
FROM employees;
--RANK vs DENSE_RANK
RANK (skips numbers on tie)
SELECT name, department, salary,
RANK() OVER(
    PARTITION BY department
    ORDER BY salary DESC
) AS rank_val
FROM employees;
DENSE_RANK (no skip)
SELECT name, department, salary,
DENSE_RANK() OVER(
    PARTITION BY department
    ORDER BY salary DESC
) AS dense_rank_val
FROM employees;
--Running Total Salary per Department
SELECT name, department, salary,
SUM(salary) OVER(
    PARTITION BY department
    ORDER BY salary
) AS running_total
FROM employees;
--ROW_NUMBER (Unique rank per department)
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY salary
) AS row_num
FROM employees;
--LEAD (Next Salary)
SELECT name, department, salary,
LEAD(salary) OVER(
    PARTITION BY department
    ORDER BY salary
) AS next_salary
FROM employees;
-- Compare Salary Difference Using LAG
SELECT name, department, salary,
salary - LAG(salary) OVER(
    PARTITION BY department
    ORDER BY salary
) AS salary_diff
FROM employees;
--Window Function + WHERE (Use Subquery)
--Not allowed directly:

WHERE row_number = 1
--Correct:

SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) rn
    FROM employees
) t
WHERE rn = 1;