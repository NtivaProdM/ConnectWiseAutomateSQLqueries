# 
# Use to reinstall the CW Automate/Netmon agent
# Other parameters you can use
#  -LocationID xxx
#  -Backup
# The LocationID is not required
# The Backup parameter will make a backup of registry settings before reinstalling
#

(new-object Net.WebClient).DownloadString('http://bit.ly/LTPoSh') | iex; Reinstall-LTService -Server https://netmon.ntiva.com -Password IS6DW1gtOTo8H73rkyF999g+54yZ0EPV
