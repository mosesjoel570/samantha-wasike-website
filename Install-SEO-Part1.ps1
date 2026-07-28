Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " SEO OPTIMIZATION - PART 1" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$Index = ".\index.html"

if (!(Test-Path $Index)) {
    Write-Host "[ERROR] index.html not found." -ForegroundColor Red
    exit
}

# Backup
$Backup = "..\backups\SEO_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item $Index "$Backup\index.html"

Write-Host "[OK] Backup created." -ForegroundColor Green

$Html = @'
<!doctype html>
<html lang="en">

<head>

<meta charset="UTF-8" />

<meta
name="viewport"
content="width=device-width, initial-scale=1.0"
/>

<title>Samantha Wasike | Certified Nursing Assistant</title>

<meta
name="description"
content="Professional Certified Nursing Assistant in Nairobi offering compassionate home-based nursing care, medication assistance, wound dressing, health monitoring, personal care, and companionship."
/>

<meta
name="keywords"
content="Certified Nursing Assistant, Home Nursing, Nairobi, Wound Dressing, Medication Assistance, Personal Care, Samantha Wasike"
/>

<meta
name="author"
content="Samantha Wasike"
/>

<meta
name="theme-color"
content="#2563eb"
/>

<meta
property="og:title"
content="Samantha Wasike | Certified Nursing Assistant"
/>

<meta
property="og:description"
content="Compassionate professional nursing care focused on dignity, safety and comfort."
/>

<meta
property="og:type"
content="website"
/>

<meta
property="og:image"
content="/hero.png"
/>

<meta
property="og:locale"
content="en_KE"
/>

<meta
name="twitter:card"
content="summary_large_image"
/>

<meta
name="twitter:title"
content="Samantha Wasike | Certified Nursing Assistant"
/>

<meta
name="twitter:description"
content="Professional Home Nursing Care in Nairobi."
/>

<meta
name="twitter:image"
content="/hero.png"
/>

<link rel="icon" href="/favicon.ico" />

<div id="root"></div>

<script type="module" src="/src/main.tsx"></script>

</head>

<body>

<div id="root"></div>

</body>

</html>
'@

Set-Content `
    -Path $Index `
    -Value $Html `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] SEO tags installed." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================="
Write-Host " PART 1 COMPLETE"
Write-Host "===================================================="