# 🚀 Week 5 – Day 5: PySpark Date Functions

## 📌 Topics Covered

* `current_date()`
* `date_format()`
* `to_date()`
* `datediff()`
* `months_between()`
* `add_months()`
* `date_add()`
* Date extraction functions

---

## 🔹 Current Date & Date Formatting

PySpark provides built-in functions to work with dates and format them as required.

```python
from pyspark.sql.functions import *

df = spark.range(3)

df = df.withColumn(
    "currdate",
    current_date()
)

df.show()
```

A date can be formatted using `date_format()`:

```python
df = df.withColumn(
    "formatted_date",
    date_format("currdate", "dd.MM.yyyy")
)
```

`date_format()` returns the formatted value as a **string**.

---

## 🔹 Converting to Date

`to_date()` converts a string or timestamp column into Spark's `DateType`.

```python
df = df.withColumn(
    "date",
    to_date("date_string", "yyyy-MM-dd")
)
```

---

## 🔹 Date Difference Functions

### Difference Between Dates

```python
df.withColumn(
    "datediff",
    datediff(df.end, df.start)
).show()
```

`datediff()` returns the number of days between two dates.

### Difference Between Months

```python
df.withColumn(
    "months_between",
    months_between(df.end, df.start)
).show()
```

---

## 🔹 Adding Dates & Months

```python
df.withColumn(
    "add_months",
    add_months(df.start, 4)
).show()
```

```python
df.withColumn(
    "date_add",
    date_add(df.end, 15)
).show()
```

These functions are useful for performing date arithmetic.

---

## 🔹 Extracting Date Components

PySpark provides several functions to extract specific information from dates:

| Function       | Purpose                      |
| -------------- | ---------------------------- |
| `year()`       | Extracts year                |
| `month()`      | Extracts month               |
| `dayofmonth()` | Extracts day of month        |
| `dayofweek()`  | Extracts day of week         |
| `dayofyear()`  | Extracts day of year         |
| `weekofyear()` | Extracts week number of year |

Example:

```python
df.withColumn("year", year(df.start)) \
  .withColumn("month", month(df.start)) \
  .withColumn("day", dayofmonth(df.start)) \
  .show()
```

---

## 🔑 Key Takeaways

* Learned how to get and format dates in PySpark.
* Practiced converting values into `DateType`.
* Calculated differences between dates and months.
* Added days and months to existing dates.
* Extracted year, month, day, week, and other date components.

---

⭐ **Week 5 – Day 5 completed: Practiced essential PySpark date manipulation, formatting, arithmetic, and extraction functions.**
