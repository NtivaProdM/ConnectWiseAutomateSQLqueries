SELECT 
	v_extradataclients.`name` AS 'Client Name'
,	v_extradataclients.`MaV - Minimum Billing Count`
,	v_extradataclients.`Managed AV`
FROM v_extradataclients
WHERE
v_extradataclients.`Managed AV` <> 1
ORDER BY v_extradataclients.`MaV - Minimum Billing Count` DESC;

