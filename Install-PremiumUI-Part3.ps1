Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PREMIUM UI - PART 3" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

#----------------------------------------------------------
# Backup
#----------------------------------------------------------

$Time = Get-Date -Format "yyyyMMdd_HHmmss"
$Backup = "..\backups\PremiumUI-Part3_$Time"

New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item ".\src" "$Backup\src" -Recurse -Force

Write-Host "[OK] Backup created." -ForegroundColor Green
Write-Host ""

#----------------------------------------------------------
# Update Card Styles
#----------------------------------------------------------

$Files = Get-ChildItem ".\src" -Recurse -Include *.tsx

foreach ($File in $Files) {

    $Text = Get-Content $File.FullName -Raw
    $Original = $Text

    # Upgrade bordered cards
    $Text = $Text -replace `
        'border border-slate-100',
        'rounded-3xl border border-slate-200 bg-white shadow-sm transition-all duration-300 hover:-translate-y-2 hover:shadow-2xl'

    # Upgrade overflow cards
    $Text = $Text -replace `
        'overflow-hidden',
        'overflow-hidden rounded-3xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:shadow-2xl'

    # Upgrade hover border
    $Text = $Text -replace `
        'hover:border-blue-300',
        'hover:border-blue-500'

    $Text = $Text -replace `
        'hover:border-blue-200',
        'hover:border-blue-500'

    if ($Text -ne $Original) {

        Set-Content `
            -Path $File.FullName `
            -Value $Text `
            -Encoding UTF8

        Write-Host "[UPDATED] $($File.Name)" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PART 3 COMPLETE" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Premium cards installed successfully." -ForegroundColor Green