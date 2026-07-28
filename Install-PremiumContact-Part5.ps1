Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PREMIUM CONTACT - PART 5" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$File = ".\src\components\home\Contact.tsx"

if (!(Test-Path $File)) {
    Write-Host "[ERROR] Contact.tsx not found." -ForegroundColor Red
    exit
}

$Time = Get-Date -Format "yyyyMMdd_HHmmss"
$Backup = "..\backups\PremiumContact_$Time"

New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item $File "$Backup\Contact.tsx"

Write-Host "[OK] Backup created." -ForegroundColor Green

$Code = @'
import FadeIn from "../ui/FadeIn";
import { Container, SectionTitle } from "../ui";
import { Phone, Mail, MapPin, MessageCircle } from "lucide-react";

export default function Contact(){

return(

<FadeIn>

<section
id="contact"
className="bg-slate-50 py-24"
>

<Container>

<SectionTitle
eyebrow="Contact"
title="Book an Appointment"
subtitle="Reach out for compassionate and professional nursing care."
/>

<div className="grid gap-12 lg:grid-cols-2">

<div className="space-y-6">

<div className="rounded-3xl bg-white p-6 shadow-lg">
<div className="mb-3 flex items-center gap-3">
<Phone className="h-6 w-6 text-blue-700"/>
<h3 className="text-xl font-bold">Phone</h3>
</div>
<p className="text-slate-600">+254 704 271 129</p>
</div>

<div className="rounded-3xl bg-white p-6 shadow-lg">
<div className="mb-3 flex items-center gap-3">
<MessageCircle className="h-6 w-6 text-green-600"/>
<h3 className="text-xl font-bold">WhatsApp</h3>
</div>
<p className="text-slate-600">+254 704 271 129</p>
</div>

<div className="rounded-3xl bg-white p-6 shadow-lg">
<div className="mb-3 flex items-center gap-3">
<Mail className="h-6 w-6 text-red-500"/>
<h3 className="text-xl font-bold">Email</h3>
</div>
<p className="text-slate-600">wasikesamantha03@gmail.com</p>
</div>

<div className="rounded-3xl bg-white p-6 shadow-lg">
<div className="mb-3 flex items-center gap-3">
<MapPin className="h-6 w-6 text-blue-700"/>
<h3 className="text-xl font-bold">Location</h3>
</div>
<p className="text-slate-600">Nairobi, Kenya</p>
</div>

</div>

<div className="rounded-3xl bg-white p-8 shadow-xl">

<form className="space-y-6">

<input
type="text"
placeholder="Full Name"
className="w-full rounded-xl border border-slate-300 p-4 outline-none focus:border-blue-600"
/>

<input
type="email"
placeholder="Email Address"
className="w-full rounded-xl border border-slate-300 p-4 outline-none focus:border-blue-600"
/>

<input
type="tel"
placeholder="Phone Number"
className="w-full rounded-xl border border-slate-300 p-4 outline-none focus:border-blue-600"
/>

<textarea
rows={6}
placeholder="Describe the care you need..."
className="w-full rounded-xl border border-slate-300 p-4 outline-none focus:border-blue-600"
/>

<button
className="w-full rounded-xl bg-blue-700 py-4 font-semibold text-white transition hover:bg-blue-800"
>

Book Appointment

</button>

</form>

</div>

</div>

</Container>

</section>

</FadeIn>

);

}
'@

Set-Content -Path $File -Value $Code -Encoding UTF8

Write-Host ""
Write-Host "[OK] Premium Contact installed successfully." -ForegroundColor Green
Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PART 5 COMPLETE" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan