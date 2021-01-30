-- insert a single row into a table
insert into student values ('59821', 'Tony', 'Comp. Sci', 69);
insert into student values ('39024', 'Liz', 'Physics', 82);

delete from instructor;
-- removes all rows (tuples) from the instructor relation

drop table instructor;
-- removes a relation from an SQL database

alter table instructor add column address varchar(25);
-- adds column

alter table instructor drop column address;
-- removes the column

-- Find the names of all instructors in computer science
select name -- lists the attributes desired in the result of a query
-- addding /distinct/: "select distinct name" - removes duplicates
from instructor -- 
where dept_name = 'Comp. Sci';
-- pretty self explanatory 

-- ------------EXAMPLES/NOTES -------------
select name
from instructor
where name = 'Wu';

select name
from student
where id = '19991';

-- The ASTERISK in the select clause denotes "all attributes"
select *
from student;

select 'A'
from instructor;

-- The SELECT clause can contain arithmetic expressions
-- would return a relation that is the same as the instructor relation
-- except that the value of the attribute salary is divided by 12 (monthly)
select ID, name, salary/12
from instructor;

select ID, name, salary/12 as monthly_salary
from instructor;

-- COMPARISONS can be combined using (and, or, not)
-- Find all instructors in Comp. Sci. dept with salary > 80000
select name
from instructor
where dept_name = 'Comp. Sci.' and salary > 80000;

-- The FROM clause lists the relations involved in the query
-- Find the cartesian product instructor x teaches
-- generates every possible instructor - teaches pair with all attributes from both relations
select *
from instructor, teaches;

-- adding the WHERE clause makes the results more meaningful
-- this will print the instructor x teaches table but with actual meaningful results
select *
from instructor, teaches
where instructor.ID = teaches.ID;

-- find the names of instructors who teach some course, and the course ID
select name, course_id
from instructor, teaches
where instructor.ID = teaches.ID;

-- find the names of instructors in the physics department who have taught some course, and the course_id
select name, course_id
from instructor, teaches
where instructor.ID = teaches.ID and instructor.dept_name = 'physics';

-- RENAME operation 'as' 
-- renames relations and attributes (old-name as new-name)
-- find the names of all instructors who have taught some course and the course_id
select I.name, T.course_id
from instructor as I, teaches as T
where I.ID = T.ID;

-- this is the same as above
-- 'as' is optional
-- use this from now on!

select I.name, T.course_id
from instructor I, teaches T
where I.ID = T.ID;

-- STRING operations
-- the LIKE operator is used to search for specific patterns in your data
-- the percent symbol matches any substring
-- the underscore symbol matches any character

-- find the names of all instructors whose name includes the substring "vas"
select I.name
from instructor I
where I.name like '%vas%';

-- you can ORDER the display of tuples
-- find alphabetic order of instructor names:
select I.name
from instructor I
order by I.name; -- you can order in descending order too with 'desc' (order by I.name desc;)

-- find the names in descending order of all instructors that start with "M" in the Finance
-- department who have taught some course and the course_ID
select I.Name, T.course_id
from instructor I, teaches T
where I.ID = T.ID and I.dept_name = 'Finance' and I.name like 'M%'
order by I.name desc;

-- find the names of all instructors who have a higher salary than some instructor in 'Comp. Sci.'
select distinct T.name
from instructor T, instructor S
where T.salary > S.salary and S.dept_name = 'Comp. Sci.';

-- find the names of instructors and the course ID of all courses they taught
select I.name, T.course_id
from instructor I, teaches T
where I.ID = T.ID;
-- same thing
-- above is better practice though
select I.name, T.course_id
from instructor I natural join teaches T;




