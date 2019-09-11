$AzureSQLServerName = "rafte89db"
$AzureSQLDatabaseName = "TestAutomation"
 
$AzureSQLServerName = $AzureSQLServerName + ".database.windows.net"
$Cred = Get-AutomationPSCredential -Name "TAFSQLLogin"
$SQLOutput = $(Invoke-Sqlcmd -ServerInstance $AzureSQLServerName -Username $Cred.UserName -Password $Cred.GetNetworkCredential().Password -Database $AzureSQLDatabaseName -Query "exec [dbo].[usp_ClearTestRunData] @ConfirmDelete=1" -QueryTimeout 65535 -ConnectionTimeout 60 -Verbose) 4>&1
 
Write-Output $SQLOutput