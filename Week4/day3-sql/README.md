# 🚀 SQL Practice Set – Joins, Aggregations, Subqueries & Window Functions

## 📚 Topics Covered

- INNER JOIN
- LEFT JOIN
- Self Join
- GROUP BY
- Aggregate Functions
- Subqueries
- Correlated Subqueries
- CASE Statements
- Window Functions
- RANK()
- ROW_NUMBER()
- LAG()
- Running Totals
- Date Functions

---

# 🗂️ Concepts Practiced

## 1️⃣ Joining Employees with Departments

```sql
SELECT e.emp_name,
       d.dept_name,
       e.salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
```

### Purpose

* Combines data from multiple tables.
* Retrieves employee and department details together.

---

## 2️⃣ Employee Count by Department

```sql
SELECT d.dept_name,
       COUNT(emp_id)
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
```

### Purpose

* Uses aggregation with joins.
* Includes departments even if no employees exist.

---

## 3️⃣ Self Join for Employee-Manager Relationship

```sql
SELECT e.emp_name,
       m.emp_name
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;
```

### Purpose

* Joins a table with itself.
* Retrieves manager information.

---

## 4️⃣ Salary Aggregations

```sql
SELECT dept_id,
       SUM(salary),
       AVG(salary)
FROM employees
GROUP BY dept_id;
```

### Purpose

* Calculates department-wise salary metrics.
* Demonstrates aggregate functions.

---

## 5️⃣ Subqueries

```sql
SELECT emp_name
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);
```

### Purpose

* Filters data using results from another query.
* Useful for comparative analysis.

---

## 6️⃣ Correlated Subqueries

```sql
SELECT emp_name
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);
```

### Purpose

* Compares rows against department-level averages.
* Executes subquery for each row.

---

## 7️⃣ Ranking Employees

```sql
RANK() OVER (
    PARTITION BY dept_id
    ORDER BY salary DESC
)
```

### Purpose

* Assigns salary ranks within departments.
* Useful for Top-N analysis.

---

## 8️⃣ Top 3 Employees per Department

```sql
RANK() OVER (
    PARTITION BY dept_id
    ORDER BY salary DESC
)
```

### Purpose

* Identifies highest-paid employees.
* Common interview problem.

---

## 9️⃣ Running Total Calculation

```sql
SUM(salary)
OVER(
    ORDER BY hire_date
)
```

### Purpose

* Calculates cumulative salary expenditure.
* Demonstrates analytical window functions.

---

## 🔟 LAG Function

```sql
LAG(salary)
OVER(
    ORDER BY emp_id
)
```

### Purpose

* Accesses previous row values.
* Useful for trend analysis.

---

## 1️⃣1️⃣ Latest Record per Group

```sql
ROW_NUMBER()
OVER(
    PARTITION BY customer_id
    ORDER BY order_date DESC
)
```

### Purpose

* Finds the latest order for each customer.
* Common real-world requirement.

---

## 1️⃣2️⃣ Contribution Percentage Calculation

```sql
SUM(amount) * 100.0 /
SUM(SUM(amount)) OVER ()
```

### Purpose

* Calculates customer contribution to total sales.
* Demonstrates nested aggregation with window functions.

---

## 1️⃣3️⃣ Duplicate Detection

```sql
GROUP BY customer_name
HAVING COUNT(*) > 1
```

### Purpose

* Identifies duplicate records.
* Important for data quality checks.

---

## 1️⃣4️⃣ Conditional Classification using CASE

```sql
CASE
    WHEN salary < 80000 THEN 'Low'
    WHEN salary <= 120000 THEN 'Medium'
    ELSE 'High'
END
```

### Purpose

* Categorizes employees into salary bands.
* Useful for reporting and dashboards.

---

## 1️⃣5️⃣ Date Analysis

```sql
DATEDIFF(
    order_date,
    LAG(order_date) OVER(...)
)
```

### Purpose

* Calculates time difference between consecutive events.
* Common analytical requirement.

---

# 💡 Key Learnings

* Performed INNER JOIN, LEFT JOIN, and Self Join operations.
* Calculated department-level salary metrics.
* Used aggregate functions with GROUP BY.
* Solved business problems using subqueries.
* Implemented correlated subqueries.
* Ranked employees using window functions.
* Identified Top-N records.
* Calculated running totals.
* Used LAG() for previous-row analysis.
* Found latest records using ROW_NUMBER().
* Calculated sales contribution percentages.
* Detected duplicate records.
* Classified data using CASE statements.
* Performed date-based analysis.

---

# 🛠️ Skills Practiced

* SQL Joins
* Self Joins
* Aggregations
* Subqueries
* Correlated Subqueries
* Window Functions
* Ranking Functions
* Running Totals
* Date Functions
* Analytical SQL
* Business Query Solving
* Data Analysis

---

# 🎯 Outcome

By the end of this practice set, I learned how to:

* Combine data from multiple tables using joins.
* Perform department-wise and customer-wise analysis.
* Solve business scenarios using subqueries.
* Use window functions for ranking and trend analysis.
* Identify duplicates and top-performing records.
* Calculate contribution percentages and running totals.
* Work with date-based analytical queries.

---

# 🔗 Technologies Used

* SQL
* MySQL
* Relational Databases
* Window Functions
* Data Analysis
