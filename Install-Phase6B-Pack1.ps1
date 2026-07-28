Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 6B PACK 1" -ForegroundColor Green
Write-Host " Advanced UI Polish & Responsive Optimization" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location
$Backup = Join-Path $Root "backup"

New-Item -ItemType Directory -Force $Backup | Out-Null

$Files = @(
"src/components/layout/Navbar/Navbar.tsx",
"src/components/layout/Footer/Footer.tsx",
"src/components/home/Hero.tsx",
"src/components/home/About.tsx",
"src/components/home/Services.tsx",
"src/components/home/Doctor.tsx",
"src/components/home/Gallery.tsx",
"src/components/home/Testimonials.tsx",
"src/components/home/AppointmentCTA.tsx",
"src/components/home/Contact.tsx",
"src/index.css"
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
Write-Host "[OK] All backups completed." -ForegroundColor Green
Write-Host ""

Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 6B PACK 1 READY" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Next: Pack 2A - Responsive Layout & UI Polish" -ForegroundColor Yellow