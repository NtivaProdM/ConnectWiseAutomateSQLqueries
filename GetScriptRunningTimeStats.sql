/*
Only for last hour
*/

SELECT Pending_Scripts, Agent_Count, Running_Scripts, Processed_Last_Hour, AverageExecTime
FROM (SELECT COUNT(*) AS Pending_Scripts FROM pendingscripts) Pending_Scripts
CROSS JOIN (SELECT COUNT(*) AS Agent_Count FROM computers) Agent_Count
CROSS JOIN (SELECT COUNT(*) AS Running_Scripts FROM runningscripts WHERE running=1) Running_Scripts
CROSS JOIN (SELECT COUNT(ScriptID) AS Processed_Last_Hour FROM `h_script` WHERE DateIssued >= DATE_SUB(NOW(),INTERVAL 1 HOUR)) Processed_Last_Hour
CROSS JOIN (SELECT AVG(TIMEDIFF(HistoryDate,StartedDate))/60 AS AverageExecTime FROM `h_scripts` WHERE STARTEDDATE >= DATE_SUB(NOW(),INTERVAL 1 HOUR)) AverageExecTime;
;

/*
More in-depth/longer running
*/

SELECT Pending_Scripts, Agent_Count, Running_Scripts, Processed_Last_Hour, AverageExecTime, Processed_Last_Hour4Hrs, AverageExecTime4Hrs, Processed_Last_Hour8Hrs, AverageExecTime8Hrs, Processed_Last_Hour24Hrs, AverageExecTime24Hrs
FROM (SELECT COUNT(*) AS Pending_Scripts FROM pendingscripts) Pending_Scripts
CROSS JOIN (SELECT COUNT(*) AS Agent_Count FROM computers) Agent_Count
CROSS JOIN (SELECT COUNT(*) AS Running_Scripts FROM runningscripts WHERE running=1) Running_Scripts
CROSS JOIN (SELECT COUNT(ScriptID) AS Processed_Last_Hour FROM `h_script` WHERE DateIssued >= DATE_SUB(NOW(),INTERVAL 1 HOUR)) Processed_Last_Hour
CROSS JOIN (SELECT COUNT(ScriptID) AS Processed_Last_Hour4Hrs FROM `h_script` WHERE DateIssued >= DATE_SUB(NOW(),INTERVAL 4 HOUR)) Processed_Last_Hour4Hours
CROSS JOIN (SELECT COUNT(ScriptID) AS Processed_Last_Hour8Hrs FROM `h_script` WHERE DateIssued >= DATE_SUB(NOW(),INTERVAL 8 HOUR)) Processed_Last_Hour8Hours
CROSS JOIN (SELECT COUNT(ScriptID) AS Processed_Last_Hour24Hrs FROM `h_script` WHERE DateIssued >= DATE_SUB(NOW(),INTERVAL 24 HOUR)) Processed_Last_Hour24Hours
CROSS JOIN (SELECT AVG(TIMEDIFF(HistoryDate,StartedDate))/60 AS AverageExecTime FROM `h_scripts` WHERE STARTEDDATE >= DATE_SUB(NOW(),INTERVAL 1 HOUR)) AverageExecTimeLastHour
CROSS JOIN (SELECT AVG(TIMEDIFF(HistoryDate,StartedDate))/60 AS AverageExecTime4Hrs FROM `h_scripts` WHERE STARTEDDATE >= DATE_SUB(NOW(),INTERVAL 4 HOUR)) AverageExecTimeLast4Hours
CROSS JOIN (SELECT AVG(TIMEDIFF(HistoryDate,StartedDate))/60 AS AverageExecTime8Hrs FROM `h_scripts` WHERE STARTEDDATE >= DATE_SUB(NOW(),INTERVAL 8 HOUR)) AverageExecTimeLast8Hours
CROSS JOIN (SELECT AVG(TIMEDIFF(HistoryDate,StartedDate))/60 AS AverageExecTime24Hrs FROM `h_scripts` WHERE STARTEDDATE >= DATE_SUB(NOW(),INTERVAL 24 HOUR)) AverageExecTimeLast24Hours
;
