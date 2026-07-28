Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 4C PACK 2C" -ForegroundColor Green
Write-Host " Premium Testimonials Component" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$TestimonialsFolder = Join-Path $Root "src\components\home"
$BackupFolder = Join-Path $Root "backup"

New-Item -ItemType Directory -Force $BackupFolder | Out-Null

$TestimonialsFile = Join-Path $TestimonialsFolder "Testimonials.tsx"

if(Test-Path $TestimonialsFile){

Copy-Item `
$TestimonialsFile `
(Join-Path $BackupFolder "Testimonials_$(Get-Date -Format yyyyMMdd_HHmmss).tsx") `
-Force

Write-Host "[OK] Backup created." -ForegroundColor Green

}

$Code=@'

import FadeIn from "../ui/FadeIn";
import { Container, Card, SectionTitle } from "../ui";
import { Star } from "lucide-react";

const testimonials=[

{
name:"Patient A",
message:"Excellent care from Dr. Samantha. The staff were professional, friendly and attentive throughout my visit."
},

{
name:"Patient B",
message:"A clean facility with outstanding medical services. I felt listened to and received quality treatment."
},

{
name:"Patient C",
message:"Booking an appointment was easy and the care I received exceeded my expectations."
}

];

export default function Testimonials(){

return(

<FadeIn>

<section
id="testimonials"
className="bg-white py-24"
>

<Container>

<SectionTitle

eyebrow="Testimonials"

title="What Our Patients Say"

subtitle="Real feedback from patients who trusted Dr. Samantha Hospital."

/>

<div className="grid gap-8 md:grid-cols-3">
{testimonials.map((item)=>(

<Card key={item.name}>

<div className="flex text-yellow-500 mb-4">

<Star className="h-5 w-5 fill-current"/>
<Star className="h-5 w-5 fill-current"/>
<Star className="h-5 w-5 fill-current"/>
<Star className="h-5 w-5 fill-current"/>
<Star className="h-5 w-5 fill-current"/>

</div>

<p className="leading-7 text-slate-600 italic">

"{item.message}"

</p>

<div className="mt-8">

<h3 className="font-bold text-lg text-slate-900">

{item.name}

</h3>

<p className="text-blue-700">

Verified Patient

</p>

</div>

</Card>

))}

</div>

</Container>

</section>

</FadeIn>

);

}

'@

[System.IO.File]::WriteAllText(

$TestimonialsFile,

$Code,

[System.Text.UTF8Encoding]::new($false)

)

Write-Host "[OK] Testimonials.tsx generated." -ForegroundColor Green

if(Test-Path $TestimonialsFile){

Write-Host "[OK] Validation passed." -ForegroundColor Green

}else{

Write-Host "[ERROR] Failed to create Testimonials.tsx" -ForegroundColor Red

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 4C PACK 2C COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Phase 4C COMPLETE." -ForegroundColor Cyan
Write-Host "Next: Phase 4D - Premium Gallery & Appointment Section" -ForegroundColor Yellow