-- CS 482: ASSIGNMENT 1
-- ANTONIO MALDONADO


-- Question 1
-- Show the names and ID's of all players whose play position is "center"
select Name, ID
from Player
where PlayPos = 'center';



-- Question 2
-- Show the total points that player "Pistol Pete" has scored each year (assume there is only one Pistol Pete)
select S.year, S.TotalPoints
from Stats S, Player P
where S.PlayerID = P.ID and P.name = 'Pistol Pete'
order by S.Year;



-- Question 3
-- Show the names and emails of every manager who has exactly 3 distinct certificates
select M.Name, M.Email
from Manager M, ManagerCertificate MC
where M.ID = MC.ManagerID
group by MC.ManagerID
having count(*) = 3;



-- Question 4
-- Show the names of every player who has played a game at "The Pit" and won
-- 	(Result = "win"), in descending order of age
select P.name
from Player P, Game, Play
where P.ID = Play.PlayerID and Play.GameID = Game.GameID 
			and Game.PlayingVenue = 'The Pit' and Game.Result = 'win'
order by P.Birthday desc;



-- Question 5
-- Show emails, name of Doctors who have given exams
select D.name, D.email
from Doctor D, TakeExam TE
where TE.DocEmail = D.Email;



-- Question 6
-- Find the games that players named "Pistol Pete" and "Lobo Louie" have played in,
-- 	using set operations (union, intersect, minus, etc..). Show the game's ID, game's
-- 	date, venue, and result
(select Game.GameID, Game.Date, Game.PlayingVenue, Game.Result
from Game, Player P, Play
where Play.PlayerID = P.ID and P.Name = 'Pistol Pete' and Play.GameID = Game.GameID)
intersect
(select Game.GameID, Game.Date, Game.PlayingVenue, Game.Result
from Game, Player P, Play
where Play.PlayerID = P.ID and Play.GameID = Game.GameID P.Name = 'Lobo Louie');
 


-- Question 7
-- Perform the same query as problem 6, without using set operators (union, intersect, minus,etc..)
select distinct Game.GameID, Game.Date, Game.PlayingVenue, Game.Result
from Game, Player P, Play
where P.name = 'Pistol Pete' and Game.GameID in (
	select Game.GameID
    from Player P, Game, Play
    where P.ID = Play.PlayerID and Play.GameID = Game.GameID and P.name = 'Lobo Louie');
    
 
 
-- Question 8
-- Find the names and IDs of players who have scored more points than the average player
select P.Name, P.ID
from Player P, Stats S
where P.ID = S.PlayerID and S.TotalPoints > (select avg(TotalPoints) from Stats);



-- Question 9
-- Show all players that were born on the same day (i.e: If Bob and Joe were born on 12/25/95,
-- 	and Jim and steve were born on 07/04/94, show the names and the birthday the share)
select P1.Name, P2.Name, P1.Birthday
from Player P1, Player P2
where P1.Birthday = P2.Birthday and P1.ID != P2.ID;



-- Question 10
-- Find the total number of points the Aggie Basketball team scored in 2019
select sum(TotalPoints)
from Stats
where Year = 2019;





