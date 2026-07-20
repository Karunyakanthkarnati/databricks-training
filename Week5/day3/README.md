# 🚀 Week 5 – Day 3: PySpark Transform Functions & Temporary Views

## 📌 Overview

In Week 5 Day 3, I practiced PySpark transformation techniques and temporary views.

The main focus was on:

* `DataFrame.transform()`
* Reusable transformation functions
* `functions.transform()`
* Lambda functions
* Array transformations
* `array_union()`
* `createOrReplaceTempView()`
* Spark SQL queries on temporary views
* `dropTempView()`
* `createOrReplaceGlobalTempView()`

---

# 1️⃣ DataFrame.transform()

The `DataFrame.transform()` method is used to apply a **custom transformation function** to an entire DataFrame.

It is useful for:

* Reusing transformation logic
* Writing cleaner code
* Breaking complex transformations into functions
* Chaining multiple DataFrame transformations

### Syntax

```python
df.transform(function)
```

The function should:

1. Accept a DataFrame as input.
2. Perform transformations.
3. Return a DataFrame.

---

## Create Employee DataFrame

```python
data = [
    (1, "ravi", 5000),
    (2, "raj", 6000),
    (3, "ram", 7000),
    (4, "raj", 8000),
    (5, "ram", 9000)
]

schema = ["id", "name", "salary"]

df = spark.createDataFrame(data, schema)

df.show()
```

---

## Convert Names to Uppercase

First, create a reusable function:

```python
from pyspark.sql.functions import *

def changenametoUpper(df):
    df = df.withColumn(
        "name",
        upper(col("name"))
    )
    return df
```

Apply the function using `transform()`:

```python
df1 = df.transform(changenametoUpper)

df1.show()
```

### Result

The values in the `name` column are converted to uppercase.

```text
ravi → RAVI
raj  → RAJ
ram  → RAM
```

---

# 2️⃣ Applying Multiple Transformations

We can create another function to double the employee salary.

```python
def doublesalary(df):
    df = df.withColumn(
        "salary",
        col("salary") * 2
    )
    return df
```

Apply the first transformation:

```python
df1 = df.transform(changenametoUpper)

df1.show()
```

Apply another transformation:

```python
df2 = df1.transform(doublesalary)

df2.show()
```

The transformation flow is:

```text
Original DataFrame
        ↓
changenametoUpper()
        ↓
Names converted to uppercase
        ↓
doublesalary()
        ↓
Salary values doubled
```

This demonstrates how `DataFrame.transform()` helps organize reusable DataFrame operations.

---

# 3️⃣ functions.transform()

PySpark also provides a `transform()` function inside:

```python
pyspark.sql.functions
```

This is different from:

```python
df.transform()
```

`functions.transform()` is a **higher-order function** mainly used to apply an operation to **each element of an array column**.

### General Syntax

```python
transform(array_column, lambda_function)
```

Example:

```python
transform(
    col("skills"),
    lambda x: upper(x)
)
```

The lambda function is applied to every element inside the `skills` array.

---

# 4️⃣ DataFrame.transform() vs functions.transform()

| Feature      | `DataFrame.transform()`            | `functions.transform()`       |
| ------------ | ---------------------------------- | ----------------------------- |
| Works on     | Entire DataFrame                   | Elements of an array          |
| Input        | Transformation function            | Array column + lambda         |
| Main purpose | Reusable DataFrame transformations | Transform array elements      |
| Example      | Change a DataFrame column          | Uppercase every array element |

Example of `DataFrame.transform()`:

```python
df.transform(changenametoUpper)
```

Example of `functions.transform()`:

```python
transform(
    col("skills"),
    lambda x: upper(x)
)
```

Although both are named `transform`, they serve different purposes.

---

# 5️⃣ Working with Array Columns

Create a DataFrame containing an array column called `skills`.

```python
data = [
    (1, "kanth", ["python", "streamlit"]),
    (2, "raju", ["sql", "pyspark"]),
    (3, "sai", ["sql", "java"])
]

schema = ["id", "name", "skills"]

df = spark.createDataFrame(data, schema)

df.show()
df.printSchema()
```

The `skills` column contains arrays such as:

```text
["python", "streamlit"]
["sql", "pyspark"]
["sql", "java"]
```

---

# 6️⃣ Adding an Element to an Array

We can use `array_union()` to add a new skill to the `skills` array.

```python
def addnewskill(df):
    df = df.withColumn(
        "skills",
        array_union(
            col("skills"),
            array(lit("scala"))
        )
    )
    return df
```

Apply it using `DataFrame.transform()`:

```python
df1 = df.transform(addnewskill)

display(df1)
```

### Example Transformation

```text
["python", "streamlit"]
```

becomes:

```text
["python", "streamlit", "scala"]
```

`array_union()` combines two arrays while avoiding duplicate elements.

---

# 7️⃣ Lambda Functions

A lambda function is a small anonymous function written in a single expression.

### Syntax

```python
lambda arguments: expression
```

Example:

```python
lambda x: upper(x)
```

It takes `x` and returns its uppercase value.

A lambda is useful when a small function is required temporarily and defining a separate function using `def` is unnecessary.

---

# 8️⃣ Transform Array Elements Using Lambda

We can convert every skill in the `skills` array to uppercase.

```python
df2 = df1.withColumn(
    "skills",
    transform(
        "skills",
        lambda x: upper(x)
    ).alias("skills")
)

df2.show()
```

