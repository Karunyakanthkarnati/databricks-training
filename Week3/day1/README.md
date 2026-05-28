# 🚀 Week 3 – Day 1: PySpark File Reading Basics

## 📚 Topics Covered

* Apache Spark Introduction
* Reading CSV Files using PySpark
* `spark.read.csv()`
* `spark.read.format().load()`
* Header Handling
* Schema Inference
* Displaying DataFrames

---

# 🗂️ Dataset Used

## Employee Data (`empData.csv`)

The dataset contains employee-related information used for practicing PySpark file reading operations.

---

# 🔹 Method 1 – Reading CSV Using `spark.read.csv()`

```python
# Reading CSV file directly

df = spark.read.csv(
    "/Volumes/workspace/default/databricks2027/empData.csv",
    header=True,
    inferSchema=True
)

# Displaying Data

df.show()
```

## ✅ Explanation

* `header=True` → Uses first row as column names.
* `inferSchema=True` → Automatically detects column data types.
* `df.show()` → Displays DataFrame rows.

---

# 🔹 Method 2 – Reading CSV Using `format()` and `load()`

```python
# Reading CSV using Data Source API

df = spark.read.format("csv") \
    .option("header", True) \
    .option("inferSchema", True) \
    .load("/Volumes/workspace/default/databricks2027/empData.csv")

# Displaying Data

df.display()
```

## ✅ Explanation

* `format("csv")` → Specifies file format.
* `.option()` → Adds configuration settings.
* `.load()` → Loads the file into DataFrame.
* `df.display()` → Displays interactive table in Databricks.

---

# 🔍 Difference Between Both Methods

| Method                       | Usage                       | Best For                  |
| ---------------------------- | --------------------------- | ------------------------- |
| `spark.read.csv()`           | Short and simple syntax     | Beginners & quick scripts |
| `spark.read.format().load()` | Generic and flexible syntax | Production ETL pipelines  |

---

# 💡 Key Learnings

* PySpark can efficiently read structured files.
* DataFrames are the core abstraction in Spark.
* Schema inference helps avoid manual datatype definitions.
* The `format().load()` API is commonly used in enterprise data engineering.

---

# 🛠️ Skills Practiced

* PySpark DataFrame creation
* CSV file handling
* Schema inference
* Databricks notebook execution
* Basic DataFrame visualization

---

# 🎯 Outcome

By the end of Day 1, I learned how to:

* Read CSV files in PySpark
* Use different file reading approaches
* Work with Spark DataFrames
* Display data using `show()` and `display()`

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks

---

# 📌 Next Step

➡️ Performing DataFrame operations such as:

* `select()`
* `filter()`
* `withColumn()`
* `groupBy()`
* Aggregations
