# 🚀 Week 5 – Day 1: Joins, Pivot & Stack Operations in PySpark

## 📚 Topics Covered

- Inner Join
- Left Join
- Right Join
- Full Outer Join
- Left Semi Join
- Left Anti Join
- pivot()
- stack()
- expr()

---

# 🗂️ Concepts Practiced

## 1️⃣ Performing Inner Join

```python
empdf.join(
    deptdf,
    empdf.dept == deptdf.dept,
    "inner"
)
```

### Purpose

* Returns only matching records from both DataFrames.
* Most commonly used join in ETL pipelines.
* Combines related data from multiple sources.

---

## 2️⃣ Performing Left Join

```python
empdf.join(
    deptdf,
    empdf.dept == deptdf.dept,
    "left"
)
```

### Purpose

* Returns all records from the left DataFrame.
* Includes matching records from the right DataFrame.
* Missing matches are filled with NULL values.

---

## 3️⃣ Performing Right Join

```python
empdf.join(
    deptdf,
    empdf.dept == deptdf.dept,
    "right"
)
```

### Purpose

* Returns all records from the right DataFrame.
* Includes matching records from the left DataFrame.
* Useful when the right table is the primary dataset.

---

## 4️⃣ Performing Full Outer Join

```python
empdf.join(
    deptdf,
    empdf.dept == deptdf.dept,
    "outer"
)
```

### Purpose

* Returns all matching and non-matching records.
* Preserves data from both DataFrames.
* Commonly used during data reconciliation.

---

## 5️⃣ Performing Left Semi Join

```python
empdf.join(
    deptdf,
    empdf.dept == deptdf.dept,
    "leftsemi"
)
```

### Purpose

* Returns only matching rows from the left DataFrame.
* Does not include columns from the right DataFrame.
* Useful for existence checks.

---

## 6️⃣ Performing Left Anti Join

```python
empdf.join(
    deptdf,
    empdf.dept == deptdf.dept,
    "leftanti"
)
```

### Purpose

* Returns records from the left DataFrame that have no match.
* Commonly used to identify missing or unmatched data.

---

## 7️⃣ Creating Pivot Tables using pivot()

```python
df.groupBy("dept") \
  .pivot("gender") \
  .count()
```

### Purpose

* Converts row values into columns.
* Generates summarized reports.
* Useful for analytical and reporting tasks.

---

## 8️⃣ Creating Dynamic Pivot Reports

```python
df.groupBy("gender") \
  .pivot("dept") \
  .count()
```

### Purpose

* Produces department-wise summaries.
* Helps analyze categorical data efficiently.

---

## 9️⃣ Creating Pivot with Selected Values

```python
df.groupBy("gender") \
  .pivot("dept", ["IT", "HR"]) \
  .count()
```

### Purpose

* Creates pivot tables for selected categories only.
* Improves performance by limiting pivot columns.

---

## 🔟 Transforming Columns into Rows using stack()

```python
df.select(
    "dept",
    expr(
        "stack(2,'Male',male,'Female',female)"
    )
)
```

### Purpose

* Converts multiple columns into rows.
* Performs unpivot transformation.
* Useful when preparing normalized datasets.

---

# 💡 Key Learnings

* Performed multiple types of joins between DataFrames.
* Understood the difference between Inner, Left, Right, Full, Semi, and Anti joins.
* Generated summary reports using pivot().
* Limited pivot values for optimized execution.
* Converted columns into rows using stack().
* Applied expr() for SQL-like expressions.

---

# 🛠️ Skills Practiced

* DataFrame Joins
* Data Integration
* Data Aggregation
* Pivot Tables
* Unpivot Operations
* SQL Expressions
* ETL Transformations
* Analytical Data Processing
* PySpark DataFrames
* Databricks Notebook Operations

---

# 🎯 Outcome

By the end of this notebook, I learned how to:

* Merge DataFrames using different join types.
* Choose the appropriate join based on business requirements.
* Create pivot tables for analytical reporting.
* Transform wide-format data into long-format using stack().
* Build efficient ETL workflows using PySpark.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks
