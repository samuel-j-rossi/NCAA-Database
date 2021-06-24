/* BIG EAST TOURNAMENT DATABASE */
/* Stat updates -- creation of methods to update player stats on command */

/******* "Player" Table Updates *******/

/* Update PPG */
UPDATE player p
SET p.ppg = (SELECT ROUND(AVG(gi.points),2)
             FROM game_instance gi
             WHERE p.playerID = gi.playerID)
WHERE EXISTS
            (SELECT 1
             FROM game_instance gi
             WHERE p.playerID = gi.playerID);
                        
/* Update RPG */
UPDATE player p
SET p.rpg = (SELECT ROUND(AVG(gi.rebounds),2)
             FROM game_instance gi
             WHERE p.playerID = gi.playerID)
WHERE EXISTS
            (SELECT 1
             FROM game_instance gi
             WHERE p.playerID = gi.playerID);
             
/* Update APG */
UPDATE player p
SET p.apg = (SELECT ROUND(AVG(gi.assists),2)
             FROM game_instance gi
             WHERE p.playerID = gi.playerID)
WHERE EXISTS
            (SELECT 1
             FROM game_instance gi
             WHERE p.playerID = gi.playerID);

/* Update SPG */
UPDATE player p
SET p.spg = (SELECT ROUND(AVG(gi.steals),2)
             FROM game_instance gi
             WHERE p.playerID = gi.playerID)
WHERE EXISTS
            (SELECT 1
             FROM game_instance gi
             WHERE p.playerID = gi.playerID);
    
/* Update BPG */
UPDATE player p
SET p.bpg = (SELECT ROUND(AVG(gi.blocks),2)
             FROM game_instance gi
             WHERE p.playerID = gi.playerID)
WHERE EXISTS
            (SELECT 1
             FROM game_instance gi
             WHERE p.playerID = gi.playerID);
             
/* Update FGAPG */
UPDATE player p
SET p.fgapg = (SELECT ROUND(AVG(gi.fga),2)
             FROM game_instance gi
             WHERE p.playerID = gi.playerID)
WHERE EXISTS
            (SELECT 1
             FROM game_instance gi
             WHERE p.playerID = gi.playerID);
             
/* Update FGMPG */
UPDATE player p
SET p.fgmpg = (SELECT ROUND(AVG(gi.fgm),2)
               FROM game_instance gi
               WHERE p.playerID = gi.playerID)
WHERE EXISTS
            (SELECT 1
             FROM game_instance gi
             WHERE p.playerID = gi.playerID);
             
/* Update FPG */
UPDATE player p
SET p.fgp = (SELECT (CASE WHEN AVG(gi.fga) = 0 THEN 0 ELSE ROUND((AVG(gi.fgm)/AVG(gi.fga)),2) END)
             FROM game_instance gi 
             WHERE p.playerID = gi.playerID)
WHERE EXISTS
            (SELECT 1
             FROM game_instance gi
             WHERE p.playerID = gi.playerID);
	     
	     
/******* "Game" Table Updates *******/

/* Update HomeTeamScore */
UPDATE game g
SET g.hometeamscore = (SELECT SUM(gi.points)
                       FROM game_instance gi, player p
                       WHERE gi.gameid = g.gameid
                       AND gi.playerid = p.playerid
                       AND g.hometeamid = p.teamid);       

/* Update AwayTeamScore */
UPDATE game g
SET g.awayteamscore = (SELECT SUM(gi.points)
                       FROM game_instance gi, player p
                       WHERE gi.gameid = g.gameid
                       AND gi.playerid = p.playerid
                       AND g.awayteamid = p.teamid);  