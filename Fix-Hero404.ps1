Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " FIX HERO IMAGE 404" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Files = @(
    ".\index.html",
    ".\public\manifest.webmanifest",
    ".\public\site.webmanifest",
    ".\public\browserconfig.xml"
)

foreach ($File in $Files) {

    if (Test-Path $File) {

        $Text = Get-Content $File -Raw

        $Text = $Text.Replace("/hero.png", "/favicon.svg")
        $Text = $Text.Replace("hero.png", "favicon.svg")

        Set-Content `
            -Path $File `
            -Value $Text `
            -Encoding UTF8

        Write-Host "[FIXED] $File" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "==============================================="
Write-Host " HERO IMAGE REFERENCES UPDATED"
Write-Host "==============================================="