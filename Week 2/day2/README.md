# 🚀 Week 2 – Day 2: MySQL Number Manipulation Functions

## 📚 Topics Covered
- 🔢 ABS()
- 🎯 ROUND()
- ⬆️ CEIL() / CEILING()
- ⬇️ FLOOR()
- ✂️ TRUNCATE()
- ➗ MOD()
- 💥 POWER() / POW()
- 📐 SQRT()
- ➕ SIGN()
- 🎲 RAND()
- 🧾 FORMAT()
- 📈 GREATEST()
- 📉 LEAST()

---

# 🗂️ Table Used

## 👨‍💼 employee_salary

| Column Name | Data Type |
|---|---|
| emp_id | INT |
| emp_name | VARCHAR |
| base_salary | DECIMAL |
| bonus | DECIMAL |
| tax_percent | DECIMAL |
| experience_years | INT |

---

# ⚙️ Setup Queries
- 🏗️ 1 CREATE TABLE query
- ➕ 1 INSERT INTO query

---

# 🧠 Numeric Concepts Learned

## 🔹 ABS()
Returns absolute value.

Example:
```sql
SELECT ABS(-100);
````

## 🔹 ROUND()

Rounds numbers to specified decimal places.

Example:

```sql
ROUND(base_salary, 2)
```

---

## 🔹 CEIL() / CEILING()

Rounds value upward.

Example:

```sql
CEIL(base_salary)
```

---

## 🔹 FLOOR()

Rounds value downward.

Example:

```sql
FLOOR(base_salary)
```

---

## 🔹 TRUNCATE()

Removes decimal places without rounding.

Example:

```sql
TRUNCATE(base_salary, 1)
```

---

## 🔹 MOD()

Returns remainder after division.

Example:

```sql
MOD(experience_years, 2)
```

---

## 🔹 POWER() / POW()

Calculates exponent values.

Example:

```sql
POWER(2,3)
```

---

## 🔹 SQRT()

Returns square root.

Example:

```sql
SQRT(64)
```

---

## 🔹 SIGN()

Returns:

* 1 → positive
* 0 → zero
* -1 → negative

Example:

```sql
SIGN(base_salary)
```

---

## 🔹 RAND()

Generates random number.

Example:

```sql
RAND()
```

---

## 🔹 FORMAT()

Formats numbers as string values.

Example:

```sql
FORMAT(base_salary,2)
```

⚠️ Note:
FORMAT() returns STRING output.

---

## 🔹 GREATEST()

Returns maximum value among arguments.

Example:

```sql
GREATEST(base_salary, IFNULL(bonus,0))
```

---

## 🔹 LEAST()

Returns minimum value among arguments.

Example:

```sql
LEAST(base_salary, IFNULL(bonus,0))
```

---

# 📝 Practice Questions

## 🔹 Basic Numeric Functions

* Absolute value calculation
* Rounding salary values
* Ceiling and floor operations
* Decimal truncation

---

## 🔹 Mathematical Functions

* Modulus/remainder calculation
* Power and exponent operations
* Square root calculation
* Sign checking
* Random number generation

---

## 🔹 Formatting Functions

* Formatting numeric values
* Salary formatting with decimals
* String-based numeric formatting

---

## 🔹 Comparison Functions

* Finding maximum values
* Finding minimum values
* Comparing salary and bonus values
* Handling NULL values in comparisons

---

# 📊 Key Learnings

* Learned MySQL numeric and mathematical functions.
* Practiced rounding and decimal handling techniques.
* Understood mathematical operations in SQL.
* Learned number formatting functions.
* Practiced comparison functions using salary and bonus data.
* Worked with NULL-safe numeric calculations.

---

# ✅ Outcome

Completed hands-on practice with MySQL Number Manipulation Functions, mathematical calculations, formatting techniques, and salary-based real-world scenarios.

```
```
