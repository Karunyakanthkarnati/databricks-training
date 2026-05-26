🚀 Week 2 – Day 4: MySQL String Functions Practice

📚 Topics Covered
🔠 Case Conversion Functions
✂️ String Trimming Functions
🔗 String Concatenation
📌 Substring Extraction
⬅️ LEFT() Extraction
➡️ RIGHT() Extraction
📍 String Position Functions
🔄 String Replacement
🔁 String Reversal
🧱 Padding Functions
🧹 Combined String Cleaning
❓ NULL Handling Functions
📋 CSV Search Function

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
Returns number of characters in a string.

```sql
LENGTH(full_name)
CHAR_LENGTH(full_name)
````

🔹 UPPER() / LOWER()

```sql
UPPER(department)
LOWER(city)
```

Converts text into uppercase or lowercase.

🔹 TRIM() / LTRIM() / RTRIM()

```sql
TRIM(full_name)
LTRIM(full_name)
RTRIM(full_name)
```

Removes spaces from strings.

🔹 CONCAT()

```sql
CONCAT(full_name,' - ',department)
```

Combines multiple strings.

🔹 CONCAT_WS()

```sql
CONCAT_WS(' | ', emp_id, full_name, city)
```

Concatenates strings using separators.

🔹 SUBSTRING() / SUBSTR()

```sql
SUBSTRING(email,1,7)
SUBSTR(email,1,5)
```

Extracts part of a string.

🔹 LEFT() / RIGHT()

```sql
LEFT(full_name,4)
RIGHT(city,3)
```

Extracts characters from left or right side.

🔹 INSTR()

```sql
INSTR(email,'@')
```

Finds position of substring.

🔹 LOCATE()

```sql
LOCATE('.',email)
```

Searches substring position with flexibility.

🔹 REPLACE()

```sql
REPLACE(department,'Data','Big Data')
```

Replaces matching text.

🔹 REVERSE()

```sql
REVERSE(full_name)
```

Reverses string characters.

🔹 LPAD() / RPAD()

```sql
LPAD(emp_id,5,'0')
RPAD(city,15,'*')
```

Adds padding characters.

🔹 Combined Cleaning

```sql
TRIM(REPLACE(city,' ',''))
```

Used for advanced string cleaning.

🔹 IFNULL()

```sql
IFNULL(remarks,'No remarks')
```

Handles NULL values.

🔹 COALESCE()

```sql
COALESCE(remarks,'N/A')
```

Returns first non-NULL value.

🔹 FIND_IN_SET()

```sql
FIND_IN_SET('Analytics','Data,Analytics,AI')
```

Searches values in comma-separated lists.

💻 Main String Syntax Used

String extraction:

```sql
SUBSTRING(column,start,length)
```

Concatenation:

```sql
CONCAT(value1,value2)
```

Replacement:

```sql
REPLACE(column,'old','new')
```

📝 Practice Questions

🔹 String Length
Find employee name length
Find character length

🔹 Case Conversion
Convert department to uppercase
Convert city to lowercase

🔹 Trimming Functions
Remove left spaces
Remove right spaces
Remove spaces from both sides

🔹 Concatenation
Combine employee name and department
Concatenate using separators

🔹 Substring Extraction
Extract first characters
Extract partial email values
Extract left/right characters

🔹 Position Functions
Find @ symbol position
Find . position in emails

🔹 Replacement & Reverse
Replace department names
Reverse employee names

🔹 Padding Functions
Pad employee IDs
Pad city names

🔹 NULL Handling
Handle NULL remarks
Use default values with COALESCE

🔹 CSV Search
Search values inside comma-separated strings

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
