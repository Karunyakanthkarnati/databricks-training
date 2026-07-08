# SQL to PySpark Bridge Pack – Phase 2

## 📌 Overview

This project is part of the **SQL to PySpark Bridge Pack – Phase 2**. The objective is to strengthen the understanding of SQL concepts by implementing equivalent solutions using the PySpark DataFrame API.

The project demonstrates how common SQL operations such as filtering, grouping, aggregation, sorting, and joins can be translated into PySpark transformations.

---

## 🎯 Objectives

* Practice SQL queries on sample datasets.
* Convert SQL queries into equivalent PySpark DataFrame operations.
* Perform basic data cleaning before analysis.
* Compare SQL and PySpark outputs.
* Build a foundation for real-world Data Engineering workflows.

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

Contains customer information.

**Columns**

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

Contains customer sales information.

**Columns**

* sale_id
* customer_id
* product_id
* sale_date
* quantity
* total_amount

---

## 🧹 Data Cleaning

The following preprocessing steps were performed before solving the exercises:

* Removed rows with missing `customer_id`
* Converted `total_amount` from String to Double
* Created temporary SQL views for Spark SQL queries

---

## 📚 Exercises Completed

### Exercise 1

**Total order amount for each customer**

* SQL: `SUM()`, `GROUP BY`
* PySpark: `groupBy()`, `agg(sum())`

---

### Exercise 2

**Top 3 customers by total spend**

* SQL: `ORDER BY`, `LIMIT`
* PySpark: `orderBy()`, `limit()`

---

### Exercise 3

**Customers with no orders**

* SQL: `LEFT JOIN`
* PySpark: `join()`, `filter()`

---

### Exercise 4

**City-wise total revenue**

* SQL: `JOIN`, `GROUP BY`
* PySpark: `join()`, `groupBy()`, `agg()`

---

### Exercise 5

**Average order amount per customer**

* SQL: `AVG()`
* PySpark: `avg()`

---

### Exercise 6

**Customers with more than one order**

* SQL: `COUNT()`, `HAVING`
* PySpark: `count()`, `filter()`

---

### Exercise 7

**Sort customers by total spend**

* SQL: `ORDER BY DESC`
* PySpark: `orderBy(desc())`

---

## 📁 Project Structure

```
SQL-to-PySpark-Bridge-Pack/
│
├── README.md
├── exercises.py
├── exercises_SQL.py
└── screenshots/
    ├── exercise1.png
    ├── exercise2.png
    ├── exercise3.png
    ├── exercise4.png
    ├── exercise5.png
    ├── exercise6.png
    └── exercise7.png
```

---

## 📄 Files

### exercises.py

Contains PySpark DataFrame implementations for all seven exercises.

### exercises_SQL.py

Contains Spark SQL implementations for the same exercises using temporary views.

---

## 🔍 SQL Concepts Covered

* SELECT
* GROUP BY
* SUM
* AVG
* COUNT
* ORDER BY
* LIMIT
* LEFT JOIN
* HAVING
* Aggregations

---

## 🔥 PySpark Concepts Covered

* SparkSession
* DataFrame API
* Reading CSV files
* Data Cleaning
* dropna()
* withColumn()
* cast()
* createOrReplaceTempView()
* groupBy()
* agg()
* sum()
* avg()
* count()
* join()
* filter()
* orderBy()
* desc()

---

## 📸 Output

Execution screenshots for each exercise are included in the **screenshots/** folder.

---

## 🚀 Learning Outcome

After completing this project, I gained hands-on experience in:

* Writing analytical SQL queries
* Translating SQL logic into PySpark
* Working with Spark DataFrames
* Performing joins and aggregations
* Cleaning and transforming datasets
* Comparing SQL and PySpark approaches for the same business problems

---
