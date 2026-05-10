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

--Q36. Display employee names with department names
select e.name,d.name 
from Employee e join Department d
on e.department_id = d.department_id

--Q37. Display project names with their department names
select p.name,d.name
from Project p join Department d
on p.department_id=d.department_id

--Q38. Deplay employee names with their project names
select e.name,p.name
from Employee e join Project p
on e.department_id = p.department_id

--Q39. Display employee names with their department names including those without a department
select e.name,d.name
from Employee e left outer join Department d
on e.department_id = d.department_id

--Q40. Display all departments with employees including departments without employees
select d.name,e.name
from Employee e right outer join Department d
on e.department_id = d.department_id

--Q41. Display employee names without project
select e.name as employee_name,p.name as Project_name
from Employee e left outer join Project p
on e.department_id = p.department_id
where p.project_id is null

--Q42. Display employees and no.of projects their departments are working on
select e.name as employee_name ,count(project_id) as no_of_projects
from Employee e left join Project p
on e.department_id=p.department_id
group by e.name

--Q43. Display departments with 0 employees
select d.name as department_name
from Department d left join Employee e
on d.department_id=e.department_id
group by d.department_id,d.name
having count(emp_id)=0

--Q44. Display all employee names from department having 'John Doe'
select name 
from Employee
where department_id = (
  select department_id 
  from Employee 
  where name = 'John Doe')

--Q45. Display department name with highest avg salary
select name 
from Department
where department_id = (
  select department_id 
  from Employee 
  group by department_id
  order by avg(salary) desc 
  limit 1);

-- Q46. Select the employee with the highest salary
select *
from Employee
where salary = (
  select max(salary)
  From Employee
  );

-- Q47. Select employees whose salary is above the average salary
select *
from Employee
where salary > (
  select avg(salary)
  From Employee
  );

-- Q48. Select the second highest salary from the Employee table
select max(salary)
from Employee
where salary < (
  select max(salary)
  From Employee
  );

-- Q49. Select the department with the most employees
select name
from Department
where department_id = (
  select department_id
  From Employee
  group by department_id
  order by count(emp_id) desc
  limit 1
  );

-- Q50. Select employees who earn more than the average salary of their department
select *
from Employee e1
where salary>(
  select avg(salary)
  from Employee e2
  where e1.department_id=e2.department_id
  );

-- Q51. Select the nth highest salary (for example, 3rd highest)
SELECT DISTINCT salary
FROM Employee e1
WHERE 3 = (
    SELECT COUNT(DISTINCT salary)
    FROM Employee e2
    WHERE e2.salary >= e1.salary
);

-- Q52. Select employees who are older than all employees in the HR department
SELECT *
FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id
    WHERE d.name = 'HR'
);

-- Q53. Select departments where the average salary is greater than 55000
SELECT department_id,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- Q54. Select employees who work in a department with at least 2 projects
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
    GROUP BY department_id
    HAVING COUNT(project_id) >= 2
);

-- Q55. Select employees who were hired on the same date as 'Jane Smith'
SELECT *
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
)
AND name <> 'Jane Smith';

-- Q56. Select the total salary of employees hired in the year 2020
SELECT SUM(salary) AS total_salary
FROM Employee
WHERE YEAR(hire_date) = 2020;

-- Q57. Select the average salary of employees in each department, ordered by the average salary in descending order
SELECT department_id,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
ORDER BY average_salary DESC;

-- Q58. Select departments with more than 1 employee and an average salary greater than 55000
SELECT department_id,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1
AND AVG(salary) > 55000;

-- Q59. Select employees hired in the last 2 years, ordered by their hire date
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
ORDER BY hire_date;

-- Q60. Select the total number of employees and the average salary for departments with more than 2 employees
SELECT department_id,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- Q61. Select the name and salary of employees whose salary is above the average salary of their department
SELECT name, salary
FROM Employee e1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);

-- Q62. Select the names of employees who are hired on the same date as the oldest employee in the company
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    ORDER BY age DESC
    LIMIT 1
);

-- Q63. Select the department names along with the total number of projects they are working on, ordered by the number of projects
SELECT d.name AS department_name,
       COUNT(p.project_id) AS total_projects
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.name
ORDER BY total_projects DESC;

-- Q64. Select the employee name with the highest salary in each department
SELECT e.name,
       e.department_id,
       e.salary
FROM Employee e
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- Q65. Select the names and salaries of employees who are older than the average age of employees in their department
SELECT name, salary
FROM Employee e1
WHERE age > (
    SELECT AVG(age)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);
