Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 4D PACK 1" -ForegroundColor Green
Write-Host " Premium Gallery & Appointment Section" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$Backup = Join-Path $Root "backup"
New-Item -ItemType Directory -Force $Backup | Out-Null

$Gallery = Join-Path $Root "src\components\home\Gallery.tsx"
$Appointment = Join-Path $Root "src\components\home\AppointmentCTA.tsx"

if(Test-Path $Gallery){
    Copy-Item $Gallery (Join-Path $Backup "Gallery_$(Get-Date -Format yyyyMMdd_HHmmss).tsx") -Force
    Write-Host "[OK] Gallery backup created." -ForegroundColor Green
}

if(Test-Path $Appointment){
    Copy-Item $Appointment (Join-Path $Backup "AppointmentCTA_$(Get-Date -Format yyyyMMdd_HHmmss).tsx") -Force
    Write-Host "[OK] Appointment backup created." -ForegroundColor Green
}

Write-Host ""
Write-Host "[OK] Backups complete." -ForegroundColor Green
Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 4D PACK 1 READY" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next: Pack 2A - Premium Gallery Component" -ForegroundColor Yellow