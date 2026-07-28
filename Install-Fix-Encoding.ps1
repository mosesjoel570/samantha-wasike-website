# ==========================================================
# Dr. Samantha Hospital Website
# Encoding Fix Installer
# ==========================================================

Clear-Host
$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " Fixing Text Encoding" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

$Files = Get-ChildItem (Join-Path $ProjectRoot "src") -Recurse -Include *.tsx,*.ts

foreach ($File in $Files) {

    Write-Host "Processing $($File.Name)..."

    $Content = Get-Content $File.FullName -Raw

    # Remove the Unicode replacement character
    $Content = $Content -replace [char]0xFFFD,''

    # Remove leading question-mark bullets like:
    # ? Experienced Healthcare Team
    $Content = $Content -replace '(?m)^\?\s+',''

    # Replace bullet separators with |
    $Content = $Content -replace 'Compassion.+Excellence.+Care','Compassion | Excellence | Care'

    Set-Content -Path $File.FullName -Value $Content -Encoding utf8

    Write-Host "[OK] $($File.Name)" -ForegroundColor Green
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host " Encoding Fix Complete" -ForegroundColor Green
Write-Host "=========================================="