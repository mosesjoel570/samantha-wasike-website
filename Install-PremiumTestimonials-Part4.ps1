Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PREMIUM TESTIMONIALS - PART 4" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$File = ".\src\components\home\Testimonials.tsx"

if (!(Test-Path $File)) {
    Write-Host "[ERROR] Testimonials.tsx not found." -ForegroundColor Red
    exit
}

$Time = Get-Date -Format "yyyyMMdd_HHmmss"
$Backup = "..\backups\PremiumTestimonials_$Time"

New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item $File "$Backup\Testimonials.tsx"

Write-Host "[OK] Backup created." -ForegroundColor Green

$Code = @'
import FadeIn from "../ui/FadeIn";
import { Container, SectionTitle } from "../ui";

const testimonials = [

{
name:"Mary W.",
role:"Client",
image:"https://randomuser.me/api/portraits/women/44.jpg",
message:"Samantha provided exceptional home nursing care with kindness, professionalism, and genuine compassion. She made my recovery much easier."
},

{
name:"James K.",
role:"Family Member",
image:"https://randomuser.me/api/portraits/men/52.jpg",
message:"Our family appreciated Samantha's patience, dedication, and excellent communication. We always felt our loved one was in safe hands."
},

{
name:"Grace N.",
role:"Client",
image:"https://randomuser.me/api/portraits/women/68.jpg",
message:"Very professional, punctual, and caring. Samantha treated me with dignity and respect throughout my care."
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
title="What Clients Say"
subtitle="Real experiences from individuals and families who have received compassionate nursing care."
/>

<div className="grid gap-8 lg:grid-cols-3">

{testimonials.map((item)=>(

<div
key={item.name}
className="rounded-3xl border border-slate-200 bg-white p-8 shadow-lg transition duration-300 hover:-translate-y-2 hover:shadow-2xl"
>

<div className="mb-5 text-yellow-500 text-xl">
★★★★★
</div>

<p className="leading-8 text-slate-600">

"{item.message}"

</p>

<div className="mt-8 flex items-center gap-4">

<img
src={item.image}
alt={item.name}
className="h-16 w-16 rounded-full object-cover"
/>

<div>

<h3 className="font-bold text-slate-900">

{item.name}

</h3>

<p className="text-sm text-slate-500">

{item.role}

</p>

</div>

</div>

</div>

))}

</div>

</Container>

</section>

</FadeIn>

);

}
'@

Set-Content `
    -Path $File `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Premium Testimonials installed successfully." -ForegroundColor Green
Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PART 4 COMPLETE" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan