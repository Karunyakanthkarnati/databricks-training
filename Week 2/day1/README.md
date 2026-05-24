# 🚀 Day 7 – SQL NULL Functions Practice

## 📚 Topics Covered
- ⚠️ NULL Handling
- 🔍 IS NULL
- 🔍 IS NOT NULL
- 🔄 IFNULL() / ISNULL()
- 🎯 COALESCE()
- 🚫 NULLIF()
- 🧮 NULL Handling in Calculations
- 📊 Real-Time NULL Scenarios

---

# 🗂️ Tables Used

## 👨‍💼 1. Employees

| Column Name | Data Type |
|---|---|
| emp_id | INT |
| name | VARCHAR |
| salary | INT |
| bonus | INT |
| manager_id | INT |

---

## 📦 2. Orders

| Column Name | Data Type |
|---|---|
| order_id | INT |
| customer_name | VARCHAR |
| amount | INT |
| discount | INT |
| coupon_code | VARCHAR |

---

## 🛒 3. Products

| Column Name | Data Type |
|---|---|
| product_id | INT |
| product_name | VARCHAR |
| price | INT |
| category | VARCHAR |
| stock | INT |

---

# ⚙️ Setup Queries
- 🏗️ 3 CREATE TABLE queries
- ➕ 3 INSERT INTO queries

---

# 🧠 NULL Concepts Learned

## 🔹 IS NULL
Used to check NULL values.

Example:
```sql
WHERE salary IS NULL
````

---

## 🔹 IS NOT NULL

Used to filter non-null values.

Example:

```sql
WHERE discount IS NOT NULL
```

---

## 🔹 IFNULL()

Replaces NULL with a default value.

Example:

```sql
IFNULL(salary, 0)
```

---

## 🔹 COALESCE()

Returns the first non-null value.

Example:

```sql
COALESCE(salary, bonus, 0)
```

---

## 🔹 NULLIF()

Returns NULL if two values are equal.

Example:

```sql
NULLIF(discount, 0)
```

---

# 📝 Practice Questions

## 🔹 Level 1 – Basic NULL Handling

* Employees with NULL salary
* Orders with NOT NULL discount
* Products with NULL category
* Employees with NULL manager_id

---

## 🔹 Level 2 – IFNULL()

* Replace NULL salary with 0
* Replace NULL bonus with 1000
* Replace NULL amount with 500
* Replace NULL stock with 0

---

## 🔹 Level 3 – COALESCE()

* Salary → bonus fallback
* Multiple fallback values
* Product price default handling
* Customer payment logic

---

## 🔹 Level 4 – NULLIF()

* Convert 0 values into NULL
* Prevent divide-by-zero errors
* Coupon code replacement

---

## 🔹 Level 5 – Real-Time Scenarios

* Salary + bonus calculations
* Multiple NULL condition checks
* Products with partial NULL data
* Orders with missing values

---

## 🔹 Level 6 – Advanced

* Advanced COALESCE usage
* NULLIF in calculations
* Final payable amount calculation
* Conditional NULL filtering

---

# 📊 Key Learnings

* Learned how SQL handles NULL values.
* Practiced filtering NULL and NOT NULL records.
* Understood default value replacement using IFNULL().
* Learned fallback logic using COALESCE().
* Used NULLIF() for conditional NULL conversion.
* Handled NULL values in calculations and real-world scenarios.

---

# ✅ Outcome

Completed hands-on practice with SQL NULL functions, NULL handling techniques, conditional replacements, and real-world database scenarios.

```
```
