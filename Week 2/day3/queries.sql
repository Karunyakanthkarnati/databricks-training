--Q1.From the column mixed_value, extract the numeric characters that appear at the very beginning of the value.
--The extraction must stop as soon as a non-numeric character appears.
select regexp_substr(mixed_value,'^[0-9]+')
from regex_practice

--Q2.From the column mixed_value, extract the numeric characters that appear at the very end of the value.
--No alphabetic or special characters should be included.
select regexp_substr(mixed_value,'[0-9]+$')
from regex_practice

--Q3.From the column mixed_value, extract only the first single character of the value, regardless of
--whether it is a letter or a number.
select regexp_substr(mixed_value,'^[0-9A-Za-z]') as first_character
from regex_practice

--Q4.From the column mixed_value, extract only the last single character of the value.
select regexp_substr(mixed_value,'[0-9A-Za-z]$') as last_character
from regex_practice

--Q5.From the column mixed_value, extract exactly two consecutive numeric characters that appear
--anywhere in the value. Do not extract more or fewer than two digits
select regexp_substr(mixed_value,'[0-9]{2}') as consecutive_numbers
from regex_practice

--Q6.From the column mixed_value, extract exactly one numeric character that appears anywhere in the
--value.
select regexp_substr(mixed_value,'[0-9]') as one_number
from regex_practice

--Q7.From the column phone, extract the country code present at the beginning of the phone number.
--The extracted value must contain only the country code digits.
select regexp_substr(phone,'^\\+?[0-9]{1,3}(?=-)') as unique_numbers
from regex_practice

--Q8.From the column mixed_value, extract the numeric portion that is present between alphabetic
--characters.
select regexp_substr(mixed_value,'(?<=[A-Za-z])[0-9]+(?=[a-zA-Z])') as middle_numbers
from regex_practice

--Q9.From the column email, extract the text that appears before the at-symbol.
--The extracted value must not include the at-symbol itself.
select regexp_substr(email,'^[a-zA-Z0-9.-_]+(?=@)') as mail_name
from regex_practice

--Q10.From the column email, extract the text that appears after the at-symbol including the domain name.
select regexp_substr(email,'(?<=@)[a-zA-Z]+\\.[a-zA-Z]+') as mail_domain
from regex_practice

--Q11.From the column email, extract only the domain name without including the at-symbol.
select regexp_substr(email,'(?<=@)[a-zA-Z]+') as domain_name
from regex_practice

--Q12.From the column email, extract only the text that appears after the last dot in the email address
select regexp_substr(email,'[a-zA-Z]+$') as extension
from regex_practice

--Q13.From the column mixed_value, extract only alphabetic characters that appear together as a
--continuous sequence.
select regexp_substr(mixed_value,'[a-zA-Z]+') as cosecutive_alp
from regex_practice

--Q14.From the column mixed_value, extract only numeric characters that appear together as a continuous
--sequence.
select regexp_substr(mixed_value,'[0-9]+') as cosecutive_num
from regex_practice

--Q15.From the column full_text, extract exactly the first three characters of the value.
select regexp_substr(full_text,'^[A-Za-z0-9]{3}') as first_3
from regex_practice

--Q16.From the column full_text, extract exactly the last two characters of the value.
select regexp_substr(full_text,'[A-Za-z0-9]{2}$') as last_2
from regex_practice

--Q17.From the column full_text, extract the employee number portion that appears between the
--alphabetic prefix and the first underscore.
select regexp_substr(full_text,'(?<=[A-Za-z_-])[0-9]+(?=_)') as text
from regex_practice

--Q18.From the column full_text, extract the country code that appears at the end of the value.
select regexp_substr(full_text,'[0-9]+$') as country_code
from regex_practice

--Q19.From the column full_text, extract the alphabetic text that appears between two underscore
--characters.
select regexp_substr(full_text,'(?<=[_-])[A-Za-z]+(?=_)') as text
from regex_practice

--Q20.From the column phone, extract the numeric characters that appear immediately after the plus sign.
--The extraction must include only the digits that represent the country code.
select regexp_substr(phone,'^//+[0-9]+{1,3}') as code
from regex_practice
