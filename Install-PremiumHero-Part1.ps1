Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PREMIUM HERO - PART 1" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$Hero = ".\src\components\home\Hero.tsx"

if (!(Test-Path $Hero)) {
    Write-Host "[ERROR] Hero.tsx not found." -ForegroundColor Red
    exit
}

$Time = Get-Date -Format "yyyyMMdd_HHmmss"
$Backup = "..\backups\PremiumHero_$Time"

New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item $Hero "$Backup\Hero.tsx"

Write-Host "[OK] Backup created." -ForegroundColor Green

$Code = @'
import heroImage from "../../assets/images/hero.jpg";

export default function Hero() {

  return (

<section
id="home"
className="relative flex min-h-screen items-center justify-center overflow-hidden"
>

<img
src={heroImage}
alt="Professional Nursing Care"
className="absolute inset-0 h-full w-full object-cover"
/>

<div className="absolute inset-0 bg-slate-900/65"></div>

<div className="relative z-10 mx-auto max-w-7xl px-6 text-center text-white">

<p className="mb-6 inline-block rounded-full bg-blue-600/90 px-5 py-2 text-sm font-semibold uppercase tracking-widest">

Certified Nursing Assistant

</p>

<h1 className="mx-auto max-w-5xl text-5xl font-extrabold leading-tight md:text-7xl">

Samantha Wasike

</h1>

<p className="mt-6 text-xl text-slate-200 md:text-2xl">

Providing compassionate, professional, and personalized home nursing care that promotes dignity, comfort, independence, and improved quality of life.

</p>

<div className="mt-10 flex flex-col justify-center gap-4 sm:flex-row">

<a
href="#contact"
className="rounded-full bg-blue-600 px-8 py-4 text-lg font-semibold text-white transition duration-300 hover:bg-blue-700"
>

Book Appointment

</a>

<a
href="#services"
className="rounded-full border-2 border-white px-8 py-4 text-lg font-semibold transition duration-300 hover:bg-white hover:text-slate-900"
>

Explore Services

</a>

</div>

<div className="mt-20 grid gap-6 md:grid-cols-4">

<div className="rounded-3xl bg-white/10 p-6 backdrop-blur">

<h2 className="text-4xl font-bold text-blue-300">15+</h2>

<p className="mt-2 text-slate-200">

Years of Experience

</p>

</div>

<div className="rounded-3xl bg-white/10 p-6 backdrop-blur">

<h2 className="text-4xl font-bold text-blue-300">500+</h2>

<p className="mt-2 text-slate-200">

Patients Assisted

</p>

</div>

<div className="rounded-3xl bg-white/10 p-6 backdrop-blur">

<h2 className="text-4xl font-bold text-blue-300">24/7</h2>

<p className="mt-2 text-slate-200">

Care Support

</p>

</div>

<div className="rounded-3xl bg-white/10 p-6 backdrop-blur">

<h2 className="text-4xl font-bold text-blue-300">100%</h2>

<p className="mt-2 text-slate-200">

Compassion & Commitment

</p>

</div>

</div>

</div>

</section>

  );

}
'@

Set-Content `
    -Path $Hero `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Premium Hero installed successfully." -ForegroundColor Green
Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PART 1 COMPLETE" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan