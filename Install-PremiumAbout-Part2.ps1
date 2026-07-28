Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PREMIUM ABOUT - PART 2" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$About = ".\src\components\home\About.tsx"

if (!(Test-Path $About)) {
    Write-Host "[ERROR] About.tsx not found." -ForegroundColor Red
    exit
}

$Time = Get-Date -Format "yyyyMMdd_HHmmss"
$Backup = "..\backups\PremiumAbout_$Time"

New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item $About "$Backup\About.tsx"

Write-Host "[OK] Backup created." -ForegroundColor Green

$Code = @'
import FadeIn from "../ui/FadeIn";
import { Container } from "../ui";
import caregiver from "../../assets/images/Dr.Samantha.png";

export default function About() {

return (

<FadeIn>

<section
id="about"
className="bg-white py-24"
>

<Container>

<div className="grid items-center gap-16 lg:grid-cols-2">

<div className="flex justify-center">

<img
src={caregiver}
alt="Samantha Wasike"
className="h-[600px] w-[450px] rounded-3xl object-cover shadow-2xl"
/>

</div>

<div>

<p className="mb-4 font-semibold uppercase tracking-[0.3em] text-blue-700">

ABOUT SAMANTHA

</p>

<h2 className="text-5xl font-bold text-slate-900">

Certified Nursing Assistant

</h2>

<p className="mt-8 text-lg leading-8 text-slate-600">

Samantha Wasike is a compassionate Certified Nursing Assistant dedicated to providing safe, respectful and patient-centered care. She supports individuals with daily living activities while promoting comfort, dignity and independence.

</p>

<div className="mt-10 grid gap-5 md:grid-cols-2">

<div className="rounded-2xl border p-5 shadow-sm">
<h3 className="font-bold text-blue-700">Patient Care</h3>
<p className="mt-2 text-slate-600">Professional bedside support and compassionate care.</p>
</div>

<div className="rounded-2xl border p-5 shadow-sm">
<h3 className="font-bold text-blue-700">Medication Support</h3>
<p className="mt-2 text-slate-600">Medication reminders and observation.</p>
</div>

<div className="rounded-2xl border p-5 shadow-sm">
<h3 className="font-bold text-blue-700">Health Monitoring</h3>
<p className="mt-2 text-slate-600">Monitoring vital signs and patient condition.</p>
</div>

<div className="rounded-2xl border p-5 shadow-sm">
<h3 className="font-bold text-blue-700">Home Care</h3>
<p className="mt-2 text-slate-600">Professional home-based nursing assistance.</p>
</div>

</div>

<div className="mt-10 flex flex-wrap gap-4">

<span className="rounded-full bg-blue-100 px-5 py-2 font-semibold text-blue-700">
Patient Safety
</span>

<span className="rounded-full bg-blue-100 px-5 py-2 font-semibold text-blue-700">
Compassion
</span>

<span className="rounded-full bg-blue-100 px-5 py-2 font-semibold text-blue-700">
Professional Ethics
</span>

<span className="rounded-full bg-blue-100 px-5 py-2 font-semibold text-blue-700">
Quality Care
</span>

</div>

</div>

</div>

</Container>

</section>

</FadeIn>

);

}
'@

Set-Content `
    -Path $About `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Premium About section installed." -ForegroundColor Green
Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PART 2 COMPLETE" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan