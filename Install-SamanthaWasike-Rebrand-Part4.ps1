Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " SAMANTHA WASIKE WEBSITE REBRAND - PART 4" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

$NavbarFile = ".\src\components\layout\Navbar\Navbar.tsx"

if (!(Test-Path $NavbarFile)) {
    Write-Host "[ERROR] Cannot find:" -ForegroundColor Red
    Write-Host $NavbarFile -ForegroundColor Yellow
    exit
}

$Code = @'
import { useState } from "react";
import { Menu, X } from "lucide-react";

const links = [
  { label: "Home", href: "#home" },
  { label: "About", href: "#doctor" },
  { label: "Services", href: "#services" },
  { label: "Gallery", href: "#gallery" },
  { label: "Testimonials", href: "#testimonials" },
  { label: "Contact", href: "#contact" },
];

export default function Navbar() {

  const [mobileOpen, setMobileOpen] = useState(false);

  return (

<header className="fixed top-0 z-50 w-full border-b border-slate-200 bg-white/95 backdrop-blur-md shadow-sm">

<div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">

<a href="#home">

<h1 className="text-2xl font-bold text-blue-700">
Samantha Wasike
</h1>

<p className="text-sm text-slate-500">
Certified Nursing Assistant
</p>

</a>

<nav className="hidden gap-8 lg:flex">

{links.map((link)=>(

<a
key={link.label}
href={link.href}
className="font-medium text-slate-700 transition hover:text-blue-700"
>
{link.label}
</a>

))}

</nav>

<a
href="#contact"
className="hidden rounded-xl bg-blue-700 px-6 py-3 font-semibold text-white transition hover:bg-blue-800 lg:block"
>
Book Appointment
</a>

<button
className="lg:hidden"
onClick={()=>setMobileOpen(!mobileOpen)}
>

{mobileOpen
? <X className="h-7 w-7"/>
: <Menu className="h-7 w-7"/>
}

</button>

</div>

{mobileOpen && (

<div className="border-t bg-white lg:hidden">

<div className="flex flex-col px-6 py-4">

{links.map((link)=>(

<a
key={link.label}
href={link.href}
onClick={()=>setMobileOpen(false)}
className="py-3 text-slate-700 hover:text-blue-700"
>
{link.label}
</a>

))}

<a
href="#contact"
onClick={()=>setMobileOpen(false)}
className="mt-4 rounded-xl bg-blue-700 px-5 py-3 text-center font-semibold text-white"
>
Book Appointment
</a>

</div>

</div>

)}

</header>

);

}
'@

Set-Content `
    -Path $NavbarFile `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Navbar updated successfully." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " PART 4 COMPLETE" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan