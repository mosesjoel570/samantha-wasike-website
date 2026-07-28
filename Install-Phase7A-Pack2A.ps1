Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 7A PACK 2A" -ForegroundColor Green
Write-Host " SEO Metadata & Performance Optimization" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$IndexFile = Join-Path $Root "index.html"

$IndexContent = @'
<!doctype html>
<html lang="en">

<head>

<meta charset="UTF-8" />

<meta
name="viewport"
content="width=device-width, initial-scale=1.0"
/>

<title>
Dr. Samantha Hospital | Compassionate Healthcare
</title>

<meta
name="description"
content="Dr. Samantha Hospital provides professional healthcare services including consultation, emergency care, laboratory services, maternal care and preventive healthcare."
/>

<meta
name="keywords"
content="Hospital, Doctor, Healthcare, Kenya, Clinic, Medical Services, Dr Samantha"
/>

<meta
name="author"
content="Dr. Samantha Hospital"
/>

<meta
property="og:title"
content="Dr. Samantha Hospital"
/>

<meta
property="og:description"
content="Professional healthcare delivered with compassion and excellence."
/>

<meta
property="og:type"
content="website"
/>

<meta
property="og:image"
content="/hospital-preview.jpg"
/>

<meta
property="og:url"
content="https://drsamanthahospital.com"
/>

<meta
name="theme-color"
content="#1D4ED8"
/>

<link rel="icon" href="/favicon.ico" />

</head>

<body>

<div id="root"></div>

<script type="module" src="/src/main.tsx"></script>

</body>

</html>
'@

[System.IO.File]::WriteAllText(
    $IndexFile,
    $IndexContent,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] index.html optimized." -ForegroundColor Green

$Vite = Join-Path $Root "vite.config.ts"

if(Test-Path $Vite){

$Content = Get-Content $Vite -Raw

if($Content -notmatch "build"){

$Content += @"

build:{
  target:"esnext",
  sourcemap:false,
  minify:"esbuild"
}

"@

[System.IO.File]::WriteAllText(
$Vite,
$Content,
[System.Text.UTF8Encoding]::new($false)
)

}

Write-Host "[OK] vite.config.ts optimized." -ForegroundColor Green

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 7A PACK 2A COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next: Pack 2B - Sitemap, Robots & Production Build"