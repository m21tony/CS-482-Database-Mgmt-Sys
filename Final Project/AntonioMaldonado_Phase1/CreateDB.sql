-- CS 482: PROJECT PHASE 1
-- ANTONIO MALDONADO

-- NOTE: I included screenshots of output from tests in DataDB.sql for proof that everything worked correctly on /MY laptops/ sql workbench

create table Players (
		Name			varchar(64) not null,
        PlayerID		integer,
        TeamName		varchar(64),
        PlayPos			varchar(2) not null,
        Touchdowns		integer check (Touchdowns >= 0),
        TotalYards		integer check (TotalYards >= 0),
        Salary			integer check (Salary >= 0),
        unique(PlayerID),
        primary key (PlayerID),
        check (PlayPos = 'QB' or PlayPos = 'RB' or PlayPos = 'WR')
        );
        
        
create table Games (
		GameID			integer,
        Date 			date,
        Stadium			varchar(32),
        Result			varchar(1),
        Attendance		integer,
        TicketRevenue	integer,
        unique(GameID),
        primary key (GameID),
        check (Result = 'W' or Result = 'L' or Result = 'T')
        );
        

create table Play (
		PlayerID		integer,
        GameID			integer,
        Foreign key (PlayerID) references Players(PlayerID),
        Foreign key (GameID) references Games(GameID)
        );
        


        