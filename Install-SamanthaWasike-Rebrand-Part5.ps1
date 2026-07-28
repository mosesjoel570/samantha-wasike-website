Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " SAMANTHA WASIKE WEBSITE REBRAND - PART 5" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

$FooterFile = ".\src\components\layout\Footer\Footer.tsx"

if (!(Test-Path $FooterFile)) {
    Write-Host "[ERROR] Footer.tsx not found." -ForegroundColor Red
    exit
}

$Code = @'
export default function Footer() {

  const year = new Date().getFullYear();

  return (

<footer className="bg-slate-950 text-white">

<div className="mx-auto max-w-7xl px-6 py-16">

<div className="grid gap-12 md:grid-cols-3">

<div>

<h2 className="text-3xl font-bold text-blue-400">
Samantha Wasike
</h2>

<p className="mt-3 text-slate-300">
Certified Nursing Assistant
</p>

<p className="mt-5 leading-7 text-slate-400">
Providing compassionate, reliable and professional
home-based nursing care focused on dignity,
comfort and patient well-being.
</p>

</div>

<div>

<h3 className="text-xl font-semibold">
Quick Links
</h3>

<div className="mt-5 flex flex-col gap-3">

<a href="#home" className="hover:text-blue-400">
Home
</a>

<a href="#doctor" className="hover:text-blue-400">
About
</a>

<a href="#services" className="hover:text-blue-400">
Services
</a>

<a href="#gallery" className="hover:text-blue-400">
Gallery
</a>

<a href="#contact" className="hover:text-blue-400">
Contact
</a>

</div>

</div>

<div>

<h3 className="text-xl font-semibold">
Contact
</h3>

<div className="mt-5 space-y-3 text-slate-300">

<p>📞 +254 704271129</p>

<p>✉️ wasikesamantha03@gmail.com</p>

<p>📍 Nairobi, Kenya</p>

</div>

</div>

</div>

<div className="my-10 h-px bg-slate-800"></div>

<div className="flex flex-col items-center justify-between gap-4 text-sm text-slate-400 md:flex-row">

<p>
© {year} Samantha Wasike. All Rights Reserved.
</p>

<p>
Certified Nursing Assistant
</p>

</div>

</div>

</footer>

  );

}
'@

Set-Content `
    -Path $FooterFile `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Footer updated successfully." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " PART 5 COMPLETE" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan