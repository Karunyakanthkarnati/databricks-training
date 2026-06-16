# 🚀 Week 4 – Day 6: GroupBy, Aggregations, Sorting & DataFrame Union Operations in PySpark

## 📚 Topics Covered

- select()
- selectExpr()
- groupBy()
- count()
- sum()
- avg()
- min()
- max()
- agg()
- sort()
- orderBy()
- union()
- unionByName()

---

# 🗂️ Concepts Practiced

## 1️⃣ Selecting Columns using select()

```python
df.select(
    "id",
    "name",
    "salary"
)
```

### Purpose

* Retrieves specific columns from a DataFrame.
* Improves readability and performance.
* Reduces unnecessary data processing.

---

## 2️⃣ Using SQL Expressions with selectExpr()

```python
df.selectExpr(
    "id",
    "salary * 1.10 as updated_salary"
)
```

### Purpose

* Allows SQL-like expressions within DataFrames.
* Useful for quick calculations and transformations.
* Simplifies complex column expressions.

---

## 3️⃣ Grouping Data using groupBy()

```python
df.groupBy(
    "department"
)
```

### Purpose

* Groups rows based on column values.
* Used before performing aggregate calculations.
* Forms the foundation for analytical reporting.

---

## 4️⃣ Counting Records using count()

```python
df.groupBy(
    "department"
).count()
```

### Purpose

* Counts records within each group.
* Useful for employee, customer, and transaction analysis.

---

## 5️⃣ Calculating Total Values using sum()

```python
df.groupBy(
    "department"
).sum("salary")
```

### Purpose

* Calculates total values for grouped records.
* Commonly used for sales and revenue reporting.

---

## 6️⃣ Calculating Average Values using avg()

```python
df.groupBy(
    "department"
).avg("salary")
```

### Purpose

* Computes average values within groups.
* Useful for performance and compensation analysis.

---

## 7️⃣ Finding Minimum and Maximum Values

```python
df.groupBy(
    "department"
).agg(
    min("salary"),
    max("salary")
)
```

### Purpose

* Identifies lowest and highest values.
* Helps compare performance across groups.

---

## 8️⃣ Performing Multiple Aggregations using agg()

```python
df.groupBy(
    "department"
).agg(
    count("*"),
    sum("salary"),
    avg("salary"),
    min("salary"),
    max("salary")
)
```

### Purpose

* Executes multiple aggregations in a single operation.
* Improves efficiency and reduces repetitive code.

---

## 9️⃣ Sorting Data using sort()

```python
df.sort(
    "salary"
)
```

### Purpose

* Sorts records in ascending order by default.
* Useful for ranking and reporting.

---

## 🔟 Sorting Data using orderBy()

```python
df.orderBy(
    col("salary").desc()
)
```

### Purpose

* Supports ascending and descending sorting.
* Useful for Top-N analysis and business reporting.

---

## 1️⃣1️⃣ Sorting by Multiple Columns

```python
df.orderBy(
    "department",
    "salary"
)
```

### Purpose

* Performs hierarchical sorting.
* Organizes grouped reports effectively.

---

## 1️⃣2️⃣ Combining DataFrames using union()

```python
df1.union(df2)
```

### Purpose

* Appends rows from another DataFrame.
* Requires identical schema and column order.

---

## 1️⃣3️⃣ Combining DataFrames using unionByName()

```python
df1.unionByName(df2)
```

### Purpose

* Combines DataFrames based on column names.
* Prevents incorrect data mapping when column order differs.

---

## 1️⃣4️⃣ Understanding union() vs unionByName()

### union()

```python
df1.union(df2)
```

* Matches columns by position.
* Column order must be identical.

### unionByName()

```python
df1.unionByName(df2)
```

* Matches columns by name.
* Safer and preferred in ETL pipelines.

---

# 💡 Key Learnings

* Selected columns using select().
* Applied SQL-style transformations with selectExpr().
* Grouped records using groupBy().
* Performed count, sum, avg, min, and max aggregations.
* Used agg() for multiple aggregate calculations.
* Sorted records using sort() and orderBy().
* Applied multi-column sorting.
* Combined DataFrames using union().
* Merged DataFrames safely using unionByName().
* Understood schema requirements for DataFrame merging.

---

# 🛠️ Skills Practiced

* Data Selection
* Data Aggregation
* Grouping Operations
* Business Reporting
* Data Analysis
* Data Sorting
* DataFrame Merging
* ETL Transformations
* PySpark DataFrames
* Databricks Notebook Operations

---

# 🎯 Outcome

By the end of this notebook, I learned how to:

* Select and transform DataFrame columns efficiently.
* Generate grouped summaries using aggregations.
* Analyze data using statistical functions.
* Sort records for reporting and ranking.
* Combine multiple DataFrames safely.
* Build common ETL workflows using PySpark.

---

# 🔗 Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks
