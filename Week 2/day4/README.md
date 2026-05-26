🚀 Week 2 – Day 4: MySQL String Functions Practice

📚 Topics Covered
🔹 LENGTH / CHAR_LENGTH
🔹 UPPER / LOWER
🔹 TRIM / LTRIM / RTRIM
🔹 CONCAT / CONCAT_WS
🔹 SUBSTRING / SUBSTR / MID
🔹 LEFT / RIGHT
🔹 INSTR / LOCATE
🔹 REPLACE
🔹 REVERSE
🔹 LPAD / RPAD
🔹 IFNULL / COALESCE
🔹 FIND_IN_SET

🗂️ Table Used
🧪 employees

| Column Name | Data Type |
|-------------|------------|
| emp_id | INT |
| full_name | VARCHAR |
| email | VARCHAR |
| department | VARCHAR |
| city | VARCHAR |
| salary | VARCHAR |
| remarks | VARCHAR |

⚙️ Setup Queries
🏗️ 1 CREATE TABLE query
➕ 1 INSERT INTO query
📥 5 sample employee rows

🧠 String Function Concepts Learned

🔹 LENGTH() / CHAR_LENGTH()

```sql
LENGTH(full_name)
CHAR_LENGTH(full_name)
````

Returns number of characters in a string.

---

🔹 UPPER() / LOWER()

```sql
UPPER(department)
LOWER(city)
```

Converts text into uppercase and lowercase.

---

🔹 TRIM() / LTRIM() / RTRIM()

```sql
TRIM(full_name)
LTRIM(full_name)
RTRIM(full_name)
```

Removes unwanted spaces.

---

🔹 CONCAT() / CONCAT_WS()

```sql
CONCAT(full_name,' - ',department)

CONCAT_WS(' | ', emp_id, full_name, city)
```

Combines multiple strings together.

---

🔹 SUBSTRING() / SUBSTR() / MID()

```sql
SUBSTRING(email,1,7)
SUBSTR(email,1,5)
```

Extracts part of a string.

---

🔹 LEFT() / RIGHT()

```sql
LEFT(full_name,4)
RIGHT(city,3)
```

Extracts characters from left or right side.

---

🔹 INSTR() / LOCATE()

```sql
INSTR(email,'@')
LOCATE('.',email)
```

Finds position of substring.

---

🔹 REPLACE()

```sql
REPLACE(department,'Data','Big Data')
```

Replaces matching text.

---

🔹 REVERSE()

```sql
REVERSE(full_name)
```

Reverses string characters.

---

🔹 LPAD() / RPAD()

```sql
LPAD(emp_id,5,'0')
RPAD(city,15,'*')
```

Adds padding characters.

---

🔹 IFNULL() / COALESCE()

```sql
IFNULL(remarks,'No remarks')

COALESCE(remarks,'N/A')
```

Handles NULL values.

---

🔹 FIND_IN_SET()

```sql
FIND_IN_SET('Analytics','Data,Analytics,AI')
```

Searches values in comma-separated lists.

💻 Main String Syntax Used

```sql
SUBSTRING(column,start,length)
```

```sql
CONCAT(value1,value2)
```

```sql
REPLACE(column,'old','new')
```

📝 Practice Questions

🔹 Find employee name length
🔹 Convert department names to uppercase
🔹 Convert city names to lowercase
🔹 Remove spaces using TRIM
🔹 Remove left-side spaces
🔹 Remove right-side spaces
🔹 Concatenate employee name and department
🔹 Concatenate values using separators
🔹 Extract first characters from email
🔹 Extract left-side characters
🔹 Extract right-side characters
🔹 Find @ symbol position
🔹 Find . position in email
🔹 Replace Data with Big Data
🔹 Reverse employee names
🔹 Pad employee IDs using LPAD
🔹 Pad city names using RPAD
🔹 Handle NULL remarks using IFNULL
🔹 Handle NULL values using COALESCE
🔹 Search values using FIND_IN_SET

📊 Key Learnings
Learned core MySQL string manipulation functions.
Practiced string cleaning and formatting.
Understood substring extraction techniques.
Learned text searching and replacement operations.
Worked with NULL handling functions.
Practiced real-world string transformation queries.

✅ Outcome
Completed hands-on practice with MySQL string functions, data cleaning, text formatting, extraction techniques, and real-world string manipulation scenarios.

```
```
