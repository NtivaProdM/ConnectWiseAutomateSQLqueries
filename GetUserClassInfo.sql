/*
 Description    : Returns User Information for LabTech
 Source URL     : https://github.com/NtivaProdM/ConnectWiseAutomateSQLqueries
 Returns        :
 Tested Versions:
  LabTech 10.5
 Remove the # before the WHERE to limit the search to specific folders.
 e.g. #WHERE u.FolderID = x /* for %folder% */
 */
 
 SELECT
 u.Name,
 GROUP_CONCAT(DISTINCT c.`Name`) AS `Class`,
 GROUP_CONCAT(DISTINCT g.`Name`) AS `Group`,
 u.Last_Date AS `Last Login`
FROM
 `users` u
 JOIN userclasses c
 ON FIND_IN_SET(c.ClassID, u.ClientID)
 JOIN `mastergroups` g
 ON FIND_IN_SET(g.GroupID, u.Secondary)
#WHERE u.FolderID = 0 /* for top-level folder */
#WHERE u.FolderID = 1 /* for template accounts */
#WHERE u.FolderID = 2 /* for service accounts */
#WHERE u.FolderID = 3 /* for Ntiva Users */
#WHERE u.FolderID = 4 /* for Client Accounts */
#WHERE u.FolderID = 5 /* for Test Accounts */
#WHERE u.FolderID = 6 /* for DisabledUsers */
GROUP BY u.Name;
