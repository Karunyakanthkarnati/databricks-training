# 📊 Phase 4 – Business Pipeline & Analytics (PySpark)

## 📌 Project Overview

This mini project demonstrates an end-to-end data pipeline using **PySpark**. The project focuses on cleaning raw sales and customer data, performing business analytics, generating customer insights, and producing a final reporting table.

The pipeline follows a typical Data Engineering workflow:

- Read CSV files
- Clean and validate data
- Perform aggregations
- Generate business insights
- Build a final reporting table
- Export the processed data

This project was completed as part of the Spark Playground Phase 4 Mini Project. :contentReference[oaicite:0]{index=0}

---

# 📁 Dataset

## Customers

| Column | Description |
|----------|-------------|
| customer_id | Unique customer ID |
| first_name | Customer first name |
| last_name | Customer last name |
| email | Email address |
| phone_number | Phone number |
| address | Customer address |
| city | City |
| state | State |
| zip_code | ZIP Code |

---

## Sales

| Column | Description |
|----------|-------------|
| sale_id | Unique sale ID |
| customer_id | Customer ID |
| product_id | Product ID |
| sale_date | Date of sale |
| quantity | Quantity purchased |
| total_amount | Total sale amount |

---

# 🛠 Technologies Used

- Python
- PySpark
- Spark DataFrame API
- CSV Files

---

# 🧹 Data Cleaning

The following preprocessing steps were performed before analysis:

- Removed records with null `customer_id`
- Removed duplicate records
- Converted data types
  - `sale_date` → Date
  - `quantity` → Integer
  - `total_amount` → Double
- Removed invalid records
  - Negative sales amount
  - Zero or negative quantity

---

# 📈 Business Analytics Tasks

## ✅ Task 1 – Daily Sales

Calculated total sales for each day.

**Output**

| sale_date | total_sales |

---

## ✅ Task 2 – City-wise Revenue

Joined customer and sales data to calculate revenue generated from each city.

**Output**

| city | total_revenue |

---

## ✅ Task 3 – Top 5 Customers

Calculated total spending for each customer and displayed the top five customers.

**Output**

| customer_name | total_spent |

---

## ✅ Task 4 – Repeat Customers

Identified customers who placed more than one order.

**Output**

| customer_id | order_count |

---

## ✅ Task 5 – Customer Segmentation

Customers were categorized based on total spending.

| Total Spend | Segment |
|-------------|----------|
| > 10000 | Gold |
| 5001–10000 | Silver |
| ≤ 5000 | Bronze |

**Output**

| customer_name | total_spend | segment |

---

## ✅ Task 6 – Final Reporting Table

Generated a final business report containing customer details and analytics.

**Output**

| customer_name | city | total_spend | order_count | segment |

---

## ✅ Task 7 – Save Output

Saved the final report as a CSV file.

```python
final_df.write \
    .mode("overwrite") \
    .option("header", True) \
    .csv("/samples/output/report")
```

---

# 📂 Project Structure

```
Business-Pipeline-Analytics/
│
├── customers.csv
├── sales.csv
├── business_pipeline.py
├── README.md
└── output/
    └── report/
```

---

# 🚀 PySpark Concepts Used

- SparkSession
- DataFrame API
- CSV Reading
- dropna()
- dropDuplicates()
- withColumn()
- cast()
- to_date()
- filter()
- join()
- groupBy()
- agg()
- sum()
- count()
- concat_ws()
- when()
- otherwise()
- orderBy()
- limit()
- write()

---

# 📊 Pipeline Workflow

```
Read CSV Files
        │
        ▼
Data Cleaning
        │
        ▼
Daily Sales
        │
        ▼
City-wise Revenue
        │
        ▼
Top 5 Customers
        │
        ▼
Repeat Customers
        │
        ▼
Customer Segmentation
        │
        ▼
Final Reporting Table
        │
        ▼
Save Report as CSV
```

---

# 🎯 Learning Outcomes

After completing this project, I gained hands-on experience with:

- Data cleaning using PySpark
- DataFrame transformations
- Joining multiple datasets
- Aggregation and analytical queries
- Customer segmentation
- Business reporting
- Exporting processed data

---

# 📌 Author

**Karunya Kanth**

B.Tech – Computer Science Engineering

Aspiring Data Engineer | PySpark | SQL | Python | Databricks