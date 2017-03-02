/*
 Description    : Returns Total command counts for previous 24 hour period
 Source URL     : https://github.com/NtivaProdM/ConnectWiseAutomateSQLqueries
 Returns        :
	cmd status 0 = pending **99% sure**
	cmd status 1 = ??
	cmd status 2 = executing **know for sure**
	cmd status 3 = Success **99% sure**
	cmd status 4 = failed **99% sure** 
 Tested Versions:
  LabTech 10.5
 */

/* returns the total pending commands over last 24 hours*/
SELECT 
RemoteCommands.Name AS CommandName,
COUNT(*) AS TotalPending
FROM Commands
RIGHT JOIN remotecommands ON Commands.Command = remotecommands.ID
WHERE STATUS = 0 AND `dateupdated` > DATE_SUB(NOW(), INTERVAL 24 HOUR)
GROUP BY RemoteCommands.Name
ORDER BY totalpending DESC;

/* returns the total executing commands over last 24 hours*/
SELECT 
RemoteCommands.Name AS CommandName,
COUNT(*) AS TotalExecuting
FROM Commands
RIGHT JOIN remotecommands ON Commands.Command = remotecommands.ID
WHERE STATUS = 2 AND `dateupdated` > DATE_SUB(NOW(), INTERVAL 24 HOUR)
GROUP BY RemoteCommands.Name
ORDER BY totalexecuting DESC;

/* returns the total success commands over last 24 hours*/
SELECT 
RemoteCommands.Name AS CommandName,
COUNT(*) AS TotalSuccess 
FROM Commands
RIGHT JOIN remotecommands ON Commands.Command = remotecommands.ID
WHERE STATUS = 3 AND `dateupdated` > DATE_SUB(NOW(), INTERVAL 24 HOUR)
GROUP BY RemoteCommands.Name
ORDER BY totalsuccess DESC;

/* returns the total failed commands over last 24 hours*/
SELECT 
RemoteCommands.Name AS CommandName,
COUNT(*) AS TotalFailed 
FROM Commands
RIGHT JOIN remotecommands ON Commands.Command = remotecommands.ID
WHERE STATUS = 4 AND `dateupdated` > DATE_SUB(NOW(), INTERVAL 24 HOUR)
GROUP BY RemoteCommands.Name
ORDER BY totalfailed DESC;
