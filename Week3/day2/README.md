# 🚀 Week 3 – Day 2: Schema Definition, Select, Alias & Sorting in PySpark

## 📚 Topics Covered

* Reading CSV Files
* Schema Inference
* Custom Schema Definition
* `printSchema()`
* `select()`
* `col()`
* `alias()`
* Sorting Data
* Multiple Column Sorting

---

# 🗂️ Datasets Used

## Employee Data (`empData.csv`)

Used for schema inference and custom schema definition.

## Big Sales Data (`Big Sales.csv`)

Used for practicing DataFrame operations.

---

# 🔹 Reading CSV with Schema Inference

```python
df = spark.read.format("csv") \
    .option("header", True) \
    .option("inferSchema", True) \
    .load("/Volumes/workspace/default/databricks2027/empData.csv")

df.display()
```

### Key Points

* Automatically detects column datatypes.
* Useful for quick data exploration.

---

# 🔹 Viewing DataFrame Schema

```python
df.printSchema()
```

### Purpose

* Displays column names and datatypes.
* Helps verify schema before transformations.

---

# 🔹 Defining Custom Schema

```python
my_schema = '''
emp_id string,
name string,
salary integer,
address string
'''
```

```python
df1 = spark.read.format("csv") \
    .option("header", "true") \
    .schema(my_schema) \
    .load("/Volumes/workspace/default/databricks2027/empData.csv")

df1.display()
```

### Benefits

* Better performance.
* Ensures correct datatypes.
* Avoids schema inference overhead.

---

# 🔹 Selecting Specific Columns

```python
df_csv.select(
    "Item_Identifier",
    "Item_Fat_Content",
    "Item_Type"
).display()
```

### Purpose

* Retrieves only required columns.
* Improves readability and performance.

---

# 🔹 Using `col()` Function

```python
from pyspark.sql.functions import *

df_csv.select(
    col("Item_Identifier"),
    col("Item_Fat_Content"),
    col("Item_Type")
).display()
```

### Purpose

* Useful for advanced transformations.
* Enables aliasing, filtering, and calculations.

---

# 🔹 Using Alias

```python
df_csv.select(
    col("Item_Identifier").alias("Item_Id")
).display()
```

### Purpose

* Renames columns temporarily in output.

---

# 🔹 Sorting Data

### Descending Sort

```python
df_csv.sort(
    col("Item_Weight").desc()
).display()
```

### Multiple Column Sort

```python
df_csv.sort(
    ["Item_Visibility", "Item_MRP"],
    ascending=[0, 0]
).display()
```

### Purpose

* Organizes data for analysis.
* Supports multi-level sorting.

---

# 💡 Key Learnings

* Difference between inferred schema and custom schema.
* Viewing schema using `printSchema()`.
* Selecting required columns using `select()`.
* Using `col()` for column expressions.
* Renaming columns with `alias()`.
* Sorting DataFrames using single and multiple columns.

---

# 🛠️ Skills Practiced

* PySpark DataFrames
* Schema Management
* Column Selection
* Aliasing
* Data Sorting
* Databricks Notebook Operations

---

# 🎯 Outcome

By the end of Day 2, I learned how to:

* Define custom schemas.
* Inspect DataFrame structure.
* Select required columns efficiently.
* Rename columns using aliases.
* Sort data using PySpark DataFrame APIs.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks

---

# 📌 Next Step

➡️ Data Filtering & Conditional Transformations

Topics:

* `filter()`
* `where()`
* Multiple Conditions
* `withColumn()`
* `when()`
* Data Cleaning Operations
