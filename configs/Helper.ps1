######## CREATED BY RENAN ZANELATO GIT @renanzanelato LINKEDIN @renan-zanelato ########

class Helper 
{
    #[String]$Server="$env:computername";
    [String]$Server="$env:computername\SQLEXPRESS";
    #If your SqlServer use SqlExpress, only change the coments 
    [String]$UID="$env:computername\$env:username";
    [System.Object[]] $BakFiles;
    Helper(){
        $this.ScanBakDir();
    }
    [string] GetFolder(){
        return (Get-Location).Path;
    }
    [string] GetBakFolder(){
        return "$($this.GetFolder())/objects/bakFiles";
    }
    [string] GetLdfFolder(){
        return "$($this.GetFolder())/objects/ldf";
    }
    [string] GetMdfFolder(){
        return "$($this.GetFolder())/objects/mdf";
    }
    [string] GetSqlFolder(){
        return "$($this.GetFolder())/sqls";
    }

    [Bool]CheckFileExist([string]$LocalFile)
    {
        return Test-Path $LocalFile -PathType leaf;
    }
    [void]ChangePermissionFolder([string]$Path){
        $Acl = Get-ACL $Path
        $AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule("everyone","FullControl","ContainerInherit,Objectinherit","none","Allow")
        $Acl.AddAccessRule($AccessRule)
        Set-Acl $Path $Acl
    }
    [void]ChangePermissionProjectFolder(){
        $this.ChangePermissionFolder($this.GetFolder());
    }
    [void]ScanBakDir()
    {
        $this.BakFiles = Get-ChildItem $this.GetBakFolder() -Filter *.bak
    }

}