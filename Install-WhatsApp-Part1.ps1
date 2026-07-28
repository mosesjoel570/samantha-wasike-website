Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " WHATSAPP BUTTON - PART 1" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$Folder = ".\src\components\common"

New-Item `
    -ItemType Directory `
    -Force `
    -Path $Folder | Out-Null

$File = Join-Path $Folder "FloatingWhatsApp.tsx"

$Code = @'
import { MessageCircle } from "lucide-react";

export default function FloatingWhatsApp() {

const phone = "254704271129";

const message =
encodeURIComponent(
"Hello Samantha, I would like to inquire about your nursing care services."
);

return (

<a
href={`https://wa.me/${phone}?text=${message}`}
target="_blank"
rel="noopener noreferrer"
className="fixed bottom-6 right-6 z-50 flex h-16 w-16 items-center justify-center rounded-full bg-green-500 text-white shadow-2xl transition duration-300 hover:scale-110 hover:bg-green-600"
aria-label="Chat on WhatsApp"
>

<MessageCircle size={32}/>

</a>

);

}
'@

Set-Content `
    -Path $File `
    -Value $Code `
    -Encoding UTF8

Write-Host "[OK] FloatingWhatsApp.tsx created." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================="
Write-Host " PART 1 COMPLETE"
Write-Host "===================================================="