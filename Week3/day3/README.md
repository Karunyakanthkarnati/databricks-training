# 🚀 Week 3 – Day 3: Creating DataFrames in PySpark

## 📚 Topics Covered
- SparkSession Exploration
- Understanding `type()`
- Using `dir()` and `help()`
- `createDataFrame()`
- DataFrames from Lists
- DataFrames from Dictionaries
- Schema Inference
- StructType
- StructField
- IntegerType
- StringType
- Manual Schema Definition

---

# 🗂️ Concepts Practiced

## 1️⃣ Exploring SparkSession

```python
type(spark)
dir(spark)
help(spark.createDataFrame)
````

### Purpose

* Understand SparkSession object.
* Explore available methods and functions.
* Learn how `createDataFrame()` works.

---

## 2️⃣ Creating DataFrame from List of Tuples

```python
data = [
    (1, "John", 50000),
    (2, "Emma", 60000),
    (3, "David", 55000)
]

df = spark.createDataFrame(
    data,
    ["emp_id", "name", "salary"]
)

df.display()
```

### Purpose

* Convert Python lists into Spark DataFrames.
* Learn basic DataFrame creation.

---

## 3️⃣ Creating DataFrame from Dictionary

```python
data = [
    {"id": 1, "name": "John"},
    {"id": 2, "name": "Emma"}
]

df = spark.createDataFrame(data)

df.display()
```

### Purpose

* Create DataFrames using dictionary structures.
* Automatically infer column names.

---

## 4️⃣ Schema Inference

```python
df.printSchema()
```

### Purpose

* Understand how Spark automatically detects data types.
* Verify DataFrame structure.

---

## 5️⃣ Creating Custom Schema

```python
from pyspark.sql.types import *

schema = StructType([
    StructField("emp_id", IntegerType(), True),
    StructField("name", StringType(), True),
    StructField("salary", IntegerType(), True)
])
```

### Purpose

* Define column names explicitly.
* Assign proper data types.
* Improve data consistency.

---

## 6️⃣ Creating DataFrame Using Custom Schema

```python
df = spark.createDataFrame(
    data,
    schema=schema
)

df.display()
```

### Purpose

* Apply custom schema during DataFrame creation.
* Avoid incorrect datatype inference.

---

# 💡 Key Learnings

* Spark DataFrames can be created directly from Python collections.
* `createDataFrame()` is one of the most commonly used PySpark APIs.
* Spark can automatically infer schemas from data.
* Custom schemas provide better control over data types.
* `StructType` and `StructField` are used to define explicit schemas.
* Schema management is essential for real-world ETL pipelines.

---

# 🛠️ Skills Practiced

* PySpark DataFrame Creation
* Schema Inference
* Manual Schema Definition
* StructType & StructField
* Data Type Management
* Databricks Notebook Operations

---

# 🎯 Outcome

By the end of Day 3, I learned how to:

* Create DataFrames from lists and dictionaries.
* Explore SparkSession methods.
* Understand schema inference.
* Define custom schemas using StructType.
* Assign explicit datatypes to DataFrame columns.
* Build structured DataFrames for ETL workflows.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks

---
