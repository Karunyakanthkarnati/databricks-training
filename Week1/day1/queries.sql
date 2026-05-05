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
