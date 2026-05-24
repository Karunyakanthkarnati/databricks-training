--Q1.Show all employees whose salary is NULL
select emp_id,name
from Employees
where salary is null

--Q2.Display all orders where discount is NOT NULL.
select order_id
from Orders
where discount is not null

--Q3.Retrieve products where category is NULL.
 select product_id,product_name
from Products
where category is NULL

--Q4.Count employees whose manager_id is NULL.
select count(emp_id)
from Employees
where manager_id is NULL

--Q5.Replace NULL salary values with 0.
select emp_id,IFNULL(salary,0)
from Employees

--Q6.Replace NULL bonus values with 1000.
select emp_id,IFNULL(bonus,1000)
from Employees

--Q7.Display order amount, replacing NULL with 500.
select order_id,IFNULL(amount,500)
from Orders

--Q8.Replace NULL stock values with 0.
select product_id,IFNULL(stock,0)
from Products

--Q9.Show employee earnings using salary; if salary is NULL, use bonus.
select emp_id,coalesce(salary,bonus)
from Employees

--Q10.Display the first available value among salary, bonus, and 0.
select coalesce(salary,bonus,0)
from Employees

--Q11.Display product prices, replacing NULL with 1000.
select coalesce(price,0)
from Products

--Q12.Show customer payment using amount, discount, or 0.
select coalesce(amount,discount,0) as payment
from Orders

--Q13.Convert salary to NULL if salary = 0.
select emp_id, NULLIF(salary,0)
from Employees

--Q14.Convert discount to NULL if discount = 0.
select order_id, NULLIF(discount,0)
from Orders

--Q15.Prevent divide-by-zero while calculating:
--amount / discount
select order_id, amount/NULLIF(discount,0)
from Orders

--Q16.Replace coupon_code with NULL if it is 'DISC10'.
select order_id, NULLIF(coupon_code,'DISC10')
from Orders

--Q17.Calculate total earnings:salary + bonus
--while handling NULL properly.
select emp_id, sum(IFNULL(salary,0))+sum(IFNULL(bonus,0)) as Total_earnings
from Employees
group by emp_id

--Q18.Display employees where both salary and bonus are NULL.
select emp_id,name
from Employees
where salary is NULL AND bonus is NULL

--Q19.Show products where price is NULL but category is NOT NULL
select product_id,product_name
from Products
where price is NULL  AND category is not NULL

--Q20.Display orders where both amount and discount are NULL.
select order_id
from Orders
where amount is NULL  AND discount is NULL

--Q21.Display employee income using:
--COALESCE(salary, bonus, 1000)
select emp_id,COALESCE(salary, bonus, 1000) as Employee_Income
from Employees

--Q22.Replace discount value 0 with NULL using NULLIF.
select order_id,NULLIF(discount,0)
from Orders

--Q23.Calculate final payable amount:amount - discount
--while handling NULL values.
select order_id,IFNULL(amount,0)-IFNULL(discount,0) as total_payable
from Orders

--Q24.Find employees where salary is NULL but manager exists.
select emp_id,name
from Employees
where salary is NULL and manager_id is not NULL
