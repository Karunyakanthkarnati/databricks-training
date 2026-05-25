# 🚀 Week 2 – Day 3: MySQL REGEX Foundations & Practice

## 📚 Topics Covered
- 🔢 Digit Extraction
- 🔤 Alphabet Extraction
- 🎯 Start of String `^`
- 🏁 End of String `$`
- 🔢 Exact Character Matching `{ }`
- ➕ Continuous Matching `+`
- 🔄 Regex Continuity Principle
- 📧 Email Regex Extraction
- 📱 Phone Number Regex
- 🧹 REPLACE() with REGEX
- ✅ Email Validation using REGEX

---

# 🗂️ Table Used

## 🧪 regex_practice

| Column Name | Data Type |
|---|---|
| id | INT |
| full_text | VARCHAR |
| email | VARCHAR |
| phone | VARCHAR |
| mixed_value | VARCHAR |

---

# ⚙️ Setup Queries
- 🏗️ 1 CREATE TABLE query
- ➕ 1 INSERT INTO query
- 📥 40 regex-rich sample rows

---

# 🧠 REGEX Concepts Learned

## 🔹 Extract Digits
```sql
[0-9]


Matches digits from 0–9.

---

## 🔹 Extract Alphabets

```sql
[A-Za-z]
```

Matches uppercase and lowercase alphabets.

---

## 🔹 Start of String `^`

```sql
^[0-9]
```

Checks whether string starts with a digit.

---

## 🔹 End of String `$`

```sql
[0-9]$
```

Checks whether string ends with a digit.

---

## 🔹 Exact Count `{ }`

```sql
[0-9]{2}
```

Extracts exactly 2 digits.

---

## 🔹 Continuous Matching `+`

```sql
[0-9]+
```

Extracts continuous digits.

---

## 🔹 Regex Continuity Principle

Regex always extracts continuous matching values and stops when pattern breaks.

---

## 🔹 Email Extraction

```sql
@[a-zA-Z.]+
```

Extracts domain part from email.

---

## 🔹 Top-Level Domain Extraction

```sql
\.[a-zA-Z]+$
```

Extracts `.com`, `.in`, `.ai`, etc.

---

## 🔹 Escaping Reserved Characters

Reserved symbols:

```text
+ . ^ $
```

Need escape character:

```sql
\
```

Example:

```sql
\+91-[0-9]{10}
```

---

## 🔹 Email Validation Regex

```sql
[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,3}
```

---

# 💻 Main REGEX Syntax Used

## REGEXP_SUBSTR()

Used to extract matching text.

Example:

```sql
SELECT REGEXP_SUBSTR(mixed_value,'[0-9]+')
FROM regex_practice;
```

---

# 📝 Practice Questions

## 🔹 Basic Extraction

* Extract digits
* Extract alphabets
* Extract first/last characters
* Extract exact digit counts

---

## 🔹 Start & End Matching

* Start with digit
* End with digit
* Beginning extraction
* Ending extraction

---

## 🔹 Email Regex

* Username extraction
* Domain extraction
* Top-level domain extraction
* Email validation

---

## 🔹 Phone Regex

* Country code extraction
* Digits after `+`
* Phone validation

---

## 🔹 full_text Extraction

* Extract prefixes
* Extract employee numbers
* Extract country codes
* Extract text between underscores

---

# 📊 Key Learnings

* Learned REGEX foundations and pattern matching.
* Understood regex symbols and reserved characters.
* Practiced continuous matching principles.
* Learned extraction using `REGEXP_SUBSTR()`.
* Worked with email and phone validation.
* Practiced real-world regex extraction scenarios.

---

# ✅ Outcome

Completed hands-on practice with MySQL REGEX foundations, extraction techniques, validation logic, and real-world pattern matching scenarios.


