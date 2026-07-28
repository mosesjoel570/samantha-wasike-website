Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 4C PACK 2B" -ForegroundColor Green
Write-Host " Premium Doctor Component" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$DoctorFolder = Join-Path $Root "src\components\home"
$BackupFolder = Join-Path $Root "backup"

New-Item -ItemType Directory -Force $BackupFolder | Out-Null

$DoctorFile = Join-Path $DoctorFolder "Doctor.tsx"

if(Test-Path $DoctorFile){

Copy-Item `
$DoctorFile `
(Join-Path $BackupFolder "Doctor_$(Get-Date -Format yyyyMMdd_HHmmss).tsx") `
-Force

Write-Host "[OK] Backup created." -ForegroundColor Green

}

$Code=@'

import FadeIn from "../ui/FadeIn";
import { Container, Card, Button } from "../ui";
import { Award, HeartHandshake, ShieldCheck } from "lucide-react";

export default function Doctor(){

return(

<FadeIn>

<section
id="doctor"
className="bg-slate-50 py-24"
>

<Container>

<div className="grid items-center gap-16 lg:grid-cols-2">

<div>

<div className="aspect-[4/5] rounded-3xl bg-gradient-to-br from-blue-700 to-cyan-500 flex items-center justify-center text-white text-3xl font-bold shadow-2xl">

Professional Photo

</div>

</div>

<div>

<p className="uppercase tracking-[5px] font-semibold text-blue-700">

Meet Your Doctor

</p>

<h2 className="mt-4 text-5xl font-bold text-slate-900">

Dr. Samantha

</h2>

<p className="mt-8 text-lg leading-8 text-slate-600">

Dr. Samantha is committed to providing compassionate,
evidence-based healthcare using modern medical practices
and personalized treatment plans for every patient.

</p>

<div className="mt-10 space-y-6">
<Card>

<div className="flex items-center gap-4">

<Award className="h-10 w-10 text-blue-700"/>

<div>

<h3 className="font-bold text-xl">
Patient Care
</h3>

<p className="text-slate-600">
Personalized treatment plans tailored to every patient.
</p>

</div>

</div>

</Card>

<Card className="mt-6">

<div className="flex items-center gap-4">

<HeartHandshake className="h-10 w-10 text-blue-700"/>

<div>

<h3 className="font-bold text-xl">
Compassionate Care
</h3>

<p className="text-slate-600">
Every patient is treated with dignity, respect and empathy.
</p>

</div>

</div>

</Card>

<Card className="mt-6">

<div className="flex items-center gap-4">

<ShieldCheck className="h-10 w-10 text-blue-700"/>

<div>

<h3 className="font-bold text-xl">
Modern Medicine
</h3>

<p className="text-slate-600">
Evidence-based healthcare supported by modern technology.
</p>

</div>

</div>

</Card>

<div className="mt-10 flex gap-4 flex-wrap">

<Button
onClick={() => window.location.href="#contact"}
>

Book Appointment

</Button>

<Button
variant="outline"
onClick={() => window.location.href="#services"}
>

Our Services

</Button>

</div>

</div>

</div>

</Container>

</section>

</FadeIn>

);

}

'@

[System.IO.File]::WriteAllText(

$DoctorFile,

$Code,

[System.Text.UTF8Encoding]::new($false)

)

Write-Host "[OK] Doctor.tsx generated." -ForegroundColor Green

if(Test-Path $DoctorFile){

Write-Host "[OK] Validation passed." -ForegroundColor Green

}else{

Write-Host "[ERROR] Failed to create Doctor.tsx" -ForegroundColor Red

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 4C PACK 2B COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next: Pack 2C - Premium Testimonials Component" -ForegroundColor Yellow