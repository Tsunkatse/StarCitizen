Write-Host "`nWe can perform below operations.`n" -ForegroundColor Cyan
Write-Host "           1.  Delete PTU\USER folder" -ForegroundColor Yellow
Write-Host "           2.  Delete LIVE\USER folder" -ForegroundColor Yellow 
Write-Host "           3.  Delete SHADER folders" -ForegroundColor Yellow 
Write-Host "           4.  DELETE ALL" -ForegroundColor Yellow

$Actions = Read-Host "`nPlease choose the action to continue"
if ($Actions -eq "") {
    Write-Host "`nPlease choose the action from the above." -ForegroundColor Red
    Exit
}

$Actions = $Actions.Trim()
$Actions = $Actions.Split(',')
$CheckActions = Compare-Object -ReferenceObject $Actions -DifferenceObject @(1..4)
if ($CheckActions | Where-Object { $_.SideIndicator -eq "<=" }) {
    Write-Host "`nPlease choose the correct action number from the above actions." -ForegroundColor Red
    exit
}

# Delete PTU\USER
if ($Actions -contains 1 -or $Actions -contains 4) { 
    Write-Host "Deleting PTU\USER folder"
    Remove-Item -LiteralPath "C:\Program Files\Roberts Space Industries\StarCitizen\PTU\USER" -Recurse
} 

# Delete LIVE\USER
if ($Actions -contains 2 -or $Actions -contains 4) { 
    Write-Host "Deleting LIVE\USER folder"
    Remove-Item -LiteralPath "C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\USER" -Recurse
} 

# Delete Shader folder
if ($Actions -contains 3 -or $Actions -contains 4) { 
    Write-Host "Deleting Shader folders"
    Remove-Item -LiteralPath "$($env:LOCALAPPDATA)\Star Citizen" -Recurse
}