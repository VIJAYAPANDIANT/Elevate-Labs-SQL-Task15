# 📊 Elevate Lab SQL Task 15: Window Functions

A professional SQL project demonstrating the core concepts of MySQL Window Functions. It covers assigning rankings, calculating running totals, and comparing values across related rows without collapsing the result set into a single output row.

## 📌 Project Objective
The primary goal of this task is to understand how to perform advanced analytical operations using Window Functions. It illustrates how to compute values over a specific partition of data, handle duplicate ranking scenarios, and access data from preceding or succeeding rows for comparative analysis.

## 🛠️ Technical Scope
- **Database Management System**: SQL (MySQL)
- **Core Concepts**: Window Functions (`OVER()`, `PARTITION BY`, `ORDER BY`)
- **Advanced Techniques**: Ranking (`ROW_NUMBER`, `RANK`, `DENSE_RANK`), Aggregation (`SUM`), Offset Functions (`LEAD`, `LAG`), Subquery Filtering

## 🗄️ Database Schema

### `employees` Table
| Column | Data Type | Constraint / Description |
| :--- | :--- | :--- |
| `emp_id` | INT | Primary Key |
| `name` | VARCHAR(50) | Employee Name |
| `department` | VARCHAR(50) | Department name |
| `salary` | INT | Monthly salary |
| `joining_date` | DATE | Date of Joining |

## 💻 SQL Implementations
Key operations demonstrated in the script:

- **Database & Schema Setup**: Creation of the `task15` database and the `employees` table with sample data.
- **Ranking Functions**:
  - `ROW_NUMBER()`: Assigns a unique sequential integer to rows within each department based on salary.
  - `RANK()`: Assigns a rank with gaps when there are duplicate values (e.g., tying salaries skip the next rank number).
  - `DENSE_RANK()`: Assigns a rank without gaps for duplicate values.
- **Aggregate Window Functions**:
  - `SUM() OVER()`: Calculates a running total of salaries within each department, ordered by salary.
- **Offset/Value Functions**:
  - `LEAD()`: Accesses salary data from the next employee in the partitioned and ordered result set.
  - `LAG()`: Accesses salary data from the previous employee to calculate salary differences between adjacent rows.
- **Subqueries with Window Functions**: Utilizing window functions inside a subquery to filter results (e.g., finding the top earner per department using `WHERE rn = 1`), since window functions cannot be directly used in a `WHERE` clause.

## 🚀 Setup & Execution

- **Initialize**: Execute the script to create the `task15` database and populate the `employees` table.
- **Test Ranking**: Run the `ROW_NUMBER`, `RANK`, and `DENSE_RANK` queries to observe how different functions handle ties and sequence numbers.
- **Test Aggregation**: Execute the `SUM(...) OVER(...)` query to see the running total calculation within each department.
- **Test Offset Functions**: Run the `LEAD` and `LAG` queries to analyze comparisons between adjacent rows.
- **Advanced Filtering**: Execute the subquery example to retrieve only the top-ranked employees per department.

> [!IMPORTANT]
> Window functions are powerful tools for performing complex calculations across sets of rows related to the current row. Unlike regular aggregate functions (`GROUP BY`), window functions do not cause rows to become grouped into a single output row; the rows retain their separate identities.

*Developed for Elevate Lab Internship Program - SQL Practice and Interview Preparation.*
