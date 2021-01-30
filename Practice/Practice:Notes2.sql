-- CHAPTER 3 CONTINUED

-- SQL includes a BETWEEN comparison operator
select I.name
from instructor I
where I.salary between 90000 and 100000;

-- SET OPERATIONS

-- find courses that are taught in Fall 2009 
select S.course_id
from section S
where S.semester = 'Fall' and S.year = 2009;

-- find courses that are taught in Fall 2009 OR Spring 2010
(select S.course_id
from section S
where S.semester = 'Fall' and S.year = 2009)
union
(select S.course_id
from section S
where S.semester = 'Spring' and S.year = 2010);

-- find courses that are taught in Fall 2009 AND Spring 2010
(select S.course_id
from section S
where S.semester = 'Fall' and S.year = 2009)
intersect
(select S.course_id
from section S
where S.semester = 'Spring' and S.year = 2010);

-- find courses that are taught in Fall 2009 BUT NOT Spring 2010
(select S.course_id
from section S
where S.semester = 'Fall' and S.year = 2009)
except
(select S.course_id
from section S
where S.semester = 'Spring' and S.year = 2010);

-- AGGREGATE FUNCTIONS
-- find the AVG salary of instructors in the computer science dept
select avg(I.salary)
from instructor I
where I.dept_name = "Comp. Sci.";

-- find the total numbers of instructors who teach a course in the Spring 2010
select count(distinct T.ID)
from teaches T
where T.semester = 'Spring' and T.year = 2010;

-- find the total number of tuples in the course relation
select count(*)
from course;

-- GROUP BY
-- find the average salary of instructors in each department
select I.dept_name, avg (I.salary) as avg_salary
from instructor I
group by I.dept_name;

-- HAVING 
-- Find the names and average salaries of each department whose average salary is greater than 42000
select I.dept_name, avg (I.salary) as avg_salary
from instructor I
group by I.dept_name
having avg (I.salary) > 42000;








