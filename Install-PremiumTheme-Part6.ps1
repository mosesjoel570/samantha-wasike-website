Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PREMIUM THEME - PART 6" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$Css = Get-ChildItem ".\src" -Recurse -Include *.css |
    Where-Object { $_.Name -match "index|global|main|app" } |
    Select-Object -First 1

if (!$Css) {
    Write-Host "[ERROR] Could not locate the main CSS file." -ForegroundColor Red
    exit
}

$Time = Get-Date -Format "yyyyMMdd_HHmmss"
$Backup = "..\backups\PremiumTheme_$Time"

New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item $Css.FullName "$Backup\$($Css.Name)"

Write-Host "[OK] Backup created." -ForegroundColor Green

$Styles = @"

/* ====================================================
   PREMIUM UI THEME
==================================================== */

html{
scroll-behavior:smooth;
}

body{
background:#f8fafc;
color:#0f172a;
}

section{
padding-top:6rem;
padding-bottom:6rem;
}

button,
a{
transition:all .3s ease;
}

button:hover,
a:hover{
transform:translateY(-2px);
}

.premium-card{
background:white;
border-radius:24px;
box-shadow:0 15px 40px rgba(0,0,0,.08);
transition:.35s;
}

.premium-card:hover{
transform:translateY(-8px);
box-shadow:0 25px 60px rgba(37,99,235,.18);
}

.gradient-blue{
background:linear-gradient(
135deg,
#2563eb,
#1d4ed8,
#3b82f6
);
color:white;
}

.glass{
background:rgba(255,255,255,.75);
backdrop-filter:blur(12px);
border:1px solid rgba(255,255,255,.35);
}

.round-xl{
border-radius:24px;
}

.shadow-premium{
box-shadow:0 20px 60px rgba(0,0,0,.12);
}

.text-gradient{
background:linear-gradient(90deg,#2563eb,#38bdf8);
-webkit-background-clip:text;
-webkit-text-fill-color:transparent;
background-clip:text;
}

"@

Add-Content `
    -Path $Css.FullName `
    -Value $Styles `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Premium theme installed successfully." -ForegroundColor Green
Write-Host ""
Write-Host "Main CSS:"
Write-Host $Css.FullName -ForegroundColor Yellow
Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PART 6 COMPLETE" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan