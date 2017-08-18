#
# Update the -LocationID xxx parameter with the locationID you wish the agent to install under.
#

(new-object Net.WebClient).DownloadString('http://bit.ly/LTPoSh') | iex;

Test-LTPorts

Get-LTError
