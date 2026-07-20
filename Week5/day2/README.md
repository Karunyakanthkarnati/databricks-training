# 🚀 Week 5 – Day 2: PySpark DataFrame Utility Functions

## 📌 Overview

In Week 5 Day 2, I practiced important PySpark DataFrame utility functions used for handling missing values, generating data, sampling records, and retrieving DataFrame rows.

### Topics Covered

* `fillna()` / `fill()`
* `sample()`
* `spark.range()`
* `collect()`

---

# 1️⃣ fillna() & fill()

The `fillna()` function is used to replace **NULL or missing values** in a PySpark DataFrame.

`fill()` is an alias for `fillna()`, so both can be used for the same purpose.

### Syntax

```python
df.fillna(value, subset=None)
```

or

```python
df.na.fill(value)
```

### Create Sample DataFrame

```python
data = [
    (1, "ravi", None, "IT"),
    (2, "raj", 5000, None),
    (3, "ram", 6000, "HR"),
    (4, None, 7000, "IT"),
    (5, "raj", 8000, None),
    (6, "ram", 9000, "HR")
]

schema = ["id", "name", "salary", "dept"]

df = spark.createDataFrame(data, schema)

df.show()
```

### Fill NULL Numeric Values

```python
df.fillna(0).show()
```

This replaces NULL values in compatible **numeric columns** with `0`.

### Fill NULL String Values

```python
df.fillna("unknown").show()
```

This replaces NULL values in compatible **string columns** with `"unknown"`.

### Fill NULL Values in a Specific Column

```python
df.fillna(0, subset=["salary"]).show()
```

Only NULL values in the `salary` column are replaced with `0`.

### Fill String NULL Values in a Specific Column

```python
df.fillna("unknown", ["dept"]).show()
```

Only NULL values in the `dept` column are replaced with `"unknown"`.

### Using `na.fill()`

```python
df.na.fill(0).show()
```

`na.fill()` provides another way to replace NULL values.

---

# 2️⃣ sample()

The `sample()` function is used to randomly select a fraction of rows from a PySpark DataFrame.

It is useful when working with large datasets and only a smaller sample is required for testing or analysis.

### Syntax

```python
df.sample(
    withReplacement=False,
    fraction=value,
    seed=None
)
```

### Parameters

* `withReplacement` – Specifies whether a row can be selected multiple times.
* `fraction` – Approximate fraction of rows to sample.
* `seed` – Used to generate reproducible sampling results.

### Example

```python
df.sample(False, 0.5).show()
```

This randomly samples approximately **50% of the rows without replacement**.

---

## 🎯 Sampling with a Seed

A seed can be used when we want reproducible sampling results.

```python
df2 = df1.sample(
    fraction=0.1,
    seed=1002
)

df3 = df1.sample(
    fraction=0.1,
    seed=1002
)

display(df2)
display(df3)
```

Since both operations use the **same seed**, they produce the same sampled rows when applied to the same DataFrame.

> `fraction=0.1` means each row has approximately a 10% chance of being selected. It does **not guarantee exactly 10% of the rows**.

---

# 3️⃣ spark.range()

`spark.range()` is used to create a PySpark DataFrame containing a sequence of numbers.

The generated DataFrame contains a single column named:

```text
id
```

### Syntax

```python
spark.range(start, end, step, numPartitions=None)
```

### Parameters

* `start` – Starting value.
* `end` – Ending value (**exclusive**).
* `step` – Difference between consecutive values.
* `numPartitions` – Optional number of partitions.

### Example 1

```python
spark.range(5).show()
```

Output values:

```text
0
1
2
3
4
```

The ending value `5` is excluded.

### Example 2

```python
spark.range(2, 10, 2).show()
```

Output values:

```text
2
4
6
8
```

---

## Creating a Range from 1 to 100

```python
df1 = spark.range(
    start=1,
    end=101
)

df1.show()
```

This creates **100 rows**, containing values from:

```text
1 to 100
```

The `end` value `101` is excluded.

---

## Combining `range()` and `sample()`

```python
df1 = spark.range(
    start=1,
    end=101
)

df1.sample(
    fraction=0.1
).show()
```

Here:

* `range()` generates values from `1` to `100`.
* `sample()` randomly selects approximately `10%` of those rows.

---

# 4️⃣ collect()

The `collect()` function retrieves **all rows of a PySpark DataFrame and returns them to the driver as a Python list of `Row` objects**.

### Syntax

```python
df.collect()
```

### Create Sample DataFrame

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

### Collect All Rows

```python
listrows = df.collect()

print(listrows)
```

The result is stored as a Python list containing PySpark `Row` objects.

Example structure:

```text
[
    Row(id=1, name='ravi', salary=5000),
    Row(id=2, name='raj', salary=6000),
    ...
]
```

---

## Accessing Rows from `collect()`

### Access First Row

```python
print(listrows[0])
```

Example:

```text
Row(id=1, name='ravi', salary=5000)
```

### Access a Specific Value

```python
print(listrows[1][2])
```

Here:

```text
listrows[1]
```

selects the **second row**, and:

```text
[2]
```

selects the **third column (`salary`)**.

Output:

```text
6000
```

---

# ⚠️ Important Note About collect()

`collect()` brings **all DataFrame rows from Spark executors to the driver machine**.

Therefore, it should be used carefully with large datasets.

```python
df.collect()
```

is suitable for **small datasets**, but collecting millions of rows can consume large amounts of driver memory and may cause memory issues.

---

# 🔑 Key Takeaways

| Function        | Purpose                                                   |
| --------------- | --------------------------------------------------------- |
| `fillna()`      | Replaces NULL or missing values                           |
| `fill()`        | Alias for `fillna()`                                      |
| `na.fill()`     | Another way to fill NULL values                           |
| `sample()`      | Randomly samples rows from a DataFrame                    |
| `seed`          | Makes random sampling reproducible                        |
| `spark.range()` | Generates a DataFrame containing a sequence of numbers    |
| `collect()`     | Returns all DataFrame rows to the driver as a Python list |

---

## 📚 What I Learned

* How to handle NULL values using `fillna()` and `na.fill()`.
* How to replace missing values in specific columns.
* How to randomly sample DataFrame rows using `sample()`.
* How `seed` helps generate reproducible samples.
* How to generate sequential data using `spark.range()`.
* How the `end` value in `range()` is exclusive.
* How to retrieve DataFrame rows using `collect()`.
* How to access individual rows and values after collecting data.
* Why `collect()` should be used carefully with large datasets.

---

## 🛠️ Technologies Used

* Python
* PySpark
* Apache Spark
* Databricks

---

⭐ **Week 5 – Day 2 completed: Practiced PySpark DataFrame utility functions for NULL handling, random sampling, range generation, and collecting data to the driver.**
