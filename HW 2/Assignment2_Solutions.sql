-- Assignment 2 (Part 2) Solutions

-- Question 1
-- Show the names of members who borrowed books with title “Math”
select M.name
from members M, books, borrowed BR
where M.memb_no = BR.memb_no and BR.isbn = books.isbn and books.title = 'Math';


-- Question 2
-- Show the details of members whose name does not start with ‘J’.
select *
from members
where not (name like 'J%');


-- Question 3
-- Find the numbers of books borrowed by each member and show them in descending order
select M.memb_no, count(B.isbn)
from members M, books B, borrowed BR
where M.memb_no = BR.memb_no and B.isbn = BR.isbn
group by M.memb_no
order by M.memb_no desc;


-- Qeustion 4
-- Show the details of members whose name contains ‘A’
select *
from members
where name like '%A%';


-- Question 5
-- Find the distinct publisher name of the book which has been borrowed by “Sam”.
select distinct (books.publisher)
from books, members M, borrowed BR
where M.name = 'Sam' and M.memb_no = BR.memb_no
and BR.isbn = books.isbn;






