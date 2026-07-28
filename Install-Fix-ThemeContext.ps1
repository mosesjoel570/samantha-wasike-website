Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " FIXING THEMECONTEXT.TSX" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$ThemeFile = Join-Path $Root "src\context\ThemeContext.tsx"

if (!(Test-Path $ThemeFile)) {
    Write-Host "[ERROR] ThemeContext.tsx not found." -ForegroundColor Red
    exit
}

$Content = Get-Content $ThemeFile -Raw

$Content = $Content -replace 'import\s*\{\s*([^}]*)ReactNode([^}]*)\}\s*from\s*"react";', 'import type { ReactNode } from "react";'

$Content = $Content -replace 'import\s*\{\s*([^}]*)ReactNode([^}]*)\}\s*from\s*''react'';', 'import type { ReactNode } from "react";'

[System.IO.File]::WriteAllText(
    $ThemeFile,
    $Content,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] ThemeContext.tsx fixed." -ForegroundColor Green

Write-Host ""
Write-Host "Running production build..." -ForegroundColor Yellow
Write-Host ""

npm run build

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "===============================================" -ForegroundColor Green
    Write-Host " BUILD SUCCESSFUL" -ForegroundColor Green
    Write-Host "===============================================" -ForegroundColor Green
}
else {
    Write-Host ""
    Write-Host "===============================================" -ForegroundColor Red
    Write-Host " BUILD STILL HAS ERRORS" -ForegroundColor Red
    Write-Host "===============================================" -ForegroundColor Red
}