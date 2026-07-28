Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PREMIUM UI - PART 2" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

#----------------------------------------------------------
# Backup
#----------------------------------------------------------

$Time = Get-Date -Format "yyyyMMdd_HHmmss"
$Backup = "..\backups\PremiumUI-Part2_$Time"

New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item ".\src" "$Backup\src" -Recurse -Force

Write-Host "[OK] Backup created." -ForegroundColor Green
Write-Host ""

#----------------------------------------------------------
# Update Buttons
#----------------------------------------------------------

$Files = Get-ChildItem ".\src" -Recurse -Include *.tsx

foreach($File in $Files){

    $Text = Get-Content $File.FullName -Raw
    $Original = $Text

    $Text = $Text -replace `
        'inline-flex items-center gap-2 font-semibold text-blue-700 transition-colors hover:text-blue-900',
        'inline-flex items-center justify-center gap-2 rounded-full bg-blue-700 px-6 py-3 font-semibold text-white shadow-md transition-all duration-300 hover:-translate-y-1 hover:bg-blue-800 hover:shadow-xl'

    $Text = $Text -replace `
        'inline-flex font-semibold text-blue-700 hover:text-blue-900',
        'inline-flex items-center justify-center rounded-full bg-blue-700 px-6 py-3 font-semibold text-white shadow-md transition-all duration-300 hover:-translate-y-1 hover:bg-blue-800 hover:shadow-xl'

    if($Text -ne $Original){

        Set-Content `
            -Path $File.FullName `
            -Value $Text `
            -Encoding UTF8

        Write-Host "[UPDATED] $($File.Name)" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PART 2 COMPLETE" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Refresh your browser to see the updated button styles."