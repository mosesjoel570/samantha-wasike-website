Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " FINAL ENCODING REPAIR" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$files = @(
    ".\src\components\home\Doctor.tsx",
    ".\src\components\home\Services.tsx",
    ".\src\components\layout\Footer\Footer.tsx"
)

foreach($file in $files){

    if(!(Test-Path $file)){
        Write-Host "[SKIPPED] $file not found." -ForegroundColor Yellow
        continue
    }

    $text = Get-Content $file -Raw

    # Doctor checkmark lines
    $text = [regex]::Replace($text,'<div>.*?Compassionate Patient Care</div>','<div>&#10003; Compassionate Patient Care</div>')
    $text = [regex]::Replace($text,'<div>.*?Medication Assistance</div>','<div>&#10003; Medication Assistance</div>')
    $text = [regex]::Replace($text,'<div>.*?Personal Hygiene Support</div>','<div>&#10003; Personal Hygiene Support</div>')
    $text = [regex]::Replace($text,'<div>.*?Wound Dressing</div>','<div>&#10003; Wound Dressing</div>')
    $text = [regex]::Replace($text,'<div>.*?Home-Based Nursing Care</div>','<div>&#10003; Home-Based Nursing Care</div>')
    $text = [regex]::Replace($text,'<div>.*?Health Monitoring</div>','<div>&#10003; Health Monitoring</div>')

    # Services checkmark
    $text = [regex]::Replace(
        $text,
        '<span className="text-blue-700 font-bold">.*?</span>',
        '<span className="text-blue-700 font-bold">&#10003;</span>'
    )

    # Footer phone
    $text = [regex]::Replace(
        $text,
        '<p>.*?\+254 704271129</p>',
        '<p>&#128222; +254 704271129</p>'
    )

    # Footer email
    $text = [regex]::Replace(
        $text,
        '<p>.*?wasikesamantha03@gmail\.com</p>',
        '<p>&#9993; wasikesamantha03@gmail.com</p>'
    )

    # Footer location
    $text = [regex]::Replace(
        $text,
        '<p>.*?Nairobi, Kenya</p>',
        '<p>&#128205; Nairobi, Kenya</p>'
    )

    # Replace any corrupted copyright line
    $text = [regex]::Replace(
        $text,
        '.*\{year\} Samantha Wasike\. All Rights Reserved\.',
        '&copy; {year} Samantha Wasike. All Rights Reserved.'
    )

    Set-Content `
        -Path $file `
        -Value $text `
        -Encoding UTF8

    Write-Host "[FIXED] $file" -ForegroundColor Green
}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " REPAIR COMPLETE" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan