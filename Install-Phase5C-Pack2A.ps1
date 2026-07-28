Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 5C PACK 2A" -ForegroundColor Green
Write-Host " Animated Premium Navbar" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$NavbarFile = Join-Path $Root "src\components\layout\Navbar\Navbar.tsx"

$Code = @'
import { motion } from "framer-motion";

const links = [
  { name: "Home", href: "#home" },
  { name: "About", href: "#about" },
  { name: "Services", href: "#services" },
  { name: "Doctor", href: "#doctor" },
  { name: "Gallery", href: "#gallery" },
  { name: "Contact", href: "#contact" }
];

export default function Navbar() {

  return (

    <motion.header
      initial={{ y: -80 }}
      animate={{ y: 0 }}
      transition={{ duration: 0.6 }}
      className="fixed top-0 left-0 right-0 z-50 bg-white/90 backdrop-blur-lg shadow-lg"
    >

      <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">

        <div>

          <h2 className="text-2xl font-bold text-blue-700">
            Dr. Samantha Hospital
          </h2>

          <p className="text-xs uppercase tracking-[4px] text-slate-500">
            Compassion | Excellence | Care
          </p>

        </div>

        <nav className="hidden gap-8 md:flex">

          {links.map((link) => (

            <a
              key={link.name}
              href={link.href}
              className="font-medium text-slate-700 transition hover:text-blue-700"
            >
              {link.name}
            </a>

          ))}

        </nav>

        <a
          href="#contact"
          className="rounded-xl bg-blue-700 px-5 py-3 font-semibold text-white transition hover:bg-blue-800"
        >
          Book Appointment
        </a>

      </div>

    </motion.header>

  );

}
'@

[System.IO.File]::WriteAllText(
    $NavbarFile,
    $Code,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] Navbar.tsx generated." -ForegroundColor Green

if(Test-Path $NavbarFile){

    Write-Host "[OK] Validation passed." -ForegroundColor Green

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 5C PACK 2A COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next: Pack 2B - Sticky Navbar & Active Navigation"