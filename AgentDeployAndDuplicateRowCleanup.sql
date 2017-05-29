/*
 Description    : Cleans up Agent Deploy tables of duplicates
 Source URL     : https://github.com/NtivaProdM/ConnectWiseAutomateSQLqueries
 Returns        :
 Tested Versions:
  LabTech 10.5
 Can technically be used on any table to remove duplicates as well using same scheme. Use > to select/keep the oldest ID and use < to select/keep the newest ID.
*/

#Used to select rows that are duplicates#
SELECT * FROM nt_adcomputers_blacklist t1, nt_adcomputers_blacklist t2 WHERE t1.id > t2.id AND t1.`AD_Name` = t2.`AD_Name` AND t1.`ClientID` = t2.`ClientID`;

#Used to actually remove rows (will keep the newest ID) for entries that have the same AD_Name and ClientID
DELETE t1 FROM nt_adcomputers_blacklist t1, nt_adcomputers_blacklist t2 WHERE t1.id < t2.id AND t1.`AD_Name` = t2.`AD_Name` AND t1.`ClientID` = t2.`ClientID`;

/*
  Used to select distinct entries only - should probably actually update the Agent Deploy LT script itself to utilize this query instead of whatever it's using now 
  to avoid the scenario that started this where the scriptloop went through hundreds of repeated entries in the table to populate the client blacklist EDF.
*/
SELECT DISTINCT nt_adcomputers_blacklist.`AD_Name`, nt_adcomputers_blacklist.`ClientID` FROM nt_adcomputers_blacklist;