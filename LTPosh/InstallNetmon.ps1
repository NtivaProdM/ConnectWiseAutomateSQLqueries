#
# Update the -LocationID xxx parameter with the locationID you wish the agent to install under.
# If you do not specific a locationID, it will utilize the default locationID of 1, and uninstall automatically.
#
(new-object Net.WebClient).DownloadString('http://bit.ly/LTPoSh') | iex; Install-LTService -Server https://netmon.ntiva.com -Password IS6DW1gtOTo8H73rkyF999g+54yZ0EPV -LocationID xxx
