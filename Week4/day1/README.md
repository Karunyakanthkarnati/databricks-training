# 🚀 Week 4 – Day 1: DataFrame Display, Column Operations & Schema Definition in PySpark

## 📚 Topics Covered

- show()
- withColumn()
- withColumnRenamed()
- StructType()
- StructField()
- Custom Schema Definition
- Data Type Management

---

# 🗂️ Concepts Practiced

## 1️⃣ Displaying Data using show()

```python
df.show()
````

### Purpose

* Displays DataFrame records in tabular format.
* Useful for quick inspection of data.
* Commonly used during data exploration and debugging.

---

## 2️⃣ Adding a New Column using withColumn()

```python
from pyspark.sql.functions import lit

df = df.withColumn("country", lit("India"))
```

### Purpose

* Adds a new column to an existing DataFrame.
* Supports calculations, transformations, and constant values.

---

## 3️⃣ Modifying Existing Columns using withColumn()

```python
from pyspark.sql.functions import col

df = df.withColumn(
    "salary",
    col("salary") * 1.1
)
```

### Purpose

* Updates existing column values.
* Commonly used in ETL transformations.

---

## 4️⃣ Renaming Columns using withColumnRenamed()

```python
df = df.withColumnRenamed(
    "name",
    "employee_name"
)
```

### Purpose

* Renames DataFrame columns.
* Improves readability and standardization.

---

## 5️⃣ Schema Inference

```python
df.printSchema()
```

### Purpose

* Displays DataFrame structure.
* Shows column names and datatypes inferred by Spark.

---

## 6️⃣ Creating Custom Schema using StructType & StructField

```python
from pyspark.sql.types import *

schema = StructType([
    StructField("id", IntegerType(), True),
    StructField("name", StringType(), True)
])
```

### Purpose

* Defines schema manually.
* Provides better control over datatypes.
* Avoids schema inference overhead.

---

## 7️⃣ Creating DataFrame with Custom Schema

```python
data = [
    {"id": 1, "name": "Raj"},
    {"id": 2, "name": "Ravi"}
]

df = spark.createDataFrame(
    data,
    schema
)

df.display()
```

### Purpose

* Creates DataFrames with predefined structure.
* Ensures data consistency.

---

# 💡 Key Learnings

* Used `show()` to inspect DataFrame contents.
* Added and modified columns using `withColumn()`.
* Renamed columns using `withColumnRenamed()`.
* Viewed schema using `printSchema()`.
* Created custom schemas using `StructType()` and `StructField()`.
* Built DataFrames with explicit datatypes.

---

# 🛠️ Skills Practiced

* DataFrame Display
* Column Transformations
* Column Renaming
* Schema Definition
* Data Type Management
* PySpark DataFrames
* Databricks Notebook Operations

---

# 🎯 Outcome

By the end of this notebook, I learned how to:

* Display DataFrame records.
* Add and modify columns.
* Rename columns effectively.
* Define custom schemas.
* Create structured DataFrames with explicit datatypes.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks

```
