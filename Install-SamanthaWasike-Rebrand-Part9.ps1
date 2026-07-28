Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " SAMANTHA WASIKE WEBSITE REBRAND - PART 9" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

$IndexFile = ".\index.html"

if (!(Test-Path $IndexFile)) {
    Write-Host "[ERROR] index.html not found." -ForegroundColor Red
    exit
}

$content = Get-Content $IndexFile -Raw

$content = [regex]::Replace(
    $content,
    "<title>.*?</title>",
    "<title>Samantha Wasike | Certified Nursing Assistant</title>"
)

if ($content -notmatch 'name="description"') {

    $meta = @'
<meta name="description" content="Samantha Wasike is a Certified Nursing Assistant providing compassionate home nursing care, personal care, patient support and wellness services in Kenya.">
'@

    $content = $content -replace "</head>", "$meta`r`n</head>"
}
else {

    $content = [regex]::Replace(
        $content,
        '<meta\s+name="description".*?>',
        '<meta name="description" content="Samantha Wasike is a Certified Nursing Assistant providing compassionate home nursing care, personal care, patient support and wellness services in Kenya.">'
    )

}

Set-Content `
    -Path $IndexFile `
    -Value $content `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] index.html updated successfully." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " PART 9 COMPLETE" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan