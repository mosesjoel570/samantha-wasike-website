Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " SAMANTHA WASIKE WEBSITE REBRAND - PART 1" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

#----------------------------------------------------------
# Create Backup
#----------------------------------------------------------

$Time = Get-Date -Format "yyyyMMdd_HHmmss"
$BackupFolder = "..\backups\Rebrand_$Time"

Write-Host "[1/4] Creating backup..." -ForegroundColor Yellow

New-Item `
    -ItemType Directory `
    -Force `
    -Path $BackupFolder | Out-Null

Copy-Item `
    ".\src" `
    "$BackupFolder\src" `
    -Recurse `
    -Force

if (Test-Path ".\index.html") {
    Copy-Item `
        ".\index.html" `
        "$BackupFolder\index.html" `
        -Force
}

Write-Host "[OK] Backup created." -ForegroundColor Green

#----------------------------------------------------------
# Collect Files
#----------------------------------------------------------

Write-Host ""
Write-Host "[2/4] Scanning project..." -ForegroundColor Yellow

$Files = @()

$Files += Get-ChildItem `
    ".\src" `
    -Recurse `
    -File `
    -Include *.tsx, *.ts

if (Test-Path ".\index.html") {
    $Files += Get-Item ".\index.html"
}

Write-Host ("Found " + $Files.Count + " files.") -ForegroundColor Cyan

#----------------------------------------------------------
# Replace Branding
#----------------------------------------------------------

Write-Host ""
Write-Host "[3/4] Updating branding..." -ForegroundColor Yellow

foreach ($File in $Files) {

    try {

        $Text = Get-Content `
            $File.FullName `
            -Raw `
            -ErrorAction Stop

    }
    catch {

        Write-Host "[SKIPPED] Unable to read $($File.FullName)" -ForegroundColor Yellow
        continue

    }

    if ([string]::IsNullOrWhiteSpace($Text)) {

        Write-Host "[EMPTY] $($File.Name)" -ForegroundColor Yellow
        continue

    }

    $Original = $Text

    $Text = $Text.Replace(
        "Dr. Samantha Hospital",
        "Samantha Wasike"
    )

    $Text = $Text.Replace(
        "Dr. Samantha",
        "Samantha Wasike"
    )

    $Text = $Text.Replace(
        "Meet Your Doctor",
        "Meet Your Caregiver"
    )

    $Text = $Text.Replace(
        "Professional Medical Services",
        "Professional Nursing Care Services"
    )

    $Text = $Text.Replace(
        "Exceptional Healthcare | Compassionate Care",
        "Certified Nursing Assistant | Compassionate Home Care"
    )

    $Text = $Text.Replace(
        "Compassionate, evidence-based healthcare tailored to every patient.",
        "Compassionate Certified Nursing Assistant providing quality home-based patient care."
    )

    $Text = $Text.Replace(
        "<title>Dr. Samantha Hospital</title>",
        "<title>Samantha Wasike | Certified Nursing Assistant</title>"
    )

    if ($Original -ne $Text) {

        Set-Content `
            -Path $File.FullName `
            -Value $Text `
            -Encoding UTF8

        Write-Host "[UPDATED] $($File.Name)" -ForegroundColor Green

    }

}

#----------------------------------------------------------
# Finished
#----------------------------------------------------------

Write-Host ""
Write-Host "[4/4] Branding update completed successfully." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " PART 1 COMPLETE" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "Next Step:"
Write-Host "Run Install-SamanthaWasike-Rebrand-Part2.ps1" -ForegroundColor Yellow