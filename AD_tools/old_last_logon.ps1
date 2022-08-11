Import-Module activedirectory

$presentdate= Get-Date
# get user that are not connected since 90 and which are not disabled
$output=Get-ADUser -Filter * -Properties lastlogondate | Where-Object {$_.lastlogondate -lt $presentdate.adddays(-90) -and $_.Enabled -eq $true} | Select-Object name
Write-Host "The following users are inactive : "
$output
