--Q1.Find the absolute value of -100.
select abs(-100)

--Q2.Round base_salary to 0 decimal places.
select emp_id,round(base_salary,0)
from employee_salary

--Q3.Round base_salary to 2 decimal places.
select emp_id, ROUND(base_salary,2)
from employee_salary

--Q4.Round up base_salary using CEIL().
select emp_id, CEIL(base_salary) as salary
from employee_salary

--Q5.Round down base_salary using FLOOR().
select emp_id, FLOOR(base_salary) as salary
from employee_salary

--Q6.Truncate base_salary to 1 decimal place without rounding.
select emp_id, TRUNCATE(base_salary,1) as salary
from employee_salary

--Q7.Find the remainder when experience_years is divided by 2.
select emp_id, mod(experience_years,2) as remainder_years
from employee_salary

--Q8.Find the value of POWER(2,3)
select pow(2,3) --8

--Q9.Find the value of POW(5,2).
select pow(5,2)--25

--Q10.Find the square root of 64.
select sqrt(64)--8

--Q11.Display the sign of base_salary.
select emp_id,sign(base_salary)
from employee_salary

--Q12.Generate a random number using RAND().
select rand()

--Q13.Format base_salary with 2 decimal places
select emp_id,format(base_salary,2)
from employee_salary

--Q14.Display formatted salary values using FORMAT().
select emp_id,format(base_salary,1) as formatted_salary
from employee_salary

--Q15.Display the greater value between base_salary and bonus
select emp_id,GREATEST(base_salary,IFNULL(bonus,0))
from employee_salary

--Q16.Display the smaller value between base_salary and bonus.
select emp_id,LEAST(base_salary,IFNULL(bonus,0))
from employee_salary
