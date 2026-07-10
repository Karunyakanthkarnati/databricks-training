# SQL to PySpark Phase 3 – ETL Pipeline

## 📌 Overview

This project is part of the **SQL to PySpark Phase 3 – Final ETL & Pipeline Practice Pack**. The objective is to move beyond writing individual SQL queries and build a complete ETL (Extract, Transform, Load) pipeline using PySpark and Spark SQL.

The project demonstrates how SQL logic can be implemented using the PySpark DataFrame API while performing common data engineering tasks such as data ingestion, cleaning, transformations, joins, aggregations, and reporting.

---

## 🎯 Objectives

* Read customer and sales datasets.
* Perform data cleaning and preprocessing.
* Implement business logic using Spark SQL.
* Convert SQL queries into equivalent PySpark DataFrame operations.
* Build a reusable ETL pipeline.

---

## 🛠 Technologies Used

* Apache Spark
* PySpark
* Spark SQL
* Spark Playground
* Python 3

---

## 📂 Dataset

### customers.csv

Customer details including:

* customer_id
* first_name
* last_name
* email
* phone_number
* address
* city
* state
* zip_code

### sales.csv

Sales transaction details including:

* sale_id
* customer_id
* product_id
* sale_date
* quantity
* total_amount

---

## 🔄 ETL Workflow

### Extract

* Read customers.csv
* Read sales.csv

### Transform

* Remove records with missing customer_id
* Convert total_amount to Double
* Convert quantity to Integer
* Create temporary SQL views
* Perform joins, aggregations, filtering, and ranking

### Load

* Display processed results
* Generate final reporting table

---

## 📚 Business Pipeline Tasks

### Task 1 – Calculate Daily Sales

* Read sales data
* Calculate total sales for each day

---

### Task 2 – City-wise Revenue

* Join customer and sales data
* Calculate total revenue for each city

---

### Task 3 – Repeat Customers

* Identify customers with more than two orders

---

### Task 4 – Highest Spending Customer in Each City

* Calculate customer spending
* Rank customers within each city
* Display the highest spender from every city

---

### Task 5 – Final Reporting Table

Generate a reporting table containing:

* Customer ID
* First Name
* Last Name
* City
* Total Spend
* Order Count

---

## 📁 Project Structure

```text
SQL-to-PySpark-Phase3/
│
├── etl_pipeline.py
├── etl_pipeline_SQL.py
├── README.md
└── screenshots/
    ├── task1.png
    ├── task2.png
    ├── task3.png
    ├── task4.png
    └── task5.png
```

---

## 📄 Files

### etl_pipeline.py

Contains the complete ETL pipeline implemented using the PySpark DataFrame API.

### etl_pipeline_SQL.py

Contains the equivalent Spark SQL implementation using temporary views and `spark.sql()`.

---

## 🔍 SQL Concepts Covered

* SELECT
* GROUP BY
* SUM
* COUNT
* ORDER BY
* JOIN
* LEFT JOIN
* HAVING
* Window Functions
* ROW_NUMBER()

---

## 🔥 PySpark Concepts Covered

* SparkSession
* DataFrame API
* Reading CSV Files
* Data Cleaning
* dropna()
* withColumn()
* cast()
* createOrReplaceTempView()
* groupBy()
* agg()
* join()
* filter()
* orderBy()
* Window Functions
* partitionBy()
* row_number()

---

## 📸 Output

Execution screenshots for all five tasks are available in the **screenshots/** folder.

---

## 🎓 Learning Outcomes

After completing this project, I learned how to:

* Build an end-to-end ETL pipeline using PySpark.
* Apply SQL concepts in Spark SQL.
* Convert SQL queries into PySpark DataFrame operations.
* Perform joins, aggregations, and data transformations.
* Use window functions to solve ranking problems.
* Generate business reports from raw datasets.

---

## ✅ Conclusion

This project provides hands-on experience with ETL workflows and demonstrates how SQL and PySpark can be used together to solve real-world data engineering problems.
