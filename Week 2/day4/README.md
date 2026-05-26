# 🚀 Week 2 – Day 4: MySQL String Functions

## 📚 Topics Covered
- 🔢 LENGTH()
- 🔠 CHAR_LENGTH()
- 🔡 UPPER()
- 🔡 LOWER()
- ✂️ TRIM()
- ⬅️ LTRIM()
- ➡️ RTRIM()
- 🔗 CONCAT()
- 🧩 CONCAT_WS()
- 📌 SUBSTRING() / SUBSTR() / MID()
- ⬅️ LEFT()
- ➡️ RIGHT()
- 📍 INSTR()
- 🔍 LOCATE()
- 🔄 REPLACE()
- 🔁 REVERSE()
- 🧱 LPAD()
- 🧱 RPAD()
- 🧹 Combined String Cleaning
- ❓ IFNULL()
- 🔄 COALESCE()
- 📋 FIND_IN_SET()

---

# 🗂️ Table Used

## 👨‍💼 employees

| Column Name | Data Type |
|---|---|
| emp_id | INT |
| full_name | VARCHAR |
| email | VARCHAR |
| department | VARCHAR |
| city | VARCHAR |
| salary | VARCHAR |
| remarks | VARCHAR |

---

# ⚙️ Setup Queries
- 🏗️ 1 CREATE TABLE query
- ➕ 1 INSERT INTO query

---

# 🧠 String Concepts Learned

## 🔹 LENGTH()
Returns number of bytes/characters.

Example:
```sql
SELECT LENGTH(full_name)
FROM employees;
````

---

## 🔹 CHAR_LENGTH()

Returns number of characters safely for multi-byte text.

Example:

```sql id="w4m9kp"
SELECT CHAR_LENGTH(full_name)
FROM employees;
```

---

## 🔹 UPPER() / LOWER()

Converts text into uppercase/lowercase.

Example:

```sql id="r7v2qx"
SELECT UPPER(department),
       LOWER(city)
FROM employees;
```

---

## 🔹 TRIM() / LTRIM() / RTRIM()

Removes unwanted spaces.

Example:

```sql id="m1q8vn"
SELECT TRIM(full_name)
FROM employees;
```

---

## 🔹 CONCAT()

Joins multiple strings.

Example:

```sql id="k5v3mw"
SELECT CONCAT(full_name,' - ',department)
FROM employees;
```

---

## 🔹 CONCAT_WS()

Concatenates strings using separator.

Example:

```sql id="t9m4qx"
SELECT CONCAT_WS(' | ',emp_id,full_name,city)
FROM employees;
```

---

## 🔹 SUBSTRING() / SUBSTR() / MID()

Extracts part of string.

Example:

```sql id="x2v7kp"
SELECT SUBSTRING(email,1,7)
FROM employees;
```

---

## 🔹 LEFT() / RIGHT()

Extract characters from left or right.

Example:

```sql id="u6m1qw"
SELECT LEFT(full_name,4),
       RIGHT(city,3)
FROM employees;
```

---

## 🔹 INSTR()

Returns position of substring.

Example:

```sql id="n8v5mx"
SELECT INSTR(email,'@')
FROM employees;
```

---

## 🔹 LOCATE()

Search substring position.

Example:

```sql id="y3q9kp"
SELECT LOCATE('.',email)
FROM employees;
```

---

## 🔹 REPLACE()

Replace part of string.

Example:

```sql id="q7m2vx"
SELECT REPLACE(department,'Data','Big Data')
FROM employees;
```

---

## 🔹 REVERSE()

Reverses string.

Example:

```sql id="p1v6mw"
SELECT REVERSE(full_name)
FROM employees;
```

---

## 🔹 LPAD() / RPAD()

Pads characters left or right.

Example:

```sql id="d5q8kn"
SELECT LPAD(emp_id,5,'0')
FROM employees;
```

---

## 🔹 Combined String Cleaning

Using multiple string functions together.

Example:

```sql id="s4v9qx"
SELECT TRIM(REPLACE(city,' ',''))
FROM employees;
```

---

## 🔹 IFNULL()

Handles NULL strings.

Example:

```sql id="j2m7kp"
SELECT IFNULL(remarks,'No remarks')
FROM employees;
```

---

## 🔹 COALESCE()

Returns first non-NULL value.

Example:

```sql id="h8q3mw"
SELECT COALESCE(remarks,'N/A')
FROM employees;
```

---

## 🔹 FIND_IN_SET()

Searches value in comma-separated list.

Example:

```sql id="f6v1qx"
SELECT FIND_IN_SET(
'Analytics',
'Data,Analytics,AI'
);
```

---

# 📝 Practice Areas

## 🔹 String Length Functions

* Character counting
* Byte length checking

---

## 🔹 Case Conversion

* Uppercase conversion
* Lowercase conversion

---

## 🔹 Space Handling

* Removing leading spaces
* Removing trailing spaces
* Full trimming

---

## 🔹 String Joining

* Concatenation
* Separator-based joining

---

## 🔹 String Extraction

* Extract substrings
* Left/right extraction

---

## 🔹 Search Functions

* Find character positions
* Search inside CSV values

---

## 🔹 String Modification

* Replace words
* Reverse strings
* Clean unwanted spaces

---

## 🔹 Padding Functions

* Left padding
* Right padding

---

## 🔹 NULL Handling

* Handle NULL strings safely
* Fallback values using COALESCE

---

# 📊 Key Learnings

* Learned important MySQL string manipulation functions.
* Practiced extraction and formatting techniques.
* Understood text cleaning and replacement functions.
* Worked with substring and search operations.
* Learned NULL-safe string handling.
* Practiced combining multiple string functions together.

---

# ✅ Outcome

Completed hands-on practice with MySQL String Functions including formatting, extraction, searching, cleaning, concatenation, padding, and NULL-safe string handling.

```
```
