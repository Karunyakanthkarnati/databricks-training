# 📊 Phase 4A – Bucketing & Segmentation in PySpark

## 📌 Project Overview

This project demonstrates different techniques for converting continuous numerical data into meaningful customer categories using **PySpark**. Customer segmentation is a common business analytics task that helps organizations classify customers based on their spending behavior for targeted marketing, loyalty programs, and business decision-making.

The project explores multiple segmentation techniques, including conditional logic, quantile-based segmentation, and comparison of different bucketing methods. It follows the Phase 4A objectives of understanding how continuous values can be transformed into business-friendly categories.

---

# 🎯 Objectives

* Understand the concept of bucketing and segmentation.
* Create customer segments using business rules.
* Perform quantile-based segmentation.
* Compare different segmentation techniques.
* Analyze customer distribution across segments.

---

# 🛠️ Technologies Used

* Python
* PySpark
* Spark DataFrame API
* Window Functions
* Quantile Analysis

---

# 📁 Dataset

## Customers Dataset

| Column       | Description                |
| ------------ | -------------------------- |
| customer_id  | Unique customer identifier |
| first_name   | Customer first name        |
| last_name    | Customer last name         |
| email        | Customer email             |
| phone_number | Contact number             |
| address      | Customer address           |
| city         | Customer city              |
| state        | Customer state             |
| zip_code     | ZIP code                   |

---

## Sales Dataset

| Column       | Description              |
| ------------ | ------------------------ |
| sale_id      | Unique sale identifier   |
| customer_id  | Customer identifier      |
| product_id   | Product identifier       |
| sale_date    | Date of sale             |
| quantity     | Quantity purchased       |
| total_amount | Total amount of the sale |

---

# 🧹 Data Preprocessing

The following data cleaning steps were performed before segmentation:

* Removed rows with null `customer_id`
* Removed duplicate records
* Converted `sale_date` to Date type
* Converted `quantity` to Integer
* Converted `total_amount` to Double
* Filtered invalid records with negative amounts or non-positive quantities

---

# 📊 Customer Analytics

## ✅ Task 1 – Customer Segmentation

Created customer categories using conditional business rules.

### Business Rules

| Total Spend                | Segment |
| -------------------------- | ------- |
| Greater than 10000         | Gold    |
| Greater than 5000          | Silver  |
| Less than or equal to 5000 | Bronze  |

### Output

| customer_name | city | total_spend | segment |

---

## ✅ Task 2 – Customer Count by Segment

Grouped customers based on their assigned segment and calculated the number of customers in each category.

### Output

| segment | customer_count |

---

## ✅ Task 3 – Quantile-Based Segmentation

Calculated the 33rd and 66th percentile values using `approxQuantile()` and dynamically segmented customers based on the dataset distribution.

### Output

| customer_name | total_spend | quantile_segment |

---

## ✅ Task 4 – Comparison of Segmentation Methods

Compared fixed business-rule segmentation with quantile-based segmentation to understand how customer classification changes under different approaches.

### Output

| customer_name | total_spend | segment | quantile_segment |

---

# 🚀 PySpark Concepts Used

* SparkSession
* DataFrame API
* CSV Reading
* dropna()
* dropDuplicates()
* withColumn()
* cast()
* filter()
* join()
* groupBy()
* agg()
* sum()
* count()
* concat_ws()
* when()
* otherwise()
* approxQuantile()
* orderBy()

---

# 📂 Project Structure

```text
PHASE-4A/
│
├── phase4a_bucketing.py
├── README.md
└── output/
```

---

# 🔄 Workflow

```text
Read CSV Files
        │
        ▼
Data Cleaning
        │
        ▼
Calculate Customer Spending
        │
        ▼
Create Gold/Silver/Bronze Segments
        │
        ▼
Count Customers by Segment
        │
        ▼
Quantile-Based Segmentation
        │
        ▼
Compare Segmentation Methods
```

---

# 📈 Learning Outcomes

After completing this project, I gained practical experience in:

* Customer segmentation using PySpark
* DataFrame transformations
* Business rule implementation
* Quantile analysis
* Customer analytics
* Data aggregation
* Business reporting

---

# 💡 Reflection

### 1. Why do we convert continuous values into categories?

Continuous values are converted into categories to simplify analysis and support business decision-making. Instead of analyzing thousands of different spending values, businesses can focus on customer groups such as Gold, Silver, and Bronze.

---

### 2. What is the difference between business segmentation and technical bucketing?

* **Business Segmentation** uses predefined business rules, such as assigning customers to Gold if their spending exceeds ₹10,000.
* **Technical Bucketing** uses statistical or machine learning techniques, such as quantiles or Bucketizer, where bucket boundaries are determined by the data itself.

---

### 3. When would fixed thresholds fail?

Fixed thresholds may become ineffective when customer purchasing behavior changes over time. Seasonal sales, inflation, or business growth can make static limits inaccurate, requiring dynamic segmentation methods.

---

### 4. How does quantile-based segmentation differ from fixed rules?

Quantile-based segmentation creates groups based on the distribution of the data, ensuring that customers are divided into balanced segments. Fixed rules always use predefined thresholds regardless of how the data is distributed.

---

### 5. Which method would you use in real-world projects?

The choice depends on business requirements. Fixed-rule segmentation is ideal when organizations have predefined customer tiers. Quantile-based segmentation is more suitable when customer behavior changes frequently and balanced customer groups are required. In many real-world projects, both approaches are used together depending on the reporting and analytical needs.

---

# 📌 Author

**Karunya Kanth**

B.Tech – Computer Science Engineering

Aspiring Data Engineer | Python | SQL | PySpark | Databricks
