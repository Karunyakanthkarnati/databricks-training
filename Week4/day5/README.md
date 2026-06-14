# 🚀 Week 4 – Day 5: Column Functions, Filtering & Duplicate Handling in PySpark

## 📚 Topics Covered

- col()
- alias()
- when()
- cast()
- like()
- sort()
- filter()
- where()
- distinct()
- dropDuplicates()

---

# 🗂️ Concepts Practiced

## 1️⃣ Conditional Transformations using when()

```python
from pyspark.sql.functions import *

df1 = df.select(
    "id",
    "name",
    when(col("gender") == "M", "Male")
    .when(col("gender") == "F", "Female")
    .otherwise("Unknown")
    .alias("gender")
)
```

### Purpose

* Performs conditional logic on columns.
* Equivalent to SQL CASE WHEN statement.
* Useful for data standardization and categorization.

---

## 2️⃣ Renaming Columns using alias()

```python
df.select(
    col("id").alias("emp_id")
)
```

### Purpose

* Creates temporary column names.
* Improves readability in query results.

---

## 3️⃣ Sorting Data using sort()

```python
df.sort(
    col("name").desc()
)
```

### Purpose

* Arranges records in ascending or descending order.
* Useful for reporting and analysis.

---

## 4️⃣ Type Conversion using cast()

```python
df.select(
    col("salary").cast("string")
)
```

### Purpose

* Converts data from one datatype to another.
* Commonly used during ETL processes.

---

## 5️⃣ Pattern Matching using like()

```python
df.filter(
    col("name").like("s%")
)
```

### Purpose

* Filters records based on string patterns.
* Similar to SQL LIKE operator.

---

## 6️⃣ Filtering Records using filter()

```python
df.filter(
    col("salary") > 2000
)
```

### Purpose

* Retrieves rows based on conditions.
* One of the most commonly used DataFrame operations.

---

## 7️⃣ Filtering using where()

```python
df.where(
    (col("gender") == "Male") &
    (col("salary") > 2000)
)
```

### Purpose

* Alternative to filter().
* Supports multiple conditions using logical operators.

---

## 8️⃣ Removing Duplicate Rows using distinct()

```python
df2.distinct()
```

### Purpose

* Removes completely duplicate rows.
* Ensures unique records in datasets.

---

## 9️⃣ Removing Duplicates using dropDuplicates()

```python
df2.dropDuplicates(["gender"])
```

### Purpose

* Removes duplicates based on selected columns.
* Useful for data cleaning and deduplication.

---

# 💡 Key Learnings

* Applied conditional logic using when().
* Renamed columns using alias().
* Sorted DataFrames using sort().
* Converted datatypes using cast().
* Filtered data using filter() and where().
* Used pattern matching with like().
* Removed duplicate rows using distinct().
* Performed column-level deduplication using dropDuplicates().

---

# 🛠️ Skills Practiced

* Column Functions
* Conditional Transformations
* Data Filtering
* Data Sorting
* Data Type Conversion
* Pattern Matching
* Data Cleaning
* Duplicate Removal
* PySpark DataFrames
* Databricks Notebook Operations

---

# 🎯 Outcome

By the end of this notebook, I learned how to:

* Work with PySpark column functions.
* Apply conditional transformations.
* Filter records using multiple conditions.
* Sort and transform DataFrame columns.
* Convert column datatypes.
* Remove duplicate records efficiently.
* Clean and prepare datasets for analysis.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks
