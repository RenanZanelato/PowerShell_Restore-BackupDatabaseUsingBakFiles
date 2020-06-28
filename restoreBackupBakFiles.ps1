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

$Messages.ShowMessageStartingOk("List Bak Files");

if($HelperClass.BakFiles.Count -le 0)
{
    throw "Doesn't have any bak file in the folder"
}

$Messages.ShowMessageStartingOk("Start Import/Restore Bak Files");
[string]$Sql="";
foreach($BakFileChildrenClass in $HelperClass.BakFiles)
    {
        [string]$BakFile=$BakFileChildrenClass.BaseName;
        $Messages.ShowMessageStartingOk($BakFile);
        $Messages.ShowMessageStartingOk("Drop Database");
        $Sql = $SqlStringsClass.GetStringDropDatabase($BakFile);
        $Connection.ExecuteQuery($Sql);
        $Messages.ShowMessageStartingOk("Restore Database");
        $Sql = $SqlStringsClass.GetStringRestoreBakFile($BakFile);
        $Connection.ExecuteQuery($Sql);
    }
}catch [Exception]{
    $string_err = $_ | Out-String
    
    $Messages.ShowMessageException($string_err);
}
