#Requires -RunAsAdministrator
######## CREATED BY RENAN ZANELATO GIT @renanzanelato LINKEDIN @renan-zanelato ########
Import-Module -Force "./configs/Messages.ps1";
$Messages = [Messages]::new();

try {

Import-Module -Force "./configs/Helper.ps1";
Import-Module -Force "./configs/SqlStrings.ps1";
Import-Module -Force "./configs/Connection.ps1";

$HelperClass = [Helper]::new();

$SqlStringsClass = [SqlStrings]::new($HelperClass,$Messages);
$Connection = [Connection]::new($HelperClass);

$Messages.ShowMessageStartingOk("Change Folder Permission");
$HelperClass.ChangePermissionProjectFolder();

$Messages.ShowMessageStartingOk("Check All Databases");
[string]$Sql="";
$Sql= $SqlStringsClass.GetStringToShowAllDatabase();
$DatabasesObjects = $Connection.ExecuteQuery($Sql);

if($DatabasesObjects.Rows.Count -le 0)
{
    throw "Any database locate"
}
foreach($DataRow in $DatabasesObjects.Rows)
{
    $Messages.ShowMessageStartingOk("Doing Backup $($DataRow.name)");
    $Sql= $SqlStringsClass.GetStringToDoBackupAllDatabase($DataRow.name);
    $DatabasesObjects = $Connection.ExecuteQuery($Sql);
}
}catch [Exception]{
    $string_err = $_ | Out-String
    
    $Messages.ShowMessageException($string_err);
}
