/*
This query will show by user and by script name the total number of times each script was run, for each individual user, over the past 90 days.

*/
SELECT  
	hs.`RunByUser`,
	lts.`ScriptName`,
	COUNT(hs.`RunByUser`) AS 'Total Count Run'
FROM 
	h_scripts hs
JOIN
	lt_scripts lts ON lts.`ScriptId` = hs.`ScriptID`
WHERE 
	hs.`FinishStatus` != 0 
	AND 
	(hs.`RunByUser` != 'root' AND hs.`RunByUser` > '')
	AND 
	(hs.`HistoryDate` BETWEEN DATE_ADD(CURDATE(), INTERVAL -90 DAY)	AND CURDATE() 
	OR 
	hs.`HistoryDate` BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY))
GROUP BY
	hs.`RunByUser`, lts.`ScriptName`
;
