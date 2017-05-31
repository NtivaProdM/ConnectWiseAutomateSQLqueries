SELECT clients.`Name`, plugin_webroot_clientsettings.`ClientID`, plugin_webroot_clientsettings.`Keycode`, plugin_webroot_clientsettings.`autoDeploy` FROM plugin_webroot_clientsettings LEFT JOIN clients ON clients.`ClientID` = plugin_webroot_clientsettings.`ClientID`
WHERE plugin_webroot_clientsettings.`autoDeploy` = 0;

