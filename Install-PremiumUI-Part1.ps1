Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PREMIUM UI - PART 1" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "[1/3] Creating backup..." -ForegroundColor Yellow

$Time = Get-Date -Format "yyyyMMdd_HHmmss"

$Backup = "..\backups\PremiumUI_$Time"

New-Item `
    -ItemType Directory `
    -Force `
    -Path $Backup | Out-Null

Copy-Item `
    ".\src" `
    "$Backup\src" `
    -Recurse `
    -Force

Write-Host "[OK] Backup created." -ForegroundColor Green

Write-Host ""
Write-Host "[2/3] Checking Tailwind..." -ForegroundColor Yellow

if(Test-Path ".\tailwind.config.js"){
    Write-Host "[OK] Tailwind Config Found" -ForegroundColor Green
}
elseif(Test-Path ".\tailwind.config.ts"){
    Write-Host "[OK] Tailwind Config Found" -ForegroundColor Green
}
else{
    Write-Host "[WARNING] Tailwind config not found." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "[3/3] Premium UI preparation complete." -ForegroundColor Green

Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PART 1 COMPLETE" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "Next: Install-PremiumUI-Part2.ps1"