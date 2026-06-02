# 🚀 Week 3 – Day 5: Writing DataFrames to CSV in PySpark

## 📚 Topics Covered
- Writing DataFrames to CSV
- `df.write.csv()`
- Data Source API (`format().save()`)
- Write Modes
- CSV Headers
- Reading Written Files
- Spark Output Partitions
- `_SUCCESS` File

---

# 🗂️ Dataset Used

Created a DataFrame manually using `createDataFrame()`.

```python
data = [
    (1, "John"),
    (2, "Mary"),
    (3, "Mike"),
    (4, "Jane")
]

schema = ("id", "name")

df = spark.createDataFrame(data, schema)
````

---

# 🔹 Creating a DataFrame

```python
data = [
    (1, "John"),
    (2, "Mary"),
    (3, "Mike"),
    (4, "Jane")
]

schema = ("id", "name")

df = spark.createDataFrame(data, schema)

df.display()
```

### Purpose

* Creates a DataFrame from Python data.
* Used as the source dataset for write operations.

---

# 🔹 Writing DataFrame to CSV

```python
df.write.csv(
    path="/Volumes/workspace/default/databricks2027/output",
    header=True,
    mode="overwrite"
)
```

### Purpose

* Writes DataFrame data into CSV format.
* Creates an output folder containing CSV part files.

---

# 🔹 Writing Using Data Source API

```python
df.write \
  .format("csv") \
  .option("header", True) \
  .mode("overwrite") \
  .save("/Volumes/workspace/default/databricks2027/output")
```

### Purpose

* Generic approach used in production ETL pipelines.
* Supports different file formats using the same pattern.

---

# 🔹 Understanding Write Modes

```python
.mode("overwrite")
```

### Available Modes

| Mode      | Description                 |
| --------- | --------------------------- |
| overwrite | Replaces existing data      |
| append    | Adds new data               |
| ignore    | Skips write if path exists  |
| error     | Throws error if path exists |

---

# 🔹 Reading the Written CSV

```python
df2 = spark.read \
    .option("header", True) \
    .csv("/Volumes/workspace/default/databricks2027/output")

df2.display()
```

### Purpose

* Reads the CSV data written by Spark.
* Uses header information correctly.

---

# 🔹 Spark Output Files

After writing the DataFrame, Spark generated:

```text
output/
├── part-00000.csv
├── part-00001.csv
├── part-00002.csv
├── part-00003.csv
├── _SUCCESS
├── _started_xxx
└── _committed_xxx
```

### Why Multiple Files?

* Spark stores data in partitions.
* Each partition writes its own CSV file.
* Parallel processing improves performance.

---

# 🔹 Important Learning

```python
df.write.csv(...)
```

is equivalent to:

```python
df.write.format("csv").save(...)
```

The first is a shortcut method, while the second follows the generic Data Source API pattern.

---

# 💡 Key Learnings

* Created DataFrames using `createDataFrame()`.
* Wrote DataFrames to CSV files.
* Used overwrite mode to replace existing data.
* Used the Data Source API for writing files.
* Read data back from written CSV files.
* Understood Spark-generated output files.
* Learned how partitions affect file creation.

---

# 🛠️ Skills Practiced

* DataFrame Creation
* CSV File Writing
* CSV File Reading
* Write Modes
* Data Source API
* Databricks File Storage

---

# 🎯 Outcome

By the end of Day 5, I learned how to:

* Create a DataFrame manually.
* Write DataFrames to CSV files.
* Use overwrite mode while writing.
* Read data back from output folders.
* Understand Spark partition-based file generation.
* Use both shortcut and generic write APIs.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks

```
