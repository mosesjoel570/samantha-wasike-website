Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PREMIUM UI - PART 4" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

#----------------------------------------------------------
# Locate Navbar.tsx
#----------------------------------------------------------

$Navbar = Get-ChildItem ".\src" -Recurse -Filter Navbar.tsx | Select-Object -First 1

if ($null -eq $Navbar) {
    Write-Host "[ERROR] Navbar.tsx not found." -ForegroundColor Red
    exit
}

Write-Host "[OK] Found Navbar:" -ForegroundColor Green
Write-Host $Navbar.FullName
Write-Host ""

#----------------------------------------------------------
# Backup
#----------------------------------------------------------

$Time = Get-Date -Format "yyyyMMdd_HHmmss"
$Backup = "..\backups\PremiumUI-Part4_$Time"

New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item $Navbar.FullName "$Backup\Navbar.tsx"

Write-Host "[OK] Backup created." -ForegroundColor Green
Write-Host ""

#----------------------------------------------------------
# Read File
#----------------------------------------------------------

$Text = Get-Content $Navbar.FullName -Raw
$Original = $Text

# Sticky Navbar
$Text = $Text -replace `
'className="([^"]*bg-white[^"]*)"', `
'className="fixed top-0 left-0 right-0 z-50 bg-white/90 backdrop-blur-md shadow-md $1"'

# Navigation links
$Text = $Text -replace `
'hover:text-blue-700', `
'transition-colors duration-300 hover:text-blue-700'

#----------------------------------------------------------
# Save
#----------------------------------------------------------

if ($Text -ne $Original) {

    Set-Content `
        -Path $Navbar.FullName `
        -Value $Text `
        -Encoding UTF8

    Write-Host "[OK] Navbar updated successfully." -ForegroundColor Green
}
else {

    Write-Host "[INFO] No matching classes found automatically." -ForegroundColor Yellow
    Write-Host "This simply means your Navbar uses different Tailwind classes." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PART 4 COMPLETE" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Refresh the browser to see the navbar changes."