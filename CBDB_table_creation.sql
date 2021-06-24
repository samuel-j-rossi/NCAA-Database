/* BIG EAST TOURNAMENT DATABASE */
/* Creation of database schema */

DROP TABLE COLLEGE CASCADE CONSTRAINTS;
DROP TABLE PLAYER CASCADE CONSTRAINTS;
DROP TABEL GAME CASCADE CONSTRAINTS;
DROP TABLE GAME_INSTANCE CASCADE CONSTRAINTS;

CREATE TABLE COLLEGE(
    TeamID  		INT NOT NULL,
    Team_Name   	Char(50) NOT NULL,
    Head_Coach  	Char(50) NOT NULL,
    Mascot      	Char(50) NOT NULL,
    City        	Char(50),
    C_State       	Char(50) NOT NULL,
    Team_Record      	VarChar(10) NOT NULL,
    Team_Seed        	INT NOT NULL,
    CONSTRAINT TEAM_PK PRIMARY KEY(TeamID)
    );
    
CREATE SEQUENCE seqTeamID INCREMENT BY 1 START WITH 1;
    
CREATE TABLE PLAYER(
    PlayerID        INT NOT NULL,
    TeamID          INT NOT NULL,
    Fname           Char(50)         NOT NULL,
    Lname           Char(50)         NOT NULL,
    Player_Year     Char(50)         NOT NULL,
    Player_Number   INT              NOT NULL,
    Height          VarChar(10)      NOT NULL,
    Weight          VarChar(10)      NOT NULL,
    RPG             NUMBER(4,2)      NOT NULL,
    APG             NUMBER(4,2)      NOT NULL,
    SPG             NUMBER(4,2)      NOT NULL,
    BPG             NUMBER(4,2)      NOT NULL,
    FGAPG           NUMBER(4,2)      NOT NULL,
    FGMPG           NUMBER(4,2)      NOT NULL,
    FGP             NUMBER(4,2)      NOT NULL,
    PPG             NUMBER(4,2)      NOT NULL,
    CONSTRAINT PLAYER_PK PRIMARY KEY(PlayerID)
    );
   
CREATE TABLE GAME (
    GameID          INT NOT NULL,
    HomeTeamID      INT NOT NULL,
    HomeTeamName    char(50) NOT NULL,
    AwayTeamID      INT NOT NULL,
    AwayTeamName    char(50) NOT NULL,
    HomeTeamScore   INT NOT NULL,
    AwayTeamScore   INT NOT NULL,
    CONSTRAINT GAME_PK PRIMARY KEY(GameID)
);

CREATE TABLE GAME_INSTANCE(
    PlayerID    INT NOT NULL,
    GameID      INT NOT NULL,
    Rebounds    INT NOT NULL,
    Assists     INT NOT NULL,
    Steals      INT NOT NULL,
    Blocks      INT NOT NULL,
    FGA         INT NOT NULL,
    FGM         INT NOT NULL,
    Points      INT NOT NULL
    );