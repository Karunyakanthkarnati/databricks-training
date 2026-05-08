--Q31. Display employees ordered by salary in ascending order
select * from Employee
order by salary asc

--Q32. Display employees ordered by age in descending order
select * from Employee
order by age desc

--Q33. Display employees ordered by hire date
select * from Employee
order by hire_date asc

--Q34. Display employees ordered by department and salary
select * from Employee
order by department_id , salary

--Q35. Display departments ordered by total salary
select department_id,sum(salary) as total_salary
from Employee
group by department_id
order by sum(salary)

--36. Display employee names with department names
select e.name,d.name 
from Employee e join Department d
on e.department_id = d.department_id

--37. Display project names with their department names
select p.name,d.name
from Project p join Department d
on p.department_id=d.department_id

--38. Deplay employee names with their project names
select e.name,p.name
from Employee e join Project p
on e.department_id = p.department_id

--39. Display employee names with their department names including those without a department
select e.name,d.name
from Employee e left outer join Department d
on e.department_id = d.department_id

--40. Display all departments with employees including departments without employees
select d.name,e.name
from Employee e right outer join Department d
on e.department_id = d.department_id

--41. Display employee names without project
select e.name as employee_name,p.name as Project_name
from Employee e left outer join Project p
on e.department_id = p.department_id
where p.project_id is null

--42. Display employees and no.of projects their departments are working on
select e.name as employee_name ,count(project_id) as no_of_projects
from Employee e left join Project p
on e.department_id=p.department_id
group by e.name

--43. Display departments with 0 employees
select d.name as department_name
from Department d left join Employee e
on d.department_id=e.department_id
group by d.department_id,d.name
having count(emp_id)=0

--44. Display all employee names from department having 'John Doe'



