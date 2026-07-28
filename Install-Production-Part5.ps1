Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PRODUCTION BUILD & DEPLOYMENT - PART 5" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

#--------------------------------------------------
# Backup
#--------------------------------------------------

$Backup = "..\backups\Production_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

New-Item `
    -ItemType Directory `
    -Force `
    -Path $Backup | Out-Null

Copy-Item `
    ".\package.json" `
    "$Backup\package.json" `
    -Force

Write-Host "[OK] Backup created." -ForegroundColor Green

#--------------------------------------------------
# Public Folder
#--------------------------------------------------

$Public = ".\public"

if (!(Test-Path $Public)) {
    New-Item `
        -ItemType Directory `
        -Force `
        -Path $Public | Out-Null

    Write-Host "[OK] Public folder created." -ForegroundColor Green
}

#--------------------------------------------------
# _redirects
#--------------------------------------------------

@"
/*    /index.html   200
"@ | Set-Content `
    "$Public\_redirects" `
    -Encoding UTF8

Write-Host "[OK] _redirects created." -ForegroundColor Green

#--------------------------------------------------
# netlify.toml
#--------------------------------------------------

@"
[build]
  command = "npm run build"
  publish = "dist"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
"@ | Set-Content `
    ".\netlify.toml" `
    -Encoding UTF8

Write-Host "[OK] netlify.toml created." -ForegroundColor Green

#--------------------------------------------------
# Build
#--------------------------------------------------

Write-Host ""
Write-Host "Running production build..." -ForegroundColor Yellow

npm run build

if ($LASTEXITCODE -eq 0) {

    Write-Host ""
    Write-Host "[SUCCESS] Production build completed." -ForegroundColor Green
    Write-Host "Your site is ready for deployment." -ForegroundColor Green

} else {

    Write-Host ""
    Write-Host "[ERROR] Build failed." -ForegroundColor Red
    Write-Host "Review the errors above and fix them before deploying." -ForegroundColor Yellow

}

Write-Host ""
Write-Host "===================================================="
Write-Host " PART 5 COMPLETE"
Write-Host "===================================================="