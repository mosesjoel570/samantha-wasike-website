Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " SAMANTHA WASIKE WEBSITE REBRAND - PART 6" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

$ServiceFile = ".\src\components\home\Services.tsx"

if (!(Test-Path $ServiceFile)) {
    Write-Host "[ERROR] Services.tsx not found." -ForegroundColor Red
    exit
}

$Code = @'
import FadeIn from "../ui/FadeIn";
import { Card, Container, SectionTitle } from "../ui";
import {
  Heart,
  Activity,
  Home,
  ShieldPlus,
  Users,
  Bed,
} from "lucide-react";

const services = [
  {
    icon: Heart,
    title: "Daily Living & Personal Care",
    items: [
      "Bathing & Grooming",
      "Dressing Assistance",
      "Toileting Support",
      "Feeding Assistance",
    ],
  },
  {
    icon: Activity,
    title: "Basic Medical Monitoring",
    items: [
      "Vital Signs Monitoring",
      "Medication Reminders",
      "Wound Dressing",
      "Health Status Reporting",
      "Mobility Assistance",
    ],
  },
  {
    icon: Home,
    title: "Home Support",
    items: [
      "Meal Preparation",
      "Laundry",
      "Light Housekeeping",
      "Bed Making",
    ],
  },
  {
    icon: ShieldPlus,
    title: "Health & Hygiene",
    items: [
      "Personal Hygiene",
      "Infection Prevention",
      "Patient Safety",
      "Clean Environment",
    ],
  },
  {
    icon: Users,
    title: "Companionship",
    items: [
      "Emotional Support",
      "Patient Companionship",
      "Social Interaction",
      "Family Communication",
    ],
  },
  {
    icon: Bed,
    title: "Wellness & Safety",
    items: [
      "Fall Prevention",
      "Wellness Monitoring",
      "Care Coordination",
      "Patient Observation",
    ],
  },
];

export default function Services() {

  return (

<FadeIn>

<section
id="services"
className="bg-slate-50 py-24"
>

<Container>

<SectionTitle
eyebrow="Professional Services"
title="Compassionate Home Nursing Care"
subtitle="Dedicated nursing support focused on comfort, dignity, safety and improved quality of life."
/>

<div className="grid gap-8 md:grid-cols-2 xl:grid-cols-3">

{services.map((service)=>{

const Icon = service.icon;

return(

<Card
key={service.title}
className="rounded-3xl border border-slate-200 bg-white p-8 shadow-sm transition duration-300 hover:-translate-y-2 hover:shadow-xl"
>

<div className="mb-6 flex h-16 w-16 items-center justify-center rounded-2xl bg-blue-100">

<Icon className="h-8 w-8 text-blue-700"/>

</div>

<h3 className="mb-6 text-2xl font-bold text-slate-900">

{service.title}

</h3>

<ul className="space-y-3">

{service.items.map(item=>(

<li
key={item}
className="flex items-center gap-3 text-slate-600"
>

<span className="text-blue-700 font-bold">✓</span>

{item}

</li>

))}

</ul>

<a
href="#contact"
className="mt-8 inline-flex items-center rounded-lg bg-blue-700 px-5 py-3 font-semibold text-white transition hover:bg-blue-800"
>

Book Appointment

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

Set-Content `
    -Path $ServiceFile `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Services.tsx updated successfully." -ForegroundColor Green
Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " PART 6 COMPLETE" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan