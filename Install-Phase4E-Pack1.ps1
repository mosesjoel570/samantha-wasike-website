Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 4E PACK 1" -ForegroundColor Green
Write-Host " Premium Contact & Footer" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$Backup = Join-Path $Root "backup"
New-Item -ItemType Directory -Force $Backup | Out-Null

$Contact = Join-Path $Root "src\components\home\Contact.tsx"
$Footer = Join-Path $Root "src\components\layout\Footer\Footer.tsx"

if(Test-Path $Contact){
    Copy-Item $Contact (Join-Path $Backup "Contact_$(Get-Date -Format yyyyMMdd_HHmmss).tsx") -Force
    Write-Host "[OK] Contact backup created." -ForegroundColor Green
}

if(Test-Path $Footer){
    Copy-Item $Footer (Join-Path $Backup "Footer_$(Get-Date -Format yyyyMMdd_HHmmss).tsx") -Force
    Write-Host "[OK] Footer backup created." -ForegroundColor Green
}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 4E PACK 1 READY" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next: Pack 2A - Premium Contact Component" -ForegroundColor Yellow