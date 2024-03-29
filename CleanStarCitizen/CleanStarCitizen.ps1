<#
    .SYNOPSIS
    PowerShell script that deletes Star Citizen stuff

    THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND. THE ENTIRE 
    RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.

    .DESCRIPTION
    Removes Star Citizen stuff
    * USER folders
    * Shared Cache

    .NOTES
    USE AT YOUR OWN RISK

    .INPUTS
    Nothing

    .EXAMPLE
    .\CleanStarCitizen.ps1
#>

Write-Host "`nWe can perform below operations.`n" -ForegroundColor Cyan
Write-Host "           1.  Delete LIVE\USER folder" -ForegroundColor Yellow
Write-Host "           2.  Delete PTU\USER folder" -ForegroundColor Yellow 
Write-Host "           3.  Delete EPTU\USER folder" -ForegroundColor Yellow 
Write-Host "           4.  Delete HOTFIX\USER folder" -ForegroundColor Yellow
Write-Host "           5.  Delete TECH-PREVIEW\USER folder" -ForegroundColor Yellow
Write-Host "           6.  Delete SHADER folders" -ForegroundColor Yellow 
Write-Host "           7.  DELETE ALL" -ForegroundColor Yellow

$Actions = Read-Host "`nPlease choose the action to continue"
if ($Actions -eq "") {
    Write-Host "`nPlease choose the action from the above." -ForegroundColor Red
    Exit
}

$BaseFolder = "C:\Program Files\Roberts Space Industries\StarCitizen\"
$Actions = $Actions.Trim()
$Actions = $Actions.Split(',')
$CheckActions = Compare-Object -ReferenceObject $Actions -DifferenceObject @(1..7)
if ($CheckActions | Where-Object { $_.SideIndicator -eq "<=" }) {
    Write-Host "`nPlease choose the correct action number from the above actions." -ForegroundColor Red
    exit
}

# Delete LIVE\USER
if ($Actions -contains 1 -or $Actions -contains 7) { 
    $CurrentFolder = $BaseFolder + "LIVE\USER"

    if (Test-Path -Path $CurrentFolder) {
        Write-Host "Deleting LIVE\USER folder"
        Remove-Item -LiteralPath $CurrentFolder -Recurse
    }
    else {
        Write-Host "$($CurrentFolder) does not exist" -ForegroundColor Yellow
    }
    
} 

# Delete PTU\USER
if ($Actions -contains 2 -or $Actions -contains 7) { 
    Write-Host "Deleting PTU\USER folder"
    Remove-Item -LiteralPath "C:\Program Files\Roberts Space Industries\StarCitizen\PTU\USER" -Recurse
} 

# Delete EPTU\USER
if ($Actions -contains 3 -or $Actions -contains 7) { 
    Write-Host "Deleting EPTU\USER folder"
    Remove-Item -LiteralPath "C:\Program Files\Roberts Space Industries\StarCitizen\EPTU\USER" -Recurse
} 

# Delete HOTFIX\USER
if ($Actions -contains 4 -or $Actions -contains 7) { 
    Write-Host "Deleting HOTFIX\USER folder"
    Remove-Item -LiteralPath "C:\Program Files\Roberts Space Industries\StarCitizen\HOTFIX\USER" -Recurse
} 

# Delete TECH-PREVIEW\USER
if ($Actions -contains 5 -or $Actions -contains 7) { 
    Write-Host "Deleting TECH-PREVIEW\USER folder"
    Remove-Item -LiteralPath "C:\Program Files\Roberts Space Industries\StarCitizen\TECH-PREVIEW\USER" -Recurse
}

# Delete Shader folder
if ($Actions -contains 6 -or $Actions -contains 7) { 
    Write-Host "Deleting Shader folders"
    Remove-Item -LiteralPath "$($env:LOCALAPPDATA)\Star Citizen" -Recurse
}