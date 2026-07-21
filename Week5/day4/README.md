# 🚀 Week 5 – Day 4: PySpark UDFs & RDD Basics

## 📌 Overview

In Week 5 Day 4, I practiced **User Defined Functions (UDFs)** and learned the basics of **RDDs (Resilient Distributed Datasets)** in PySpark.

### Topics Covered

* User Defined Functions (UDFs)
* Creating UDFs using `udf()`
* Using lambda functions with UDFs
* Creating UDFs using the `@udf` decorator
* Applying UDFs with `withColumn()`
* Applying UDFs with `select()`
* Registering Python UDFs for Spark SQL
* Using UDFs in SQL queries
* RDD basics
* Creating RDDs using `parallelize()`
* Converting an RDD into a DataFrame

---

# 1️⃣ User Defined Functions (UDFs)

A **User Defined Function (UDF)** allows us to create custom functions and apply them to columns in a Spark DataFrame.

UDFs are useful when PySpark's built-in functions do not provide the required functionality.

### Basic Example

```python
from pyspark.sql.functions import udf
from pyspark.sql.types import StringType

def upper_case(s):
    return s.upper() if s else None

upper_case_udf = udf(upper_case, StringType())

df.withColumn(
    "upper_name",
    upper_case_udf(df["name"])
).show()
```

> UDFs can be slower than native Spark functions. Built-in PySpark functions should be preferred whenever possible.

---

# 2️⃣ Creating the Employee DataFrame

First, create a sample employee DataFrame containing employee salary and bonus information.

```python
data = [
    (1, "raj", 5000, 200),
    (2, "ravi", 7000, 500),
    (3, "sruthi", 10000, 800)
]

schema = [
    "id",
    "name",
    "salary",
    "bonus"
]

df = spark.createDataFrame(data, schema)

df.show()
```

### Output

```text
+---+------+-----+-----+
| id|  name|salary|bonus|
+---+------+-----+-----+
|  1|   raj| 5000|  200|
|  2|  ravi| 7000|  500|
|  3|sruthi|10000|  800|
+---+------+-----+-----+
```

---

# 3️⃣ Creating a UDF Using `udf()`

Suppose we want to calculate the total payment of an employee:

```text
Total Pay = Salary + Bonus
```

First, create a normal Python function:

```python
def totalpay(s, b):
    return s + b
```

Now convert the Python function into a PySpark UDF:

```python
from pyspark.sql.functions import udf
from pyspark.sql.types import *

totalPayment = udf(
    lambda s, b: totalpay(s, b),
    IntegerType()
)
```

Here:

* `lambda s, b` receives salary and bonus.
* `totalpay(s, b)` performs the calculation.
* `IntegerType()` specifies that the UDF returns an integer.

---

# 4️⃣ Applying UDF with `withColumn()`

The UDF can be applied to DataFrame columns using `withColumn()`.

```python
df.withColumn(
    "totalpay",
    totalPayment(df.salary, df.bonus)
).show()
```

### Calculation

For employee `raj`:

```text
Salary = 5000
Bonus  = 200

Total Pay = 5000 + 200
          = 5200
```

### Output

```text
+---+------+-----+-----+--------+
| id|  name|salary|bonus|totalpay|
+---+------+-----+-----+--------+
|  1|   raj| 5000|  200|    5200|
|  2|  ravi| 7000|  500|    7500|
|  3|sruthi|10000|  800|   10800|
+---+------+-----+-----+--------+
```

---

# 5️⃣ Creating a UDF Using `@udf`

Instead of manually converting a Python function using `udf()`, we can use the `@udf` decorator.

### Example

```python
@udf(returnType=IntegerType())
def doublepay(s, b):
    return 2 * (s + b)
```

Here:

```python
@udf(returnType=IntegerType())
```

converts the Python function into a Spark UDF and specifies that the result is an integer.

---

# 6️⃣ Applying UDF Using `select()`

The `doublepay()` UDF can be applied using `select()`.

```python
df.select(
    "*",
    doublepay(
        df.salary,
        df.bonus
    ).alias("doublepay")
).show()
```

The `"*"` selects all existing columns.

The expression:

```python
doublepay(df.salary, df.bonus)
```

