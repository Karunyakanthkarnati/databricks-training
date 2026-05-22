--Date and Time Functions
--Q1.Write a query to display the current date.
select CURDATE() or select current_time()

--Q2.Write a query to display the current time.
select CURTIME()  or select current_time()

--Q3.Write a query to display the current date and time together.
select now()  or  select current_timestamp()

--Q4.Extract the year from order_date
select year(order_date) as order_year
from orders

--Q5.Extract the month from order_date.
select Month(order_date) as order_month
from orders

--Q6.Extract the day from order_date.
select day(order_date) as order_day
from orders

--Q7.Use EXTRACT() to get the year from order_date
select extract(year from order_date) as order_year
from orders

--Q8.Display the month name for each order.
select MONTHNAME(order_date) as month_name
from orders

--Q9.Display the weekday name for each order
select DAYNAME(order_date) as weekday_name
from orders

--Q10.Find the weekday number using WEEKDAY()
select WEEKDAY(order_date) as week_number
from orders

--Q11.Find the day number using DAYOFWEEK()
select DAYOFWEEK(order_date) as week_number
from orders

--Q12.Find all orders placed on weekends.
select order_id,order_date
from orders
where weekday(order_date) in (5,6)

--Q13.Find all orders placed on weekdays
select order_id,order_date
from orders
where dayofweek(order_date) BETWEEN 2 AND 6

--Q14.Add 5 days to each order_date.
select order_date,DATE_ADD(order_date,INTERVAL 5 DAY)
from orders

--Q15.Subtract 3 days from each order_date.
select order_date,DATE_SUB(order_date,INTERVAL 3 DAY)
from orders

--Q16.Add 1 month to each order_date.
select order_date,DATE_ADD(order_date,INTERVAL 1 MONTH)
from orders

--Q17.Subtract 2 months from each order_date.
select order_date,DATE_SUB(order_date,INTERVAL 2 MONTH)
from orders

--Q18.Add 1 year to each order_date
select order_date,DATE_ADD(order_date,INTERVAL 1 year)
from orders

--Q19.Find the number of days between order_date and delivery_date.
select order_date,delivery_date,DATEDIFF(delivery_date,order_date) as delivery_days
from orders

--Q20.Find the difference in months between order_date and delivery_date.
select order_date,delivery_date,TIMESTAMPDIFF(month,delivery_date,order_date) as months_diff
from orders

--Q21.Display the last day of the month for each order date
select order_id,order_date,Last_day(order_date)
from orders

--Q22.Display the first day of the month for each order date.
select order_id,order_date,DATE_SUB(order_date,INTERVAL day(order_date)-1 day) as First_day
from orders

--Q23.Format order_date as DD-MM-YYYY
select order_date,Date_Format(order_date, '%d-%m-%Y')
from orders

--Q24.Format order_date as Month DD, YYYY.
select order_date,Date_Format(order_date, '%M %d, %Y')
from orders
