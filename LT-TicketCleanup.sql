#Delete tickets for computers that are no longer in LT
DELETE FROM `tickets` WHERE ComputerID NOT IN (SELECT ComputerID FROM computers);
#Delete completed tickets that are older than X days
DELETE FROM `tickets` WHERE STATUS=4 AND UpdateDate < DATE_SUB(NOW(), INTERVAL 15 DAY);
#Delete all tickets older than 1 year
DELETE FROM `tickets` WHERE UpdateDate < DATE_SUB(NOW(), INTERVAL 1 YEAR);
#Delete informational tickets with attachements that are older than one day.
DELETE FROM Tickets WHERE SUBJECT REGEXP 'AD Schema Report for|GPO backup and Reporting for|DELETE ME -|Exchange Database Report|Exchange Server Email Stats|Exchange Server Reporting for|Exchange Server Best Practice Report for|Windows 2008 R2 Best Practice Analyzer for|RBL Check found' AND startedDate > DATE_SUB(NOW(), INTERVAL 1 DAY);
#Delete ticket data for tickets that have been deleted.
DELETE FROM `ticketdata` WHERE TicketID NOT IN (SELECT TicketID FROM tickets);
#Delete script state for tickets that have been deleted
DELETE FROM ScriptState WHERE LOWER(Variable) LIKE '%ticketid' AND VALUE NOT IN (SELECT ticketid FROM tickets);

