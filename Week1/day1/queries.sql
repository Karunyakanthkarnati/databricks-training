-- Week 1 - Day 1 SQL Practice

-- Q1. Select all columns from Employee table
select * from Employee
            
-- Q2. Select employee names and salaries
select name, salary from Employee
            
-- Q3. Display employees older than 30
select * from Employee where age>30
            
-- Q4. Display all department names
select name from Department
            
-- Q5. Display employees working in IT department
select e.name from Employee e 
join Department d 
ON e.department_id = d.department_id
where d.name ='IT'
            
-- Q6. Display employees whose names start with 'J'
select * from Employee
where name like 'J%'

-- Q7. Display employees whose names end with 'e'
select * from Employee
where name like '%e'

-- Q8. Display employees whose names contain 'a'
select * from Employee
where name like '%a%'

-- Q9. Display employees whose names are exactly 9 characters long
select * from Employee
where LENGTH(name)=9

-- Q10. Display employees whose second character is 'o'
select * from Employee
where name like '_o%'

-- Q11. Display employees hired in 2020
select * from Employee
where YEAR(hire_date)=2020

-- Q12. Display employees hired in January
select * from Employee
where MONTH(hire_date)=01

-- Q13. Display employees hired before 2019
select * from Employee
where YEAR(hire_date)<2019

-- Q14. Display employees hired on or after March 1, 2021
select * from Employee
where hire_date >= '2021-03-01'

-- Q15. Display employees hired in the last 2 years
SELECT name, hire_date
FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR;

-- Q16. Find total salary of all employees
select sum(salary) from Employee
            or
select avg(salary)*count(emp_id) from Employee

-- Q17. Find average salary of employees
select avg(salary) from Employee

-- Q18. Find minimum salary among employees
select min(salary) from Employee

-- Q19. Count employees in each department
SELECT department_id, COUNT(*)
FROM Employee
GROUP BY department_id;

-- Q20. Find average salary in each department
select department_id,avg(salary) from Employee
group by department_id

-- Q21. Find total salary for each department
select department_id,sum(salary) from Employee
group by department_id

-- Q22. Find average age in each department
select department_id,avg(age) from Employee
group by department_id

-- Q23. Count employees hired each year
select year(hire_date),count(emp_id) from Employee
group by year(hire_date)

-- Q24. Find highest salary in each department
select department_id,max(salary) from Employee
group by department_id

-- Q25. Find department with highest average salary
select department_id
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

-- Q26. Display departments with more than 2 employees
select department_id from Employee
group by department_id
having count(emp_id)>2

-- Q27. Display departments with average salary greater than 55000
select department_id from Employee
group by department_id
having avg(salary)>55000

-- Q28. Display years where more than 1 employee was hired
select year(hire_date) from Employee
group by year(hire_date)
having count(emp_id)>1

-- Q29. Display departments with total salary less than 100000
select department_id from Employee
group by department_id
having sum(salary)<100000

-- Q30. Display departments where maximum salary is greater than 75000
select department_id from Employee
group by department_id
having max(salary)>70000
