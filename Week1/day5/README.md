# Day 5 – MySQL Date & Timestamp Functions

## Topics Covered
- Current Date & Time Functions
- Date & Timestamp Data Types
- Extracting Year, Month, Day
- EXTRACT() Function
- Month & Day Names
- WEEKDAY() vs DAYOFWEEK()
- Identifying Weekends & Weekdays
- Date Arithmetic
- DATEDIFF()
- TIMESTAMPDIFF()
- LAST_DAY()
- First Day of Month Logic
- DATE_FORMAT()
- STR_TO_DATE()
- Timestamp Formatting
- Filtering by Month
- Financial Year Logic using CASE
- Real-Time Business Queries

---

## Database Used
### Table: `orders`

The practice was performed using a single table named `orders`.

### Columns
| Column Name | Data Type |
|---|---|
| order_id | INT |
| customer_name | VARCHAR |
| order_date | DATE |
| order_timestamp | TIMESTAMP |
| delivery_date | DATE |
| order_amount | DECIMAL |

---

## Queries Practiced
Total Queries Practiced: **~33**

### Main Functions Used
- `CURDATE()`
- `CURTIME()`
- `NOW()`
- `YEAR()`
- `MONTH()`
- `DAY()`
- `EXTRACT()`
- `MONTHNAME()`
- `DAYNAME()`
- `WEEKDAY()`
- `DAYOFWEEK()`
- `DATE_ADD()`
- `DATE_SUB()`
- `DATEDIFF()`
- `TIMESTAMPDIFF()`
- `LAST_DAY()`
- `DATE_FORMAT()`
- `STR_TO_DATE()`

---

## Key Learnings
- Learned how to work with MySQL date and timestamp values.
- Understood date extraction and formatting techniques.
- Practiced adding/subtracting days, months, and years.
- Learned to identify weekdays and weekends.
- Used date functions in real-world business scenarios.
- Implemented financial year calculation using CASE statements.

---

## Real-Time Use Cases Practiced
- Orders placed today
- Orders from the last 7 days
- Delivery duration calculation
- Month-based filtering
- Financial year generation

---

## Outcome
Completed hands-on practice with MySQL Date & Timestamp Functions using real-world order management examples.
