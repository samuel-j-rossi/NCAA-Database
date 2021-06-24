/* BIG EAST TOURNAMENT DATABASE */
/* Various queries demonstrating database functionality */

/* Show all game scores */
SELECT DISTINCT     g.gameid, g.hometeamname, g.hometeamscore, g.awayteamname, g.awayteamscore
FROM                game g, college c
ORDER BY            g.gameid ASC;

/* Return upset game scores */
SELECT DISTINCT     g.gameid, g.hometeamname, g.hometeamscore, g.awayteamname, g.awayteamscore
FROM                game g, college c
WHERE               g.awayteamscore > g.hometeamscore
ORDER BY            g.gameid ASC;

/* Return top 10 players in PPG */
SELECT 	   	Fname, Lname, PPG
FROM		PLAYER
ORDER BY	PPG DESC
FETCH	    	FIRST 10 ROWS ONLY;

/* Return top 10 players in APG */
SELECT 	    	Fname, Lname, APG
FROM		PLAYER
ORDER BY	APG DESC
FETCH	    	FIRST 10 ROWS ONLY;

/* Return top 10 players in RPG */
SELECT 	    	Fname, Lname, RPG
FROM		PLAYER
ORDER BY	RPG DESC
FETCH	    	FIRST 10 ROWS ONLY;

/* Return top 10 players in SPG */
SELECT 	    	Fname, Lname, SPG
FROM		PLAYER
ORDER BY	SPG DESC
FETCH	    	FIRST 10 ROWS ONLY;

/* Return top 10 players in BPG */
SELECT 	    	Fname, Lname, BPG
FROM		PLAYER
ORDER BY	BPG DESC
FETCH	    	FIRST 10 ROWS ONLY;

/* Return top 10 players in FGP */
SELECT 	   	Fname, Lname, FGP
FROM		PLAYER
WHERE	    	FGAPG > 5
ORDER BY	FGP DESC
FETCH	    	FIRST 10 ROWS ONLY;

/* Return top 10 overall scorers and total points for each*/
SELECT 	    	p.Fname, p.Lname, SUM(gi.points) as totalpoints
FROM		PLAYER p, game_instance gi
WHERE       	p.playerID = gi.playerID
GROUP BY    	p.Fname, p.Lname
ORDER BY	totalpoints DESC
FETCH	    	FIRST 10 ROWS ONLY;

/* Return top 10 highest single game point performances and the player to whom each performance belongs*/
SELECT 	    	p.Fname, p.Lname, gi.points
FROM		PLAYER p, game_instance gi
WHERE          	p.playerID = gi.playerID
ORDER BY	points DESC
FETCH	    	FIRST 10 ROWS ONLY;

/* Return players who had a double-double (10+ in 2 categories) */
SELECT   gi.gameid, c.team_name, p.Fname, p.Lname, gi.points, gi.rebounds, gi.assists, gi.steals, gi.blocks
FROM     player p, game_instance gi, college c
WHERE    (p.playerid, gi.gameid) IN (SELECT gi.playerid, gi.gameid
                                     FROM game_instance gi
                                     WHERE gi.points > 9 AND gi.rebounds > 9
                                     OR gi.points > 9 AND gi.assists > 9
                                     OR gi.points > 9 AND gi.steals > 9
                                     OR gi.points > 9 AND gi.blocks > 9
                                     OR gi.rebounds > 9 AND gi.assists > 9
                                     OR gi.rebounds > 9 AND gi.steals > 9
                                     OR gi.rebounds > 9 AND gi.blocks > 9
                                     OR gi.assists > 9 AND gi.steals > 9
                                     OR gi.assists > 9 AND gi.blocks > 9
                                     OR gi.steals > 9 AND gi.blocks > 9)
AND         p.playerid = gi.playerid
AND         p.teamid = c.teamid
GROUP BY    gi.gameid, c.team_name, p.Fname, p.Lname, gi.points, gi.rebounds, gi.assists, gi.steals, gi.blocks
ORDER BY    gi.points DESC;