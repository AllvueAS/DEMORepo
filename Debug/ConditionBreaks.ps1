Set-DbatoolsInsecureConnection -SessionOnly | Out-Null
$databases = Get-DbaDatabase -SqlInstance DEVBC1401 -ExcludeSystem |Where-Object {$_.Name -notlike '*Pool*'} |Sort-Object Name
foreach ($database in $databases) {
    try {
        Invoke-DbaQuery -SqlInstance DEVBC1401 -Database $database.Name -Query "SELECT TOP 1 Id FROM dbo.Company" -EnableException | out-null 
        Write-Output "Got data from the $($database.Name) database."  
    }
    catch {
        Write-Host "Can not get information from the $($database.Name) database." -ForegroundColor Red
    }
}