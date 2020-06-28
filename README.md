# Automatic Restore Bak files in local environment

## Before Execute settings.ps1
    - SQL Server installed in your computer
    - Administrator access in your computer
## How to use
  - Clone this Repository
  - Save .Bak files in **objects/bakFiles**
  - Opens PowerShell with Administrator Authorization 
  - Execute the Command **Set-ExecutionPolicy -ExecutionPolicy unrestricted**
  - Execute the file **./settings.ps1** in folder root.

## Attention
  - SqlServer Credentials used are that of windows authentication, maybe you need to open file **Params.ps1** and change the Parameter **$Server** . 
  - Every execute, the settings check if your database exists .. if exist will delete and restore by bakfile.

