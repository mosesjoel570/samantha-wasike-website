Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " EMAILJS PREPARATION - PART 3" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$Folder = ".\src\services"

New-Item `
    -ItemType Directory `
    -Force `
    -Path $Folder | Out-Null

$File = Join-Path $Folder "emailConfig.ts"

$Code = @'
export const EMAILJS = {

serviceId: "YOUR_SERVICE_ID",

templateId: "YOUR_TEMPLATE_ID",

publicKey: "YOUR_PUBLIC_KEY"

};
'@

Set-Content `
    -Path $File `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] emailConfig.ts created." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================="
Write-Host " PART 3 COMPLETE"
Write-Host "===================================================="