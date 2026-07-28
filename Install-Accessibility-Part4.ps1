Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " ACCESSIBILITY & MOBILE OPTIMIZATION - PART 4" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$Css = ".\src\styles\global.css"

if (!(Test-Path $Css)) {
    Write-Host "[ERROR] global.css not found." -ForegroundColor Red
    exit
}

$Backup = "..\backups\Accessibility_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item $Css "$Backup\global.css"

Write-Host "[OK] Backup created." -ForegroundColor Green

$Styles = @"

/* =====================================
   ACCESSIBILITY ENHANCEMENTS
===================================== */

:focus-visible{
outline:3px solid #2563eb;
outline-offset:3px;
border-radius:8px;
}

button,
a,
input,
textarea,
select{
min-height:44px;
}

button:disabled{
opacity:.6;
cursor:not-allowed;
}

@media (prefers-reduced-motion: reduce){

*{
animation:none !important;
transition:none !important;
scroll-behavior:auto !important;
}

}

@media (max-width:640px){

section{
padding-top:4rem;
padding-bottom:4rem;
}

h1{
font-size:2.2rem;
}

h2{
font-size:1.8rem;
}

}

@media print{

header,
footer,
button,
.whatsapp-button{
display:none !important;
}

body{
background:white;
color:black;
}

}
"@

Add-Content `
    -Path $Css `
    -Value $Styles `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Accessibility improvements installed." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================="
Write-Host " PART 4 COMPLETE"
Write-Host "===================================================="