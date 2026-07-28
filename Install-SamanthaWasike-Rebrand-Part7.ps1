Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " SAMANTHA WASIKE WEBSITE REBRAND - PART 7" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

$GalleryFile = ".\src\components\home\Gallery.tsx"

if (!(Test-Path $GalleryFile)) {
    Write-Host "[ERROR] Gallery.tsx not found." -ForegroundColor Red
    exit
}

$Code = @'
import FadeIn from "../ui/FadeIn";
import { Container, Card, SectionTitle } from "../ui";

import gallery1 from "../../assets/gallery/gallery1.jpg";
import gallery2 from "../../assets/gallery/gallery2.jpg";
import gallery3 from "../../assets/gallery/gallery3.jpg";
import gallery4 from "../../assets/gallery/gallery4.jpg";
import gallery5 from "../../assets/gallery/gallery5.jpg";
import gallery6 from "../../assets/gallery/gallery6.jpg";

const gallery = [
  {
    title: "Patient Care",
    image: gallery1,
  },
  {
    title: "Professional Nursing",
    image: gallery2,
  },
  {
    title: "Health Assessment",
    image: gallery3,
  },
  {
    title: "Medication Support",
    image: gallery4,
  },
  {
    title: "Home Care Services",
    image: gallery5,
  },
  {
    title: "Compassionate Care",
    image: gallery6,
  },
];

export default function Gallery() {

  return (

<FadeIn>

<section
id="gallery"
className="bg-slate-100 py-24"
>

<Container>

<SectionTitle
eyebrow="Gallery"
title="Professional Nursing Portfolio"
subtitle="A glimpse into the compassionate and professional care provided by Samantha Wasike."
/>

<div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3">

{gallery.map((item)=>(

<Card
key={item.title}
className="overflow-hidden rounded-3xl p-0 shadow-lg transition duration-300 hover:-translate-y-2 hover:shadow-2xl"
>

<img
src={item.image}
alt={item.title}
className="h-72 w-full object-cover transition duration-500 hover:scale-105"
/>

<div className="p-6">

<h3 className="text-xl font-bold text-slate-900">

{item.title}

</h3>

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

Set-Content `
    -Path $GalleryFile `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Gallery.tsx updated successfully." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " PART 7 COMPLETE" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan