/*
This will remove old ticket data (as we utilize a CW Automate --> CW Manage sync for tickets, keeping old ticket data around is not necessary.
*/

# This will initially show you the count of items that will be removed
SELECT COUNT(*) FROM `tickets` WHERE ComputerID NOT IN (SELECT ComputerID FROM computers);
SELECT COUNT(*) FROM `tickets` WHERE STATUS=4 AND UpdateDate < NOW() - INTERVAL 30 DAY;
SELECT COUNT(*) FROM `tickets` WHERE UpdateDate < DATE_SUB(NOW(), INTERVAL 1 YEAR);

# This is where the magic starts to happen
DELETE FROM `tickets` WHERE ComputerID NOT IN (SELECT ComputerID FROM computers);
DELETE FROM `tickets` WHERE STATUS=4 AND UpdateDate < NOW() - INTERVAL 30 DAY;
DELETE FROM `tickets` WHERE UpdateDate < DATE_SUB(NOW(), INTERVAL 1 YEAR);

# Now we can see all of the ticketdata we get to remove as well
SELECT COUNT(*) FROM `ticketdata` WHERE TicketID NOT IN (SELECT TicketID FROM tickets);

# And actually delete that ticketdata
DELETE FROM `ticketdata` WHERE TicketID NOT IN (SELECT TicketID FROM tickets);
DELETE FROM ScriptState WHERE LOWER(Variable) LIKE '%ticketid' AND VALUE NOT IN (SELECT ticketid FROM tickets);

# Now all of these should return 0 for count
SELECT COUNT(*) FROM `tickets` WHERE ComputerID NOT IN (SELECT ComputerID FROM computers);
SELECT COUNT(*) FROM `tickets` WHERE STATUS=4 AND UpdateDate < NOW() - INTERVAL 30 DAY;
SELECT COUNT(*) FROM `tickets` WHERE UpdateDate < DATE_SUB(NOW(), INTERVAL 1 YEAR);
SELECT COUNT(*) FROM `ticketdata` WHERE TicketID NOT IN (SELECT TicketID FROM tickets);
SELECT COUNT(*) FROM ScriptState WHERE LOWER(Variable) LIKE '%ticketid' AND VALUE NOT IN (SELECT ticketid FROM tickets);
