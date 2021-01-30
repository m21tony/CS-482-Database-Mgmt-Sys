-- CHAPTER 4 INTERMEDIATE SQL NOTES/PRACTICE

-- A view of instructors without their salary
create view faculty as
	select I.ID, I.name, I.dept_name
    from instructor I;
    
    
-- Find all instructors in the Biology department
select name
from faculty
where dept_name = 'Biology';


-- Create a view of department salary totals
create view departments_total_salary(dept_name, total_salary) as
	select dept_name, sum(salary)
    from instructor
    group by dept_name;
    

-- Views defined using other views
create view physics_fall_2009 as 
	select course.course_id, sec_id, building, room_number
    from course, section
    where course.course_id = section.course_id
		and course.dept_name = 'Physics'
        and section.semester = 'Fall'
        and section.year = '2009';
        

create view physics_fall_2009_watson as
	select course_id, room_number
    from physics_fall_2009
    where building = 'Watson';
    
    

-- EXAMPLE: Find the average instructors' salaries of those departments where the average 
-- 			salary is greater than $42,000
create view avgSalaryDept(dept_name, avg_salary) as
	select I.dept_name, avg(I.salary)
    from instructor I
    group by I.dept_name;
    
select *
from avgSalaryDept A
where A.avg_salary > 42000;
	
-- Can also be written as:
create view finalResult as
	select I.dept_name, avg(I.salary)
    from instructor I
    group by I.dept_name
    having avg(I.salary) > 42000;
    
select *
from finalResult;



    
    

