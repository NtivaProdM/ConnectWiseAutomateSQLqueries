#Delete tickets for computers that are no longer in LT
SELECT COUNT(*) FROM `tickets` WHERE ComputerID NOT IN (SELECT ComputerID FROM computers);
DELETE FROM `tickets` WHERE ComputerID NOT IN (SELECT ComputerID FROM computers);
#Delete ticket data for tickets that have been deleted.
SELECT COUNT(*) FROM `ticketdata` WHERE TicketID NOT IN (SELECT TicketID FROM tickets);
DELETE FROM `ticketdata` WHERE TicketID NOT IN (SELECT TicketID FROM tickets);
#Delete script state for tickets that have been deleted
SELECT COUNT(*) FROM ScriptState WHERE LOWER(Variable) LIKE '%ticketid' AND VALUE NOT IN (SELECT ticketid FROM tickets);
DELETE FROM ScriptState WHERE LOWER(Variable) LIKE '%ticketid' AND VALUE NOT IN (SELECT ticketid FROM tickets);

#Delete completed tickets that are older than X days
SELECT COUNT(*) FROM `tickets` WHERE STATUS=4 AND UpdateDate < DATE_SUB(NOW(), INTERVAL 15 DAY);
#DELETE FROM `tickets` WHERE STATUS=4 AND UpdateDate < DATE_SUB(NOW(), INTERVAL 15 DAY);

#Delete all tickets older than 1 year
SELECT COUNT(*) FROM `tickets` WHERE UpdateDate < DATE_SUB(NOW(), INTERVAL 1 YEAR);
#DELETE FROM `tickets` WHERE UpdateDate < DATE_SUB(NOW(), INTERVAL 1 YEAR);

#Delete informational tickets with attachements that are older than one day.
SELECT COUNT(*) FROM Tickets WHERE SUBJECT REGEXP 'AD Schema Report for|GPO backup and Reporting for|DELETE ME -|Exchange Database Report|Exchange Server Email Stats|Exchange Server Reporting for|Exchange Server Best Practice Report for|Windows 2008 R2 Best Practice Analyzer for|RBL Check found' AND startedDate > DATE_SUB(NOW(), INTERVAL 1 DAY);
#DELETE FROM Tickets WHERE SUBJECT REGEXP 'AD Schema Report for|GPO backup and Reporting for|DELETE ME -|Exchange Database Report|Exchange Server Email Stats|Exchange Server Reporting for|Exchange Server Best Practice Report for|Windows 2008 R2 Best Practice Analyzer for|RBL Check found' AND startedDate > DATE_SUB(NOW(), INTERVAL 1 DAY);


