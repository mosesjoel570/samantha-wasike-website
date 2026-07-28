Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 7A PACK 2B" -ForegroundColor Green
Write-Host " Sitemap, Robots & Production Build" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

# --------------------------------------------------
# sitemap.xml
# --------------------------------------------------

$Sitemap = @'
<?xml version="1.0" encoding="UTF-8"?>

<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

<url>
<loc>https://drsamanthahospital.com/</loc>
<changefreq>weekly</changefreq>
<priority>1.0</priority>
</url>

</urlset>
'@

[System.IO.File]::WriteAllText(
    (Join-Path $Root "public\sitemap.xml"),
    $Sitemap,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] sitemap.xml generated." -ForegroundColor Green

# --------------------------------------------------
# robots.txt
# --------------------------------------------------

$Robots = @'
User-agent: *

Allow: /

Sitemap: https://drsamanthahospital.com/sitemap.xml
'@

[System.IO.File]::WriteAllText(
    (Join-Path $Root "public\robots.txt"),
    $Robots,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] robots.txt generated." -ForegroundColor Green

# --------------------------------------------------
# Build
# --------------------------------------------------

Write-Host ""
Write-Host "Running production build..." -ForegroundColor Yellow

npm run build

if($LASTEXITCODE -eq 0){

    Write-Host ""
    Write-Host "[OK] Production build successful." -ForegroundColor Green

}
else{

    Write-Host ""
    Write-Host "[ERROR] Build failed." -ForegroundColor Red
    exit

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 7A PACK 2B COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""

Write-Host "SEO Complete."
Write-Host "Performance Optimization Complete."
Write-Host "Production Build Complete."
Write-Host ""
Write-Host "Next: Phase 7B - Progressive Web App (PWA)"