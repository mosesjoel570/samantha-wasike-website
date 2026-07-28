Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 4C" -ForegroundColor Green
Write-Host " Premium Services, Doctor & Testimonials" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location
$Backup = Join-Path $Root "backup"

if (!(Test-Path $Backup)) {
    New-Item -ItemType Directory -Force $Backup | Out-Null
}

Write-Host "[OK] Backup folder ready." -ForegroundColor Green

$Files = @(
    "src\components\home\Services.tsx",
    "src\components\home\Doctor.tsx",
    "src\components\home\Testimonials.tsx"
)

foreach ($File in $Files) {

    if (Test-Path $File) {

        $Name = Split-Path $File -Leaf
        Copy-Item $File (Join-Path $Backup "$Name.bak") -Force

        Write-Host "[OK] Backup created for $Name" -ForegroundColor Green
    }
    else {

        Write-Host "[WARNING] Missing $File" -ForegroundColor Yellow
    }

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 4C PACK 1 READY" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next: Premium Services Component"