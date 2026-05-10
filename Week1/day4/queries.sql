--1. Display all students and the courses they are enrolled in.
--Include students who are not enrolled in any course.
select s.student_name , c.course_name
from students s left join enrollments e
on s.student_id = e.student_id
left join courses c
on e.course_id = c.course_id

--2. Find all courses that currently have no students enrolled.
select c.course_name
from courses c left join enrollments e
on c.course_id = e.course_id
where e.student_id is null;

--3. Display all instructors and the courses they teach,
--including instructors who are not assigned to any course.
select i.instructor_name , c.course_name
from courses c right join instructors i
on c.instructor_id = i.instructor_id

--4. Find all courses that do not have an instructor assigned.
select c.course_name
from courses c left join instructors i
on c.instructor_id = i.instructor_id
where c.instructor_id is null

--5. Display all students and enrollment information using a RIGHT JOIN.
select *
from students s right join enrollments e
on s.student_id = e.student_id

--6. Find students who are not enrolled in any course
select s.student_name
from students s left join enrollments e
on s.student_id = e.student_id
where e.student_id is null

--7. Use a FULL OUTER JOIN to display all students and enrollments,
--including unmatched rows from both tables.
select *
from students s left join enrollments e
on s.student_id = e.student_id
union
select *
from students s right join enrollments e
on s.student_id = e.student_id

--8. Find all courses that have never appeared in the enrollments table.
select c.*
from courses c left join enrollments e
on c.course_id = e.course_id
where e.course_id is null;

--9. Display all instructors and courses using a FULL OUTER JOIN and identify unmatched rows
select *
from courses c left join instructors i
on c.instructor_id = i.instructor_id
union
select *
from courses c right join instructors i
on c.instructor_id = i.instructor_id

-- Q10. Create a report showing student name, course name,
-- and instructor name. Include rows even if course or instructor information is missing.
select s.student_name,c.course_name,i.instructor_name
from students s left join enrollments e
on s.student_id = e.student_id
left join courses c
on e.course_id = c.course_id
left join instructors i
on i.instructor_id = c.instructor_id

--Bonus Challenge: Write a query that lists every student and every course,
--even if there is no enrollment relationship between them.
select s.student_name,c.course_name
from students s cross join courses c
