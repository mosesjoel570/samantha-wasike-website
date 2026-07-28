Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 7A PACK 1" -ForegroundColor Green
Write-Host " SEO, Performance & Production Optimization" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location
$Backup = Join-Path $Root "backup"

New-Item -ItemType Directory -Force $Backup | Out-Null

$Files = @(
"index.html",
"vite.config.ts",
"package.json",
"src/main.tsx",
"src/App.tsx"
)

foreach($File in $Files){

    $Path = Join-Path $Root $File

    if(Test-Path $Path){

        Copy-Item `
            $Path `
            (Join-Path $Backup ((Split-Path $File -Leaf)+"_"+(Get-Date -Format yyyyMMdd_HHmmss))) `
            -Force

        Write-Host "[OK] Backup:" (Split-Path $File -Leaf) -ForegroundColor Green

    }

}

Write-Host ""
Write-Host "[OK] Production backups completed." -ForegroundColor Green
Write-Host ""

Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 7A PACK 1 READY" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Next: Pack 2A - SEO Metadata & Performance Optimization"