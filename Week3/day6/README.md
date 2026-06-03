# 🚀 Week 3 Day 6 – Read & Write JSON and Parquet Files using PySpark

## 📚 Topics Covered

- 📄 Read JSON Files
- 📄 Read Multi-line JSON
- 📂 Read Multiple JSON Files
- ✍️ Write DataFrame to JSON
- 🗄️ Read Parquet Files
- ✍️ Write DataFrame to Parquet
- 🔄 Read Written Parquet Files

---

# 📂 Dataset Used

### employee.json
Used for JSON Read/Write operations.

### userdata1.parquet
Used for Parquet Read operations.

---

# 1️⃣ Reading Multi-line JSON File

```python
df = spark.read.json(
    "/Volumes/workspace/default/databricks2027/employee.json",
    multiLine=True
)

df.printSchema()
df.show()
````

### Concepts

* Reads JSON file into DataFrame
* `multiLine=True` is used when JSON spans multiple lines

---

# 2️⃣ Reading JSON using format()

```python
df = spark.read.format("json") \
    .option("multiline", True) \
    .load("/Volumes/workspace/default/databricks2027/employee.json")

df.printSchema()
df.show()
```

### Concepts

* Alternative approach for reading JSON
* Useful when chaining multiple options

---

# 3️⃣ Reading Multiple JSON Files

```python
df = spark.read.json(
    "/Volumes/workspace/default/databricks2027/*.json",
    multiLine=True
)

df.printSchema()
df.display()
```

### Concepts

* Reads all JSON files matching the pattern
* Wildcard `*` loads multiple files at once

---

# 4️⃣ Writing DataFrame to JSON

### Create DataFrame

```python
data = [
    (1, "hari"),
    (2, "ram"),
    (3, "venu")
]

schema = ["id", "name"]

df = spark.createDataFrame(data, schema)

df.printSchema()
df.show()
```

### Write JSON

```python
df.write.json(
    "/Volumes/workspace/default/databricks2027/output1",
    mode="overwrite"
)
```

### Concepts

* Converts DataFrame into JSON files
* `overwrite` replaces existing data

---

# 5️⃣ Reading Parquet File

```python
df1 = spark.read.parquet(
    "/Volumes/workspace/default/databricks2027/userdata1.parquet"
)

df1.printSchema()
df1.display()
```

### Concepts

* Reads Parquet files into DataFrame
* Parquet is a columnar storage format
* Faster and more efficient than CSV/JSON

---

# 6️⃣ Writing DataFrame to Parquet

```python
df = spark.read.json(
    "/Volumes/workspace/default/databricks2027/employee.json",
    multiLine=True
)

df.write.parquet(
    "/Volumes/workspace/default/databricks2027/userdata1",
    mode="overwrite"
)
```

### Concepts

* Converts JSON DataFrame into Parquet format
* Common ETL operation in Data Engineering

---

# 7️⃣ Reading Written Parquet File

```python
df = spark.read.parquet(
    "/Volumes/workspace/default/databricks2027/userdata1"
)

df.printSchema()
df.display()
```

### Concepts

* Verifies data after writing
* Ensures successful conversion

---

# 🎯 Key Learnings

✅ Read JSON files

✅ Read multi-line JSON

✅ Read multiple JSON files using wildcard

✅ Write DataFrame to JSON

✅ Read Parquet files

✅ Write DataFrame to Parquet

✅ Verify written Parquet files

---

# 💡 Data Engineering Relevance

JSON and Parquet are among the most commonly used file formats in modern data pipelines.

* JSON → Frequently used in APIs and semi-structured data
* Parquet → Preferred format in Spark, Databricks, Data Lakes, and Big Data environments due to better compression and performance

---
