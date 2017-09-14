SELECT 
 passwords.`PasswordID`
,clients.`Name` AS `Client Name`
,passwords.`ClientID`
,locations.`Name` AS `Location Name`
,passwords.`LocationID`
,Title
,UserName
,CONVERT(AES_DECRYPT(Passwords.password,SHA(CONCAT(' ',passwords.`ClientID` + 1))) USING utf8) AS `Password`
FROM
passwords 
LEFT JOIN clients ON passwords.`ClientID` = clients.`ClientID` 
LEFT JOIN locations ON locations.`ClientID` = passwords.`ClientID`
;
