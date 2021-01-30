-- CS 482: DATA FOR PROJECT PHASE 1
-- ANTONIO MALDONADO

insert into Players values('Drew Lock', 3, 'Denver Broncos', 'QB', 7, 1020, 6994472);
insert into Players values('Phillip Lindsay',30, 'Denver Broncos', 'RB', 7, 1011, 570000);
insert into Players values('Courtland Suttton', 14, 'Denver Broncos', 'WR', 0, 17, 1710480);
insert into Players values('Ryan Fitzpatrick', 1, 'Miami Dolphins', 'QB', 20, 3529, 5500000);
insert into Players values('Kalen Ballage', 27, 'Miami Dolphins', 'RB', 3, 135, 3049181);

insert into Games values(1, '2020/02/25', 'Broncos Stadium', 'W', 12000, 240000);
insert into Games values(2, '2020/02/21', 'Dolphins Stadium', 'W', 15000, 300000);
insert into Games values(3, '2020/01/06', 'Steelers Stadium', 'L', 20000, 369000);
insert into Games values(7, '2019/08/12', 'Love Stadium', 'W', 69000, 420000);
insert into Games values(9, '2019/12/12', 'Aggie Stadium', 'L', 21000, 230000);

insert into Play values(3, 1);
insert into Play values(30, 1);
insert into Play values(14, 3);
insert into Play values(1, 2);
insert into Play values(27, 7);
        

-- TESTS --

select *
from Players;

select *
from Games;

select *
from Play;

