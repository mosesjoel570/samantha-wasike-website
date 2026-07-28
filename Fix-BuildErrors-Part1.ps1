Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " BUILD ERROR FIXER - PART 1" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$File = ".\src\components\home\Contact.tsx"

if (!(Test-Path $File)) {
    Write-Host "[ERROR] Contact.tsx not found." -ForegroundColor Red
    exit
}

# Backup
$Backup = "..\backups\BuildFix_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item $File "$Backup\Contact.tsx"

Write-Host "[OK] Backup created." -ForegroundColor Green

$Text = Get-Content $File -Raw

# Remove the unused lucide-react import
$Pattern = '^\s*import\s*\{\s*Phone\s*,\s*Mail\s*,\s*MapPin\s*,\s*MessageCircle\s*\}\s*from\s*"lucide-react";\r?\n?'

$Updated = [regex]::Replace(
    $Text,
    $Pattern,
    "",
    [System.Text.RegularExpressions.RegexOptions]::Multiline
)

if ($Updated -ne $Text) {

    Set-Content `
        -Path $File `
        -Value $Updated `
        -Encoding UTF8

    Write-Host "[OK] Removed unused lucide-react import." -ForegroundColor Green
}
else {

    Write-Host "[INFO] No matching import found." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "===================================================="
Write-Host " BUILD FIX COMPLETE"
Write-Host "===================================================="