### Example Transformation

Before:

```text
["python", "streamlit", "scala"]
```

After:

```text
["PYTHON", "STREAMLIT", "SCALA"]
```

The lambda:

```python
lambda x: upper(x)
```

runs once for each element in the array.

Conceptually:

```text
["python", "streamlit", "scala"]
       ↓ transform()
"python"     → "PYTHON"
"streamlit"  → "STREAMLIT"
"scala"      → "SCALA"
       ↓
["PYTHON", "STREAMLIT", "SCALA"]
```

---

# 9️⃣ createOrReplaceTempView()

`createOrReplaceTempView()` registers a DataFrame as a **temporary SQL view**.

After creating the view, we can query the DataFrame using Spark SQL.

### Syntax

```python
df.createOrReplaceTempView("view_name")
```

---

## Create Employee DataFrame

```python
data = [
    (1, "raj", "Male", 2000),
    (2, "venky", "Male", 3000),
    (3, "srinidhi", "Female", 4000)
]

schema = [
    "id",
    "name",
    "gender",
    "salary"
]

df = spark.createDataFrame(data, schema)

df.show()
```

---

## Create Temporary View

```python
df.createOrReplaceTempView("employees")
```

Now the DataFrame can be accessed as a SQL view named:

```text
employees
```

---

# 🔟 Query Temporary View Using spark.sql()

Once the temporary view is created, SQL queries can be executed using `spark.sql()`.

```python
df1 = spark.sql("""
    SELECT id, name
    FROM employees
""")

df1.show()
```

This selects only:

```text
id
name
```

from the temporary view.

---

# 1️⃣1️⃣ Query Temp View Using Databricks SQL Cell

In Databricks, a temporary view can also be queried directly using `%sql`.

```sql
%sql

SELECT name, salary
FROM employees
```

This allows us to switch easily between:

* PySpark DataFrame API
* Spark SQL

on the same data.

---

# 1️⃣2️⃣ Dropping a Temporary View

A temporary view can be removed from the Spark catalog using:

```python
spark.catalog.dropTempView("employees")
```

After dropping the view, it can no longer be queried using:

```sql
SELECT *
FROM employees
```

unless the view is created again.

---

# 1️⃣3️⃣ createOrReplaceGlobalTempView()

`createOrReplaceGlobalTempView()` creates a **global temporary view**.

### Syntax

```python
df.createOrReplaceGlobalTempView("view_name")
```

Example:

```python
df.createOrReplaceGlobalTempView(
    "employee_global_view"
)
```

A global temporary view is accessed through the special database:

```text
global_temp
```

Therefore, the query must use:

```python
result = spark.sql("""
    SELECT *
    FROM global_temp.employee_global_view
    WHERE salary > 3000
""")

result.show()
```

Notice:

```text
global_temp.employee_global_view
```

instead of only:

```text
employee_global_view
```

---

# 🔄 Temporary View vs Global Temporary View

| Feature         | Temporary View              | Global Temporary View                                      |
| --------------- | --------------------------- | ---------------------------------------------------------- |
| Creation        | `createOrReplaceTempView()` | `createOrReplaceGlobalTempView()`                          |
| Scope           | Current Spark session       | Shared across Spark sessions in the same Spark application |
| SQL access      | `employees`                 | `global_temp.employees`                                    |
| Database prefix | Not required                | `global_temp` required                                     |
| Lifetime        | Current session             | Spark application lifetime                                 |

---

# 🔑 Key Takeaways

| Concept                           | Purpose                                               |
| --------------------------------- | ----------------------------------------------------- |
| `df.transform()`                  | Applies a reusable function to an entire DataFrame    |
| `functions.transform()`           | Applies a lambda/function to each element of an array |
| `lambda`                          | Creates a short anonymous function                    |
| `withColumn()`                    | Creates or replaces a DataFrame column                |
| `upper()`                         | Converts string values to uppercase                   |
| `array_union()`                   | Combines arrays without duplicate elements            |
| `array()`                         | Creates an array                                      |
| `lit()`                           | Creates a literal value                               |
| `createOrReplaceTempView()`       | Creates a session-scoped temporary SQL view           |
| `spark.sql()`                     | Executes SQL queries using Spark                      |
| `%sql`                            | Executes SQL directly in a Databricks SQL cell        |
| `dropTempView()`                  | Removes a temporary view                              |
| `createOrReplaceGlobalTempView()` | Creates a global temporary view                       |

---

# 📚 What I Learned

* How to create reusable DataFrame transformation functions.
* How to use `DataFrame.transform()` to apply custom functions.
* How to chain multiple DataFrame transformations.
* The difference between `DataFrame.transform()` and `functions.transform()`.
* How lambda functions work with higher-order PySpark functions.
* How to transform every element inside an array column.
* How to add elements to arrays using `array_union()`.
* How to create temporary SQL views from DataFrames.
* How to query DataFrames using `spark.sql()`.
* How to execute SQL using `%sql` in Databricks.
* How to remove temporary views using `dropTempView()`.
* The difference between temporary and global temporary views.

---

## 🛠️ Technologies Used

* Python
* PySpark
* Apache Spark
* Spark SQL
* Databricks

---

⭐ **Week 5 – Day 3 completed: Practiced reusable DataFrame transformations, higher-order array transformations with lambda functions, and temporary/global SQL views in PySpark.**
