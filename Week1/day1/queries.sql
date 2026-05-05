Q1
select * from Employee
Q2
select name, salary from Employee
Q3
select * from Employee where age>30
Q4
select name from Department
Q5
select e.name from Employee e 
join Department d 
ON e.department_id = d.department_id
where d.name ='IT'
Q6
select * from Employee
where name like 'J%'
Q7
select * from Employee
where name like '%e'
Q8
select * from Employee
where name like '%a%'
Q9
select * from Employee
where LENGTH(name)=9
Q10
select * from Employee
where name like '_o%'
Q11
select * from Employee
where YEAR(hire_date)=2020
Q12
select * from Employee
where MONTH(hire_date)=01
Q13
select * from Employee
where YEAR(hire_date)<2019
Q14
select * from Employee
where hire_date >= '2021-03-01'
Q15
SELECT name, hire_date
FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR;
Q16
select sum(salary) from Employee
            or
select avg(salary)*count(emp_id) from Employee
Q17
select avg(salary) from Employee
Q18
select min(salary) from Employee
Q19
SELECT department_id, COUNT(*)
FROM Employee
GROUP BY department_id;
Q20
select department_id,avg(salary) from Employee
group by department_id
