//*
Description       : Get a list of unused groups.
Source URL        : https://github.com/NtivaProdM/ConnectWiseAutomateSQLqueries/
Tested Versions   :
  LabTech 10.5
Table Aliases     :
  Groups                - mastergroups
  
*/

SELECT @GROUP_COUNT := (COUNT(*) * 5) FROM mastergroups;

SET SESSION GROUP_CONCAT_MAX_LEN = @GROUP_COUNT;

SELECT @SAFE_GROUPS := GROUP_CONCAT(DISTINCT(mastergroups.GroupID))
FROM mastergroups
WHERE
  (mastergroups.FullName LIKE '_System Automation%'
   OR mastergroups.FullName LIKE 'All Agents'
   OR mastergroups.FullName LIKE 'All Clients%'
   OR mastergroups.FullName LIKE 'Agent Types%'
   OR mastergroups.FullName LIKE 'Patching%'
   OR mastergroups.FullName LIKE 'Network Devices%'
#   OR mastergroups.FullName LIKE 'Antivirus Management%'
#   OR mastergroups.FullName LIKE 'Software Deployment%'
#   OR mastergroups.FullName LIKE 'SM%'
#   OR mastergroups.FullName LIKE 'Client Groups%'
#   OR mastergroups.FullName LIKE 'Cloud%'
#   OR mastergroups.FullName LIKE '_Ntiva Automation%'
#   OR mastergroups.FullName LIKE '_Svc+%'
#   OR mastergroups.FullName LIKE '_Temp%'
#   OR mastergroups.FullName LIKE '_Test%'
#   OR mastergroups.FullName LIKE '_TestNtiva%'
   OR mastergroups.FullName LIKE 'Windows Updates%'); # custom groups

SELECT
  Groups.GroupId            AS `GroupId`,
  Groups.FullName           AS `FullName`,
  IFNULL(Searches.Name, '') AS `AutoJoinScript`,
  Groups.LimitToParent      AS `LimitToParent`
FROM `mastergroups` AS Groups
  LEFT JOIN `sensorchecks` AS Searches ON Groups.AutoJoinScript = Searches.SensID
WHERE (FIND_IN_SET(Groups.GroupId, @SAFE_GROUPS) <= 0)
ORDER BY Groups.FullName ASC;

