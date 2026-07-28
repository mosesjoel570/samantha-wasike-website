Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PERFORMANCE OPTIMIZATION - PART 3" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$Css = ".\src\styles\global.css"

if (!(Test-Path $Css)) {

    Write-Host "[ERROR] global.css not found." -ForegroundColor Red
    exit

}

$Backup = "..\backups\Performance_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

New-Item `
    -ItemType Directory `
    -Force `
    -Path $Backup | Out-Null

Copy-Item `
    $Css `
    "$Backup\global.css"

Write-Host "[OK] Backup created." -ForegroundColor Green

$Styles = @"

/* ==========================================
   PERFORMANCE ENHANCEMENTS
========================================== */

html{
scroll-behavior:smooth;
}

body{
text-rendering:optimizeLegibility;
-webkit-font-smoothing:antialiased;
-moz-osx-font-smoothing:grayscale;
}

img{
display:block;
max-width:100%;
height:auto;
}

img[loading="lazy"]{
content-visibility:auto;
}

::selection{
background:#2563eb;
color:#fff;
}

/* Scrollbar */

::-webkit-scrollbar{
width:10px;
}

::-webkit-scrollbar-track{
background:#f1f5f9;
}

::-webkit-scrollbar-thumb{
background:#2563eb;
border-radius:100px;
}

::-webkit-scrollbar-thumb:hover{
background:#1d4ed8;
}
"@

Add-Content `
    -Path $Css `
    -Value $Styles `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Performance styles installed." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================="
Write-Host " PART 3 COMPLETE"
Write-Host "===================================================="