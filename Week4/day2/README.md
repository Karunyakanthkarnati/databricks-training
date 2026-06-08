# 🚀 Week 4 – Day 2: Array Functions in PySpark

## 📚 Topics Covered

- ArrayType()
- array()
- Array Element Access
- explode()
- split()
- array_contains()

---

# 🗂️ Concepts Practiced

## 1️⃣ Creating Array Data Type using ArrayType()

```python
ArrayType(IntegerType())
```

### Purpose

* Defines array-based columns in a schema.
* Stores multiple values within a single column.
* Useful for nested and semi-structured data.

---

## 2️⃣ Creating Arrays using array()

```python
from pyspark.sql.functions import array

df = df.withColumn(
    "numbers",
    array("num1", "num2")
)
```

### Purpose

* Combines multiple columns into a single array column.
* Useful for grouping related values together.

---

## 3️⃣ Accessing Array Elements

```python
df.select(
    col("numbers")[0]
)
```

### Purpose

* Retrieves specific elements from an array.
* Supports index-based access.

---

## 4️⃣ Flattening Arrays using explode()

```python
from pyspark.sql.functions import explode

df.select(
    explode("skills")
)
```

### Purpose

* Converts each array element into a separate row.
* Commonly used for data normalization and analytics.

---

## 5️⃣ Converting Strings to Arrays using split()

```python
from pyspark.sql.functions import split

df = df.withColumn(
    "skills",
    split(col("skill_set"), ",")
)
```

### Purpose

* Splits strings into array elements.
* Useful while processing CSV and text data.

---

## 6️⃣ Checking Values using array_contains()

```python
from pyspark.sql.functions import array_contains

df.filter(
    array_contains("skills", "SQL")
)
```

### Purpose

* Checks whether a value exists inside an array.
* Useful for filtering records based on array contents.

---

# 💡 Key Learnings

* Created array-based columns.
* Combined columns into arrays.
* Accessed individual array elements.
* Flattened arrays using explode().
* Converted strings into arrays using split().
* Filtered array data using array_contains().

---

# 🛠️ Skills Practiced

* Array Data Handling
* Data Transformation
* Array Manipulation
* String Processing
* Data Normalization
* PySpark DataFrames
* Databricks Notebook Operations

---

# 🎯 Outcome

By the end of this notebook, I learned how to:

* Create and manage array columns.
* Access values from arrays.
* Convert strings into arrays.
* Flatten array data into rows.
* Search and filter values within arrays.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks
