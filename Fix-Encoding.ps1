Write-Host "==============================================="
Write-Host " DR SAMANTHA ENCODING FIX"
Write-Host "==============================================="

$files = Get-ChildItem .\src -Recurse -Include *.tsx,*.ts,*.jsx,*.js

foreach ($file in $files) {

    $content = Get-Content $file.FullName -Raw

    $old = $content

    # Repair common mojibake using Unicode escape codes
    $content = $content -replace "\u00c3\u00a2\u00c5\u201c\u00e2\u0080\u0153", "[CHECK]"
    $content = $content -replace "\u00c3\u00a2\u00e2\u0080\u0094", "->"
    $content = $content -replace "\u00c3\u201a\u00c2\u00a9", "(c)"

    if ($content -ne $old) {

        Write-Host "[FIXED] $($file.FullName)"

        Set-Content `
        -Path $file.FullName `
        -Value $content `
        -Encoding UTF8
    }
}

Write-Host "DONE"