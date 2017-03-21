/*
 Description    : Returns Running Script Counts for Entire Netmon system
 Source URL     : https://github.com/NtivaProdM/ConnectWiseAutomateSQLqueries
 Returns        :

 Tested Versions:
  LabTech 10.5
 */
 
 /*What scripts have run in the last 7 days and how many times did they run*/
SELECT h.scriptid, s.scriptname, COUNT(*)
FROM h_scripts AS h
LEFT JOIN lt_scripts AS s
ON h.scriptid = s.scriptid
WHERE h.starteddate  > DATE_ADD(NOW(),INTERVAL - 7 DAY)
GROUP BY h.scriptid ORDER BY COUNT(*) DESC;

/*What scripts have run in the last 2 days and how many times did they run*/
SELECT h.scriptid, s.scriptname, COUNT(*)
FROM h_scripts AS h
LEFT JOIN lt_scripts AS s
ON h.scriptid = s.scriptid
WHERE h.starteddate  > DATE_ADD(NOW(),INTERVAL - 2 DAY)
GROUP BY h.scriptid ORDER BY COUNT(*) DESC;

/*What scripts have run in the last 1 days and how many times did they run*/
SELECT h.scriptid, s.scriptname, COUNT(*)
FROM h_scripts AS h
LEFT JOIN lt_scripts AS s
ON h.scriptid = s.scriptid
WHERE h.starteddate  > DATE_ADD(NOW(),INTERVAL - 1 DAY)
GROUP BY h.scriptid ORDER BY COUNT(*) DESC;

/*What scripts have run today and how many times did they run*/
SELECT h.scriptid, s.scriptname, COUNT(*)
FROM h_scripts AS h
LEFT JOIN lt_scripts AS s
ON h.scriptid = s.scriptid
WHERE h.starteddate  BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 DAY)
GROUP BY h.scriptid ORDER BY COUNT(*) DESC;

/*What scripts ran yesterday and how many times did they run*/
SELECT h.scriptid, s.scriptname, COUNT(*)
FROM h_scripts AS h
LEFT JOIN lt_scripts AS s
ON h.scriptid = s.scriptid
WHERE h.starteddate BETWEEN DATE_ADD(CURDATE(), INTERVAL -1 DAY) AND CURDATE()
GROUP BY h.scriptid ORDER BY COUNT(*) DESC;

