# 🚀 Week 4 – Day 4: Row() and Column Classes in PySpark

## 📚 Topics Covered

- Row()
- Named Row Objects
- Nested Row Structures
- Creating DataFrames using Row
- Column Class
- col()
- lit()
- Column Selection
- Column Expressions

---

# 🗂️ Concepts Practiced

## 1️⃣ Creating Row Objects

```python
from pyspark.sql import Row

row = Row('Kanth', 19)

print(row)
print(row[0])
```

### Purpose

* Represents a single record in PySpark.
* Allows accessing values using index positions.
* Useful for creating structured data.

---

## 2️⃣ Named Row Objects

```python
row = Row(
    name='Kanth',
    age=19
)

print(row.name)
print(row.age)
```

### Purpose

* Creates rows with named fields.
* Allows attribute-based access.
* Improves code readability.

---

## 3️⃣ Creating DataFrames from Row Objects

```python
data = [
    Row(name='Karunya', age=19),
    Row(name='Kanth', age=23)
]

df = spark.createDataFrame(data)
```

### Purpose

* Converts Row objects into DataFrames.
* Useful for creating structured datasets.

---

## 4️⃣ Working with Nested Rows

```python
data = [
    Row(
        name='Karunya',
        prop=Row(age=19, height=5.10)
    )
]
```

### Purpose

* Creates nested structures inside DataFrames.
* Demonstrates semi-structured data handling.
* Similar to nested JSON data.

---

## 5️⃣ Defining Row Templates

```python
person = Row(
    'name',
    'age'
)

p1 = person(
    'Kanth',
    23
)
```

### Purpose

* Creates reusable Row schemas.
* Simplifies record creation.

---

## 6️⃣ Adding Columns using lit()

```python
from pyspark.sql.functions import lit

df = df.withColumn(
    "nationality",
    lit("India")
)
```

### Purpose

* Adds constant values to DataFrames.
* Useful during ETL transformations.

---

## 7️⃣ Accessing Columns using col()

```python
from pyspark.sql.functions import col

df.select(
    col("name")
)
```

### Purpose

* References DataFrame columns explicitly.
* Commonly used in transformations and filtering.

---

## 8️⃣ Selecting Columns using Column Objects

```python
df.select(df["age"])

df.select(df.salary)
```

### Purpose

* Demonstrates different ways of accessing columns.
* Helps build column expressions.

---

# 💡 Key Learnings

* Created Row objects in multiple ways.
* Used named fields for better readability.
* Built DataFrames using Row data.
* Worked with nested Row structures.
* Created reusable Row templates.
* Added columns using lit().
* Accessed columns using col().
* Selected columns using Column expressions.

---

# 🛠️ Skills Practiced

* Row Class
* Column Class
* DataFrame Creation
* Nested Data Structures
* Column Selection
* Data Transformation
* PySpark DataFrames
* Databricks Notebook Operations

---

# 🎯 Outcome

By the end of this notebook, I learned how to:

* Create and use Row objects.
* Build DataFrames from Row data.
* Handle nested Row structures.
* Access DataFrame columns using multiple approaches.
* Use Column expressions for transformations.
* Work efficiently with PySpark DataFrames.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks
