Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " WEBSITE ENCODING REPAIR" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

#----------------------------------------------------------
# Backup
#----------------------------------------------------------

$Time = Get-Date -Format "yyyyMMdd_HHmmss"
$Backup = "..\backups\EncodingFix_$Time"

New-Item -ItemType Directory -Force -Path $Backup | Out-Null

Copy-Item ".\src" "$Backup\src" -Recurse -Force

if (Test-Path ".\index.html") {
    Copy-Item ".\index.html" "$Backup\index.html" -Force
}

Write-Host "[OK] Backup created." -ForegroundColor Green

#----------------------------------------------------------
# Files
#----------------------------------------------------------

$Files = Get-ChildItem ".\src" -Recurse -File -Include *.tsx,*.ts,*.jsx,*.js,*.html,*.css,*.md

if (Test-Path ".\index.html") {
    $Files += Get-Item ".\index.html"
}

#----------------------------------------------------------
# Replacement table
#----------------------------------------------------------

$Map = @{
    "âœ“"     = "✓"
    "Ã¢Å“â€œ" = "✓"

    "Â©"      = "©"
    "Ãƒâ€š(c)"= "©"
    "(c)"     = "©"

    "ðŸ“ž"    = "📞"
    "ðŸ“"    = "📍"
    "ðŸ’¬"    = "💬"

    "âœ‰ï¸"   = "✉️"
    "âœ‰"      = "✉"

    "Ã¢â€""   = "—"
    "Ã¢â‚¬â„¢" = "'"
    "Ã¢â‚¬Å“" = '"'
    "Ã¢â‚¬ï¿½" = '"'

    "Ã" = ""
}

#----------------------------------------------------------
# Process
#----------------------------------------------------------

$Updated = 0

foreach ($File in $Files) {

    $Text = Get-Content $File.FullName -Raw -Encoding UTF8
    $Original = $Text

    foreach ($Key in $Map.Keys) {
        $Text = $Text.Replace($Key, $Map[$Key])
    }

    if ($Text -ne $Original) {

        Set-Content `
            -Path $File.FullName `
            -Value $Text `
            -Encoding UTF8

        Write-Host "[FIXED] $($File.Name)" -ForegroundColor Green
        $Updated++
    }
}

Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " COMPLETE" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Files updated: $Updated" -ForegroundColor Yellow
Write-Host "Backup: $Backup" -ForegroundColor Yellow