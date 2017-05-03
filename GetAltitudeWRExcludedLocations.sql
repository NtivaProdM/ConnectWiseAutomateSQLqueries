SELECT
`clients`.`Name`,
`locations`.`Name`,
`plugin_webroot_locationsettings`.`autoDeployExclude`
FROM `locations`
JOIN `clients`
ON `clients`.`ClientID` = `locations`.`ClientID`
JOIN `plugin_webroot_locationsettings`
ON `plugin_webroot_locationsettings`.`LocationID` = `locations`.`LocationID`
WHERE (INSTR(Locations.Name,'Altitude') > 0);
