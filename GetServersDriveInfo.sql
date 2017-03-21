/*
 Description    : Returns Drive info for all servers in Netmon
 Source URL     : https://github.com/NtivaProdM/ConnectWiseAutomateSQLqueries
 Returns        :
	Total Drive Size GB
  Total Drive space free GB
  Total Drive space used GB
 Tested Versions:
  LabTech 10.5
 */

SELECT
  clients.name AS 'Client',
  computers.name,
  COUNT(DISTINCT computers.computerid) AS 'Total Servers',
  ROUND(((SUM(drives.size))/1024),0) AS 'Total Drive Size GB',
  ROUND(((SUM(drives.free))/1024),0) AS 'Total Drive free GB',
  ROUND(((SUM(drives.size-drives.free))/1024),0) AS 'Total Drive usage GB'

FROM
     computers

LEFT OUTER JOIN
     clients ON computers.clientid = clients.clientid
LEFT OUTER JOIN
     drives ON computers.ComputerID = drives.computerid

WHERE
     computers.os LIKE '%server%'
     AND drives.filesystem REGEXP 'ntfs|refs'
 
 GROUP BY
     computers.clientID,
     computers.name;
     
     
