# 🚀 Week 4 – Day 3: MapType() Column Functions in PySpark

## 📚 Topics Covered

- MapType()
- Creating Map Columns
- Accessing Map Elements
- getItem()
- Bracket Notation
- explode()
- map_keys()
- map_values()

---

# 🗂️ Concepts Practiced

## 1️⃣ Creating MapType Columns

```python
from pyspark.sql.types import *

schema = StructType([
    StructField("name", StringType()),
    StructField(
        "details",
        MapType(StringType(), DoubleType())
    )
])
```

### Purpose

* Defines a column containing key-value pairs.
* Useful for handling JSON-like and semi-structured data.
* Stores multiple attributes within a single column.

---

## 2️⃣ Creating DataFrame with MapType Data

```python
data = [
    ('kanth', {'age':19, 'height':5.11}),
    ('raj', {'age':20, 'height':5.12})
]

df = spark.createDataFrame(
    data,
    schema
)
```

### Purpose

* Creates DataFrames containing dictionary-style data.
* Demonstrates real-world nested data structures.

---

## 3️⃣ Accessing Map Values using Bracket Notation

```python
df1 = df.withColumn(
    "age",
    df.details["age"]
)
```

### Purpose

* Extracts values from specific keys.
* Provides direct access to MapType elements.

---

## 4️⃣ Accessing Map Values using getItem()

```python
df2 = df1.withColumn(
    "height",
    df1.details.getItem("height")
)
```

### Purpose

* Retrieves values using map keys.
* Alternative method for accessing MapType data.

---

## 5️⃣ Exploding MapType Columns

```python
df3 = df.select(
    "name",
    "details",
    explode("details")
)
```

### Purpose

* Converts map entries into separate rows.
* Creates key-value pair representation.
* Useful for flattening nested data.

---

## 6️⃣ Extracting Keys using map_keys()

```python
df4 = df.withColumn(
    "keys",
    map_keys(df.details)
)
```

### Purpose

* Returns all keys from a MapType column.
* Output is stored as an array.

---

## 7️⃣ Extracting Values using map_values()

```python
df5 = df4.withColumn(
    "values",
    map_values(df.details)
)
```

### Purpose

* Returns all values from a MapType column.
* Useful for data analysis and transformations.

---

# 💡 Key Learnings

* Created MapType columns in PySpark.
* Stored dictionary-style data inside DataFrames.
* Accessed map elements using bracket notation.
* Retrieved map values using getItem().
* Flattened MapType data using explode().
* Extracted keys using map_keys().
* Extracted values using map_values().

---

# 🛠️ Skills Practiced

* MapType Handling
* Nested Data Processing
* Key-Value Data Operations
* Data Transformation
* Semi-Structured Data Processing
* PySpark DataFrames
* Databricks Notebook Operations

---

# 🎯 Outcome

By the end of this notebook, I learned how to:

* Create and work with MapType columns.
* Access specific values from maps.
* Flatten map data into rows.
* Extract keys and values from MapType columns.
* Process semi-structured data efficiently using PySpark.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks
