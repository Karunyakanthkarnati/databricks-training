# 🚀 Week 3 – Day 4: Reading CSV Files with Custom Schemas in PySpark

## 📚 Topics Covered
- Reading CSV Files
- `spark.read.csv()`
- `spark.read.format().load()`
- Reading Multiple Files
- Schema Inference
- Custom Schema using String Definition
- StructType
- StructField
- Data Types in PySpark
- `printSchema()`

---

# 🗂️ Datasets Used

## Employee Data (`empData.csv`)
Used for practicing CSV file reading and schema definition.

## Big Sales (`Big Sales.csv`)
Used for understanding multi-file reading in PySpark.

---

# 🔹 Reading CSV Using `spark.read.csv()`

```python
df = spark.read.csv(
    "/Volumes/workspace/default/databricks2027/empData.csv",
    header=True,
    inferSchema=True
)

df.display()
````

### Purpose

* Reads CSV files directly.
* Automatically infers column datatypes.

---

# 🔹 Reading CSV Using Data Source API

```python
df1 = spark.read.format("csv") \
    .option("header", True) \
    .load("/Volumes/workspace/default/databricks2027/empData.csv")

df1.display()
```

### Purpose

* Generic file reading approach.
* Commonly used in production ETL pipelines.

---

# 🔹 Viewing Schema

```python
df1.printSchema()
```

### Purpose

* Displays column names and datatypes.
* Helps verify schema correctness.

---

# 🔹 Reading Multiple CSV Files

```python
df_csv = spark.read.csv(
    [
        "/Volumes/workspace/default/databricks2027/empData.csv",
        "/Volumes/workspace/default/databricks2027/Big Sales.csv"
    ],
    header=True
)

df_csv.display()
```

### Purpose

* Reads multiple files in a single operation.
* Useful when files belong to the same dataset.

---

# 🔹 Defining Schema Using String

```python
my_schema = """
emp_id STRING,
name STRING,
salary INT,
address STRING
"""
```

```python
df = spark.read.csv(
    "/Volumes/workspace/default/databricks2027/empData.csv",
    header=True,
    schema=my_schema
)

df.display()
```

### Benefits

* Simple and readable.
* Faster than schema inference.
* Ensures correct datatypes.

---

# 🔹 Defining Schema Using StructType

```python
from pyspark.sql.types import *

schema = StructType([
    StructField("emp_id", IntegerType(), True),
    StructField("name", StringType(), True),
    StructField("salary", IntegerType(), True)
]).add("address", StringType(), True)
```

### Purpose

* Explicit schema definition.
* Better control over datatypes.
* Common in production environments.

---

# 🔹 Applying Custom Schema

```python
df = spark.read.csv(
    "/Volumes/workspace/default/databricks2027/empData.csv",
    header=True,
    schema=schema
)

df.display()
```

### Purpose

* Reads data with predefined datatypes.
* Avoids schema inference overhead.

---

# 💡 Key Learnings

* Multiple ways to read CSV files in PySpark.
* Difference between schema inference and custom schema.
* Reading multiple files using a list of paths.
* Creating schemas using string definitions.
* Creating schemas using StructType and StructField.
* Importance of schema management in ETL pipelines.

---

# 🛠️ Skills Practiced

* CSV File Handling
* DataFrame Creation
* Schema Inference
* StructType & StructField
* Custom Schema Definition
* Databricks Notebook Operations

---

# 🎯 Outcome

By the end of Day 4, I learned how to:

* Read CSV files using different approaches.
* Read multiple files in a single operation.
* Define schemas using strings.
* Define schemas using StructType.
* Apply custom schemas while loading data.
* Inspect DataFrame structure using `printSchema()`.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks

---
