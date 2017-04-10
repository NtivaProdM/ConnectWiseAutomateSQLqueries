SELECT
	cl.name AS `Client`
    ,COUNT(DISTINCT c.computerid) AS `Computers`
    ,IFNULL(wcl.webrootgroup,'') AS `Client Webroot Group`
    ,IFNULL(wcl.keycode,'') AS `Client Keycode`
    ,IF(wcl.autoDeploy,'True','False') AS `Client Auto Deploy`
    ,GROUP_CONCAT(DISTINCT IFNULL(wl.name,'')) AS `Excluded Locations (Install)`
    ,GROUP_CONCAT(DISTINCT IFNULL(wci.name,'')) AS `Excluded Computers (Install)`
    ,GROUP_CONCAT(DISTINCT IFNULL(wcs.name,'')) AS `Excluded Computers (Scan)`
FROM clients cl
LEFT JOIN plugin_webroot_clientsettings wcl ON cl.clientid = wcl.clientid
LEFT JOIN locations l ON cl.clientid = l.clientid
LEFT JOIN (SELECT l1.locationid, l1.name 
			FROM plugin_webroot_locationsettings wl1
            JOIN locations l1 ON l1.locationid = wl1.locationid
				AND wl1.autoDeployExclude = 1
			) wl ON wl.locationid = l.locationid 
LEFT JOIN computers c ON c.locationid = l.locationid
LEFT JOIN (SELECT c1.computerid, c1.name 
			FROM plugin_webroot_computersettings wc1
            JOIN computers c1 ON c1.computerid = wc1.computerid
				AND wc1.WRExcludeInstall = 1
			) wci ON wci.computerid = c.computerid
LEFT JOIN (SELECT c2.computerid, c2.name 
			FROM plugin_webroot_computersettings wc2
            JOIN computers c2 ON c2.computerid = wc2.computerid
				AND wc2.WRExcludeScan = 1
			) wcs ON wcs.computerid = c.computerid
GROUP BY cl.clientid
ORDER BY cl.name

