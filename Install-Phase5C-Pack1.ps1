Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 5C PACK 1" -ForegroundColor Green
Write-Host " Premium Navigation Animations" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location
$Backup = Join-Path $Root "backup"

New-Item -ItemType Directory -Force $Backup | Out-Null

$Files = @(
"src\components\layout\Navbar\Navbar.tsx",
"src\layouts\MainLayout.tsx"
)

foreach($File in $Files){

    $Path = Join-Path $Root $File

    if(Test-Path $Path){

        Copy-Item $Path `
            (Join-Path $Backup ((Split-Path $File -Leaf)+"_"+(Get-Date -Format yyyyMMdd_HHmmss))) `
            -Force

        Write-Host "[OK] Backup:" (Split-Path $File -Leaf) -ForegroundColor Green

    }

}

Write-Host ""
Write-Host "[OK] Backups completed." -ForegroundColor Green
Write-Host ""

Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 5C PACK 1 READY" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Next: Pack 2A - Animated Premium Navbar" -ForegroundColor Yellow