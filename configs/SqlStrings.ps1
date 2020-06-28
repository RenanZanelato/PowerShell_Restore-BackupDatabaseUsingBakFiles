######## CREATED BY RENAN ZANELATO GIT @renanzanelato LINKEDIN @renan-zanelato ########

class SqlStrings 
{
    [Helper] $Helper;
    [Messages] $Messages;
    SqlStrings( [Helper] $Helper, [Messages] $Messages){
        $this.Helper = $Helper;
        $this.Messages = $Messages;
    }
    
    ########### CONFIGS SQL MANAGER ############################
    [string] GetStringRestoreBakFile([string] $bakFileName)
    {
         $sqlString = $($this.GetSqlFile("RestoreFile"));
         $sqlString = [string]::Format($sqlString, $bakFileName,$this.Helper.GetBakFolder(),$this.Helper.GetMdfFolder(),$this.Helper.GetLdfFolder());
         $this.Messages.ShowMessageWarning($sqlString);
        return $sqlString;
    }
    [string] GetStringDropDatabase([string] $bakFileName)
    {
         $sqlString = $($this.GetSqlFile("DropDatabase"));
         $sqlString = [string]::Format($sqlString, $bakFileName); 
         $this.Messages.ShowMessageWarning($sqlString);
         return $sqlString;
    }

    [string] GetStringToShowAllDatabase()
    {
         $sqlString = $($this.GetSqlFile("ShowDatabases"));
         $this.Messages.ShowMessageWarning($sqlString);
        return $sqlString;
    }
    [string] GetStringToDoBackupAllDatabase([string] $bakFileName)
    {
         $sqlString = $($this.GetSqlFile("BackupFile"));
         $sqlString = [string]::Format($sqlString, $bakFileName,$this.Helper.GetBakFolder()); 
         $this.Messages.ShowMessageWarning($sqlString);
         return $sqlString;
    }

    [string] GetSqlFile([string]$LocalFile)
    {
       $this.Messages.ShowMessageStartingOk("Coletando SQL de $LocalFile");
       
       [string]$sql = $(Get-Content "$($this.Helper.GetSqlFolder())/$($LocalFile).sql") -join "`n";
       return $sql ;
    }
    

}