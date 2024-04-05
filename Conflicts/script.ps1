$directory = "C:\Path\To\Directory"

$files = Get-ChildItem -Path $directory -File -Recurse
$totalSize = $files | Measure-Object -Property Length -Sum

Write-Host "Total size of files in $directory: $($totalSize.Sum) bytes"