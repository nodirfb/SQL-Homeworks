


SELECT Team_1, match_played, match_win, isnull(n, 0) as match_tie, 
match_played - match_win -isnull(n, 0) AS match_lost
FROM (
SELECT * FROM (
SELECT  Team_1, match_played, count(Result) as match_win  FROM
(SELECT TEAM_1, COUNT(*) as match_played
	FROM (
		SELECT Team_1 FROM Match_Result
		UNION ALL
		SELECT Team_2 FROM Match_Result
	) AS dv
	GROUP BY Team_1
) as dv2
JOIN (
SELECT Result FROM Match_Result
WHERE Result IS NOT NULL
) AS dv3
ON dv2.Team_1 = dv3.Result
GROUP BY Team_1, match_played, Result
) as dv4
LEFT JOIN (
	SELECT Team_1 as team_tie, COUNT(*)AS n from (
	SELECT Team_1 FROM Match_Result
	WHERE Result IS NULL
	UNION ALL
	SELECT Team_2 FROM Match_Result
	WHERE Result IS NULL
	) as dv6
	GROUP BY Team_1
) as dv5
ON dv4.team_1 = dv5.team_tie
) as dv7
