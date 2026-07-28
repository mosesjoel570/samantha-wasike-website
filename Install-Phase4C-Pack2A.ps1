Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 4C PACK 2A" -ForegroundColor Green
Write-Host " Premium Services Component" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$ServicesFolder = Join-Path $Root "src\components\home"
$BackupFolder   = Join-Path $Root "backup"

New-Item -ItemType Directory -Force $BackupFolder | Out-Null

$ServicesFile = Join-Path $ServicesFolder "Services.tsx"

if(Test-Path $ServicesFile){

    Copy-Item `
        $ServicesFile `
        (Join-Path $BackupFolder "Services_$(Get-Date -Format yyyyMMdd_HHmmss).tsx") `
        -Force

    Write-Host "[OK] Backup created." -ForegroundColor Green

}

$Code = @'
import FadeIn from "../ui/FadeIn";
import { Card, Container, SectionTitle } from "../ui";

import {
    Stethoscope,
    HeartPulse,
    Ambulance,
    Microscope,
    Baby,
    ShieldCheck
} from "lucide-react";

const services = [

    {
        icon: Stethoscope,
        title: "General Consultation",
        description:
            "Professional diagnosis and treatment for patients of all ages."
    },

    {
        icon: HeartPulse,
        title: "Cardiac Care",
        description:
            "Comprehensive heart screening and specialist consultation."
    },

    {
        icon: Ambulance,
        title: "Emergency Services",
        description:
            "24/7 emergency response with experienced medical staff."
    },

    {
        icon: Microscope,
        title: "Laboratory",
        description:
            "Accurate laboratory diagnostics using modern equipment."
    },

    {
        icon: Baby,
        title: "Maternal Care",
        description:
            "Prenatal, maternity and postnatal healthcare services."
    },

    {
        icon: ShieldCheck,
        title: "Preventive Care",
        description:
            "Routine checkups, vaccinations and wellness programs."
    }

];

export default function Services(){

return(

<FadeIn>

<section
id="services"
className="bg-white py-24"
>

<Container>

<SectionTitle

eyebrow="Our Services"

title="Professional Medical Services"

subtitle="Dr. Samantha Hospital provides comprehensive healthcare delivered by experienced professionals using modern medical technology."

/>

<div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
{services.map((service)=>{

const Icon = service.icon;

return(

<Card
key={service.title}
className="border border-slate-100 hover:border-blue-200"
>

<div
className="mb-6 flex h-16 w-16 items-center justify-center rounded-2xl bg-blue-100"
>

<Icon className="h-8 w-8 text-blue-700"/>

</div>

<h3
className="text-2xl font-bold text-slate-900"
>

{service.title}

</h3>

<p
className="mt-4 leading-7 text-slate-600"
>

{service.description}

</p>

<a

href="#contact"

className="mt-6 inline-flex font-semibold text-blue-700 hover:text-blue-900"

>

Book Appointment →

</a>

</Card>

);

})}

</div>

</Container>

</section>

</FadeIn>

);

}

'@

[System.IO.File]::WriteAllText(

$ServicesFile,

$Code,

[System.Text.UTF8Encoding]::new($false)

)

Write-Host "[OK] Services.tsx generated." -ForegroundColor Green

if(Test-Path $ServicesFile){

Write-Host "[OK] Validation passed." -ForegroundColor Green

}else{

Write-Host "[ERROR] Failed to create Services.tsx" -ForegroundColor Red

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 4C PACK 2A COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next: Pack 2B - Premium Doctor Component" -ForegroundColor Yellow