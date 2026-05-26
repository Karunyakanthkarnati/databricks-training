--String Length Functions
--Q1.Find the length of full_name.
select full_name, LENGTH(full_name) as length_of_bytes
from employees

--Q2.Find character length of full_name.
select full_name, CHAR_LENGTH(full_name) as no_of_characters
from employees

--Q3.Compare LENGTH() and CHAR_LENGTH() outputs.
select full_name,LENGTH(full_name)as length_of_bytes, CHAR_LENGTH(full_name) as no_of_characters
from employees

--Case Conversion Functions
--Q4.Convert department into uppercase.
select emp_id,UPPER(department)
from employees

--Q5.Convert city into lowercase.
select emp_id,LOWER(city)
from employees

--Q6.Display employee names in uppercase.
select emp_id,UPPER(full_name)
from employees

--Space Handling Functions
--Q7.Remove leading and trailing spaces from full_name.
select emp_id,TRIM(full_name) as full_name
from employees

--Q8.Remove only leading spaces from full_name.
select emp_id,LTRIM(full_name) as full_name
from employees

--Q9.Remove only trailing spaces from full_name.
select emp_id,RTRIM(full_name) as full_name
from employees

--Q10.Remove all spaces from city.
select emp_id,TRIM(REPLACE(city,' ','')) as city
from employees

--String Joining Functions
--Q11.Concatenate full_name and department.
select emp_id,CONCAT(full_name,'-',department) as emp_details
from employees

--Q12.Concatenate emp_id, full_name, and city using separator.
select CONCAT_WS('->',emp_id,full_name,city) as emp_details
from employees

--Q13.Display employee details in single formatted string.
select CONCAT('Hi this is ',full_name,' from ',city,' in ',department,' department with salary ',salary) as emp_details
from employees

--String Extraction Functions
--Q14.Extract first 7 characters from email.
select emp_id, SUBSTR(email,1,7) as first_7
from employees

--Q15.Extract first 5 characters using SUBSTR().
select emp_id, SUBSTR(full_name,1,5) as first_5
from employees

--Q16.Extract first 4 characters from full_name.
select emp_id, LEFT(full_name,4) as first_4
from employees

--Q17.Extract last 3 characters from city.
select emp_id, RIGHT(city,3) as last_3
from employees

--Search Functions
--Q18.Find position of @ in email.
select emp_id, INSTR(email,'@') as pos_of_@
from employees

--Q19.Find position of . in email.
select emp_id, LOCATE('.',email) as pos
from employees

--String Modification Functions
--Q20.Replace Data with Big Data in department.
select emp_id, REPLACE(department,'Data','Big Data')
from employees

--Q21.Reverse full_name.
select full_name, REVERSE(full_name)
from employees

--Q22.Clean spaces from city using TRIM() and REPLACE().
select emp_id,TRIM(REPLACE(city,' ','')) as city
from employees

--Padding Functions
--Q23.Pad emp_id with zeros using LPAD().
select emp_id,LPAD(emp_id,5,0)
from employees

--Q24.Pad city with * using RPAD().
select emp_id,RPAD(city,15,'*')
from employees

--NULL Handling Functions
--Q25.Replace NULL remarks with 'No remarks'.
select emp_id,IFNULL(remarks,'No remarks')
from employees

--Q26.Return first non-NULL value using COALESCE().
select emp_id,COALESCE(remarks,salary,0)
from employees

--Q27.Display fallback value 'N/A' for NULL remarks.
select emp_id,COALESCE(remarks,'N/A')
from employees
