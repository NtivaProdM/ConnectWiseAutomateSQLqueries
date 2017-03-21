/*
 Description    : Returns all EDF info for all clients in Netmon with MW enabled
 Source URL     : https://github.com/NtivaProdM/ConnectWiseAutomateSQLqueries
 Returns        :
 Tested Versions:
  LabTech 10.5
 */

SELECT  
   Computers.ComputerID AS `id`,
   Clients.Name AS `Client Name`,
   Computers.Name AS `Computer Name`,
   Computers.Domain, Computers.UserName AS `Username`,
   v_extradataclients.`Managed Workstation` AS `v_extradataclients_Managed Workstation`,
   v_extradatalocations.`Managed Workstation Exclude` AS `v_extradatalocations_Managed Workstation Exclude`,
   v_extradataclients.`MW Laptops` AS `v_extradataclients_MW Laptops`, 
   v_extradatalocations.`MW Laptop Exclude` AS `v_extradatalocations_MW Laptop Exclude`, 
   v_extradatacomputers.`Managed Workstation - Exclude` AS `v_extradatacomputers_Managed Workstation - Exclude`,
   v_extradataclients.`Week 1` AS `v_extradataclients_Week 1`,
   v_extradataclients.`LT Week 1` AS `v_extradataclients_LT Week 1`, 
   v_extradataclients.`Week 2` AS `v_extradataclients_Week 2`,
   v_extradataclients.`LT Week 2` AS `v_extradataclients_LT Week 2`, 
   v_extradataclients.`Week 3` AS `v_extradataclients_Week 3`,
   v_extradataclients.`LT Week 3` AS `v_extradataclients_LT Week 3`, 
   v_extradataclients.`Week 4` AS `v_extradataclients_Week 4`,
   v_extradataclients.`LT Week 4` AS `v_extradataclients_LT Week 4`,
   v_extradataclients.`Week Last` AS `v_extradataclients_Week Last`,
   v_extradataclients.`LT Week Last` AS `v_extradataclients_LT Week Last`,
   v_extradataclients.`Week Other` AS `v_extradataclients_Week Other`,  
   Computers.OS,
   Computers.BiosFlash
FROM Computers, Clients, v_extradataclients , v_extradatalocations , v_extradatacomputers 
WHERE Computers.ClientID = Clients.ClientID
 AND v_extradataclients.ClientID = Computers.ClientID
 AND v_extradatalocations.LocationID = Computers.LocationID
 AND v_extradatacomputers.ComputerID = Computers.ComputerID
 AND ((v_extradataclients.`Managed Workstation` = 1) OR (v_extradataclients.`MW Laptops` = 1))
 AND ((v_extradatalocations.`Managed Workstation Exclude` <> 1)
 AND (v_extradatalocations.`MW Laptop Exclude` <> 1)
 AND (v_extradatacomputers.`Managed Workstation - Exclude` <> 1) 
 AND (Computers.OS NOT LIKE '%server%') 
 AND (Computers.OS LIKE '%windows%'))
 LIMIT 10000; 
 