passes the `salary` and `bonus` columns to the UDF.

The `alias()` method gives the resulting column the name:

```text
doublepay
```

### Calculation

For the first employee:

```text
Salary = 5000
Bonus  = 200

Double Pay = 2 × (Salary + Bonus)

           = 2 × (5000 + 200)

           = 10400
```

### Output

```text
+---+------+-----+-----+---------+
| id|  name|salary|bonus|doublepay|
+---+------+-----+-----+---------+
|  1|   raj| 5000|  200|    10400|
|  2|  ravi| 7000|  500|    15000|
|  3|sruthi|10000|  800|    21600|
+---+------+-----+-----+---------+
```

---

# 7️⃣ Two Ways to Create a UDF

### Method 1 – Using `udf()`

```python
def totalpay(s, b):
    return s + b

totalPayment = udf(
    lambda s, b: totalpay(s, b),
    IntegerType()
)
```

### Method 2 – Using `@udf`

```python
@udf(returnType=IntegerType())
def doublepay(s, b):
    return 2 * (s + b)
```

Both methods create User Defined Functions that can be applied to DataFrame columns.

---

# 8️⃣ Using UDFs in Spark SQL

A Python UDF can also be registered so that it can be called inside Spark SQL queries.

First, create the DataFrame:

```python
data = [
    (1, "raj", 5000, 200),
    (2, "ravi", 7000, 500),
    (3, "sruthi", 10000, 800)
]

schema = [
    "id",
    "name",
    "salary",
    "bonus"
]

df = spark.createDataFrame(data, schema)

df.show()
```

---

# 9️⃣ Creating a Temporary View

To query the DataFrame using SQL, create a temporary view.

```python
df.createOrReplaceTempView("emps")
```

The DataFrame can now be accessed in Spark SQL using:

```text
emps
```

---

# 🔟 Registering a UDF for SQL

First, define the Python function:

```python
def totalpay(s, b):
    return s + b
```

Register it with Spark:

```python
spark.udf.register(
    name="Totalpay",
    f=totalpay,
    returnType=IntegerType()
)
```

### Parameters

* `name` – Name used to call the function in SQL.
* `f` – Python function containing the logic.
* `returnType` – Data type returned by the function.

After registration, `Totalpay()` can be used like a normal SQL function.

---

# 1️⃣1️⃣ Calling the UDF from SQL

In Databricks, use a `%sql` cell:

```sql
%sql

SELECT *,
       TotalPay(salary, bonus) AS totpay
FROM emps
```

### Output

```text
+---+------+-----+-----+------+
| id|  name|salary|bonus|totpay|
+---+------+-----+-----+------+
|  1|   raj| 5000|  200|  5200|
|  2|  ravi| 7000|  500|  7500|
|  3|sruthi|10000|  800| 10800|
+---+------+-----+-----+------+
```

This demonstrates how custom Python logic can be registered and used inside Spark SQL.

---

# 1️⃣2️⃣ UDF Execution Flow

The complete flow is:

```text
Python Function
      ↓
Create / Register UDF
      ↓
Pass DataFrame Columns
      ↓
UDF Executes for Rows
      ↓
Returns New Values
      ↓
New DataFrame Column
```

For SQL:

```text
Python Function
      ↓
spark.udf.register()
      ↓
Register Function Name
      ↓
Create Temporary View
      ↓
Execute Spark SQL
      ↓
Call UDF in SQL Query
```

---

# 1️⃣3️⃣ Important Note About UDF Performance

Although UDFs are useful for implementing custom logic, they should not always be the first choice.

For example, instead of:

```python
@udf(returnType=IntegerType())
def doublepay(s, b):
    return 2 * (s + b)
```

the same calculation can be performed using native Spark expressions:

```python
from pyspark.sql.functions import col

df.withColumn(
    "doublepay",
    2 * (col("salary") + col("bonus"))
).show()
```

Built-in Spark functions are generally preferred because Spark can optimize them more effectively.

### Best Practice

```text
Built-in Spark Function Available?
            |
       YES ─┴─ NO
        |      |
      Use it   Consider UDF
```

Use UDFs when the required custom logic cannot be easily implemented using built-in Spark functions.

