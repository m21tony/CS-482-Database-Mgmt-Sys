-- ASSINGMENT 1: SQL - CS 482 

create table Player (
		ID				integer,
		Name			varchar(64),
		Birthday 		date,
        Address			varchar(128),
        Email			varchar(32),
        PhoneNumber		char(10),
        PlayPos			varchar(16)
        primary key (ID));
        
create table Manager (
		ID				integer,
        LoginID			varchar(16),
        Name			varchar(64),
        Password		varchar(8),
        Birthday		date,
        Address			varchar(128),
        Email			varchar(32),
        PhoneNumber		char(10)
        primary key (ID));
        
create table ManagerCertificate (
		ManagerID		integer,
        CertificateID	integer,
        Certificate		blob,
        foreign key (ManagerID) references Manager(ID)) ENGINE=INNODB ;
        
create table Doctor (
		Email 			varchar(32),
        Name			varchar(64),
        PhoneNumber		char(10)
        primary key (Email));
        
create table TakeExam (
		PlayerID 		integer,
        DocEmail		varchar(32),
        TestDate		date,
        TestResult		varchar(256),
        foreign key (PlayerID) references Player(ID),
        foreign key (DocEmail) references Doctor(Email));
        
create table Stats (
		PlayerID 		integer,
        Year			char(4),
        TotalPoints		integer,
        ASPG			integer,
        foreign key (PlayerID) references Player(ID));
        
create table Training (
		TrainingName		varchar(256),
        Instruction			varchar(256),
        TimePeriodInHour	Integer);
        
create table AssignTraining (
		 PlayerID		integer,
         ManagerID		integer,
         TrainingName	varchar(256),
         foreign key (PlayerID) references Player(ID),
         foreign key (ManagerID) references Manager(ID),
         foreign key (TrainingName) references Training(TrainingName));
         
create table Game (
		GameID			integer,
        Date			date,
        Result			varchar(16),
        PlayingVenue	varchar(256),
        OpponentTeam	varchar(32));
        
create table Play (
		PlayerID		integer,
        GameID			integer,
        foreign key (PlayerID) references Player(ID),
        foreign key (GameID) references Game(GameID));
        
        
         


