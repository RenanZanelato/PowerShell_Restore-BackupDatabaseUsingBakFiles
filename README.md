# Automatic Restore Bak files in local environment

## Requirements
- SQL Server installed in the computer
- Administrator Access for the computer
## How to use
  - Clone this Repository
  - Save .Bak files in **objects/bakFiles**
  - Opens PowerShell with Administrator Authorization 
  - Execute the Command **Set-ExecutionPolicy -ExecutionPolicy unrestricted**
  - Execute restoreBackupBakFiles.ps1 to restore a backup
  - Execute createBackupBakFiles.ps1 to create a backup

## Attention
  - These scripts use by default the Windows Authentication method to pass the SqlServer credentials. If necessary, it can be changed in the Params.ps1 file on the  $Server parameter
- Be aware! On every execution restoreBackupBakFiles check if your database exists and if so, it'll delete it and restore using the bakfile..