---

# 1️⃣4️⃣ RDD – Resilient Distributed Dataset

An **RDD (Resilient Distributed Dataset)** is a fundamental distributed data structure in Apache Spark.

An RDD represents an:

* **Resilient** collection of data
* **Distributed** across multiple partitions/nodes
* **Immutable** dataset
* Collection that can be processed **in parallel**

RDDs support:

### Transformations

Examples:

```text
map()
filter()
flatMap()
```

### Actions

Examples:

```text
collect()
count()
take()
```

---

# 1️⃣5️⃣ Creating an RDD Using `parallelize()`

Create Python data:

```python
data = [
    (1, "raj"),
    (2, "ravi"),
    (3, "sruthi")
]
```

Define the schema:

```python
schema = [
    "id",
    "name"
]
```

Create an RDD using:

```python
rdd = spark.sparkContext.parallelize(data)
```

`parallelize()` converts a local Python collection into a distributed RDD.

Conceptually:

```text
Python Collection
      ↓
spark.sparkContext.parallelize()
      ↓
RDD
      ↓
Distributed Data
```

---

# 1️⃣6️⃣ Converting RDD to DataFrame

Once the RDD is created, it can be converted into a DataFrame.

```python
df = spark.createDataFrame(
    rdd,
    schema
)

df.show()
```

### Output

```text
+---+------+
| id|  name|
+---+------+
|  1|   raj|
|  2|  ravi|
|  3|sruthi|
+---+------+
```

The complete process is:

```text
Python List
    ↓
parallelize()
    ↓
RDD
    ↓
createDataFrame()
    ↓
PySpark DataFrame
```

---

# 🔄 RDD vs DataFrame

| Feature      | RDD                       | DataFrame                  |
| ------------ | ------------------------- | -------------------------- |
| Structure    | Collection of objects     | Rows and named columns     |
| Schema       | No built-in schema        | Has schema                 |
| Optimization | Limited                   | Catalyst Optimizer         |
| SQL Support  | No direct SQL support     | Supports Spark SQL         |
| Ease of use  | Lower-level API           | Higher-level API           |
| Common usage | Low-level transformations | Structured data processing |

For most structured data-processing tasks, **DataFrames are generally preferred** because they provide better optimization and easier APIs.

---

# 🔑 Key Takeaways

| Concept                     | Purpose                                     |
| --------------------------- | ------------------------------------------- |
| `udf()`                     | Converts a Python function into a Spark UDF |
| `@udf`                      | Decorator for defining a Spark UDF          |
| `IntegerType()`             | Defines an integer return type              |
| `withColumn()`              | Adds or replaces a DataFrame column         |
| `select()`                  | Selects columns and expressions             |
| `alias()`                   | Assigns a name to a resulting column        |
| `spark.udf.register()`      | Registers a Python function for Spark SQL   |
| `createOrReplaceTempView()` | Creates a temporary SQL view                |
| `%sql`                      | Runs SQL queries in Databricks              |
| RDD                         | Resilient Distributed Dataset               |
| `parallelize()`             | Creates an RDD from a local collection      |
| `createDataFrame()`         | Can convert an RDD into a DataFrame         |

---

# 📚 What I Learned

* What User Defined Functions are in PySpark.
* How to create UDFs using `udf()`.
* How to use lambda functions while creating UDFs.
* How to create UDFs using the `@udf` decorator.
* How to specify UDF return types using `IntegerType()`.
* How to apply UDFs using `withColumn()` and `select()`.
* How to register Python functions as SQL UDFs.
* How to call custom UDFs from Spark SQL.
* Why built-in Spark functions are preferred over Python UDFs when possible.
* What RDDs are and why they are called Resilient Distributed Datasets.
* How to create an RDD using `parallelize()`.
* How to convert an RDD into a PySpark DataFrame.
* The basic difference between RDDs and DataFrames.

---

## 🛠️ Technologies Used

* Python
* PySpark
* Apache Spark
* Spark SQL
* Databricks

---

⭐ **Week 5 – Day 4 completed: Practiced PySpark User Defined Functions, SQL UDF registration, and RDD fundamentals including RDD-to-DataFrame conversion.**
