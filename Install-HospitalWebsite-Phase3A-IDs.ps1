# ==========================================================
# Dr. Samantha Hospital Website
# Phase 3A - Add Section IDs Automatically
# ==========================================================

Clear-Host
$ErrorActionPreference = "Stop"

function Add-SectionId {
    param(
        [string]$File,
        [string]$Id
    )

    if (!(Test-Path $File)) {
        Write-Host "[SKIPPED] $File not found." -ForegroundColor Yellow
        return
    }

    $Content = Get-Content $File -Raw

    if ($Content -match "id=`"$Id`"") {
        Write-Host "[OK] $Id already exists in $File"
        return
    }

    $Regex = New-Object System.Text.RegularExpressions.Regex("<section([^>]*)>")
    $Updated = $Regex.Replace($Content,"<section id=`"$Id`"`$1>",1)

    [System.IO.File]::WriteAllText(
        (Resolve-Path $File),
        $Updated,
        (New-Object System.Text.UTF8Encoding($false))
    )

    Write-Host "[UPDATED] $File -> id='$Id'" -ForegroundColor Green
}

Add-SectionId "src\pages\Home.tsx" "home"
Add-SectionId "src\components\home\About.tsx" "about"
Add-SectionId "src\components\home\Services.tsx" "services"
Add-SectionId "src\components\home\Doctor.tsx" "doctor"
Add-SectionId "src\components\home\Gallery.tsx" "gallery"
Add-SectionId "src\components\home\Contact.tsx" "contact"

Write-Host ""
Write-Host "===================================" -ForegroundColor Green
Write-Host "IDs Added Successfully" -ForegroundColor Green
Write-Host "===================================" -ForegroundColor Green
