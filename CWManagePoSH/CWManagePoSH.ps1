/*
This contains the following commandlets:

Connect-ConnectWiseManage
   This will create the connection to the manage server.
   
Get-CWConfig
  This function will allow you to search for Manage configurations.

Get-CWAddition
  This function will list additions to a Manage agreement.

Get-ChargeCode
  Gets a list of charge codes

Update-CWAddition
  This will update an addition to an agreement.

Get-CWAgreement
  This function will list agreements based on conditions.

Get-CWCompany
  This function will list companies based on conditions.
  
Get-CWTicket


Remove-CWAddition
  This function will remove additions from a Manage agreement.
*/

(new-object Net.WebClient).DownloadString('http://bit.ly/CWMPoSh') | iex;
