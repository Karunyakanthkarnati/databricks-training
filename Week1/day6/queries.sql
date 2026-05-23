--Q1. Retrieve the names of employees and their corresponding managers from the "employees"
--table, ensuring that even employees without managers are included
select e.emp_name as employee ,m.emp_name as manager
from employees e 
left join employees m
on e.manager_id = m.emp_id

--Q2. Display all employees and their corresponding departments from the "employees" and
--"departments" tables, showing employees even if they don't belong to any department.
select e.emp_name as employee ,d.dept_name as departments
from employees e 
left join departments d
on e.dept_id = d.dept_id 

--Q3.List the names of employees who report to a manager, along with their manager's name, from
--the "employees" table
select e.emp_name as employee ,m.emp_name as manager
from employees e 
inner join employees m
on e.manager_id = m.emp_id

--Q4. Display a list of employees who do not belong to any department, even if the department data
--is missing.
select emp_id
from employees
where dept_id is NULL

--Q5. Fetch the names of employees and the projects they are assigned to. For employees who are not
--assigned any projects, show NULL for the project.
select e.emp_name,p.project_name
from employees e
left join projects p
on e.emp_id = p.emp_id

--Q6. List all employees who have completed at least one project, showing their names and the
--project names.
select e.emp_name,p.project_name
from employees e
inner join projects p
on e.emp_id = p.emp_id

--Q7.Show the names of employees and their projects, ensuring that no project is omitted even if an
--employee is not assigned to it.
select e.emp_name,p.project_name
from employees e
right join projects p
on e.emp_id = p.emp_id

--Q8.. Retrieve the names of employees and their corresponding department names, including
--employees who are not in any department.
select e.emp_name as employee ,d.dept_name as departments
from employees e 
left join departments d
on e.dept_id = d.dept_id 

--Q9.Find the names of all departments and employees, ensuring that departments with no
--employees are included.
select e.emp_name as employee ,d.dept_name as departments
from employees e 
right join departments d
on e.dept_id = d.dept_id 

--Q10.Show the names of employees and their department names, including employees not assigned
--to any department and departments without employees
select e.emp_name as employee ,d.dept_name as departments
from employees e 
left join departments d
on e.dept_id = d.dept_id 
UNION
select e.emp_name as employee ,d.dept_name as departments
from employees e 
right join departments d
on e.dept_id = d.dept_id 

--Q11. Find employees who have not completed any project, along with the project details where
--applicable.
select e.emp_name as employees,p.*
from employees e 
left join projects p
on e.emp_id = p.emp_id
where p.emp_id is null

--Q12. Retrieve the names of employees and the names of their projects, including employees who
--are not working on any project.
select e.emp_name as employees,p.project_name as project
from employees e 
left join projects p
on e.emp_id = p.emp_id

--Q13. List all projects and the employees assigned to them, even for projects that have no
--employees
select e.emp_name as employees,p.project_name as project
from employees e 
right join projects p
on e.emp_id = p.emp_id

--Q14.Show the names of all employees who have both a manager and at least one project, listing
--the manager's name as well
select e.emp_name as employees,m.emp_name as manager
from employees e 
left join employees m
on e.manager_id = m.emp_id
left join projects p
on e.emp_id = p.emp_id
where p.project_id is not null

--Q15. List the names of employees and the corresponding department names, but exclude those
--employees who don't belong to a department.
select e.emp_name as employee ,d.dept_name as departments
from employees e 
left join departments d
on e.dept_id = d.dept_id
where e.dept_id is not null

--Q16.List the names of all departments and employees, ensuring that even if a department has no
--employees, it is included in the result
select e.emp_name as employee ,d.dept_name as departments
from employees e 
right join departments d
on e.dept_id = d.dept_id

--Q17.Retrieve employees who have worked on at least one project and do not belong to a
--department, listing their name and project details
select e.emp_name as employee ,p.*
from employees e 
 join projects p
on e.emp_id = p.emp_id
left join departments d
on e.dept_id = d.dept_id
where e.dept_id is null

--Q18. Find the total number of employees who belong to a department, ensuring the departments
--with no employees are still included.
select count(e.emp_id) as no_of_employee ,d.dept_name as department
from employees e 
right join departments d
on e.dept_id = d.dept_id
group by d.dept_name

--Q19. Show the employees and their managers, displaying only those employees who report to a
--manager, excluding employees without managers
select e.emp_name as employees,m.emp_name as manager
from employees e 
join employees m
on e.manager_id = m.emp_id

--Q20.Display all employee names along with their corresponding managers' names, but include
--employees who do not have managers.
select e.emp_name as employees,m.emp_name as manager
from employees e 
left join employees m
on e.manager_id = m.emp_id

--Q21.Find the names of departments and the number of employees in each department, including
--departments that have no employees.
select count(e.emp_id) as no_of_employee ,d.dept_name as department
from employees e 
right join departments d
on e.dept_id = d.dept_id
group by d.dept_name

--Q22. List all employees and the departments they belong to, ensuring that departments with no
--employees are also listed.
select e.emp_name as employee ,d.dept_name as departments
from employees e 
right join departments d
on e.dept_id = d.dept_id

--Q23. Retrieve the names of employees and their project assignments, including employees who are
--not assigned to any projects.
select e.emp_name as employee ,p.project_name as project
from employees e 
left join projects p
on e.emp_id = p.emp_id

--Q24. List the names of all employees and their respective department and project assignments,
--including employees who are not assigned to a project or department.
select e.emp_name as employee ,d.dept_name as department_name,p.project_name as project
from employees e 
left join departments d
on e.dept_id = d.dept_id
left join projects p
on e.emp_id = p.emp_id

--Q25.Display the names of employees who belong to at least one department, with the department
--name listed, but include employees without a department as well
select e.emp_name as employee ,d.dept_name as department_name
from employees e 
left join departments d
on e.dept_id = d.dept_id
