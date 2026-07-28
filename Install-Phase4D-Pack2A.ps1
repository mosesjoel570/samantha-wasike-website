Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 4D PACK 2A" -ForegroundColor Green
Write-Host " Premium Gallery Component" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$GalleryFile = Join-Path $Root "src\components\home\Gallery.tsx"

$Code=@'

import FadeIn from "../ui/FadeIn";
import { Container, Card, SectionTitle } from "../ui";

const gallery=[
{
title:"Reception",
image:"https://images.unsplash.com/photo-1586773860418-d37222d8fce3"
},
{
title:"Consultation Room",
image:"https://images.unsplash.com/photo-1576091160399-112ba8d25d1d"
},
{
title:"Laboratory",
image:"https://images.unsplash.com/photo-1579154204601-01588f351e67"
},
{
title:"Patient Ward",
image:"https://images.unsplash.com/photo-1538108149393-fbbd81895907"
},
{
title:"Pharmacy",
image:"https://images.unsplash.com/photo-1580281657527-47b4a3f4d7bb"
},
{
title:"Emergency Unit",
image:"https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d"
}
];

export default function Gallery(){

return(

<FadeIn>

<section
id="gallery"
className="bg-slate-50 py-24"
>

<Container>

<SectionTitle

eyebrow="Gallery"

title="Our Hospital"

subtitle="Take a look at our modern facilities and patient-centered environment."

/>

<div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3">

{gallery.map((item)=>(

<Card
key={item.title}
className="overflow-hidden p-0"
>

<img

src={item.image}

alt={item.title}

className="h-64 w-full object-cover transition duration-500 hover:scale-110"

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

[System.IO.File]::WriteAllText(

$GalleryFile,

$Code,

[System.Text.UTF8Encoding]::new($false)

)

Write-Host "[OK] Gallery.tsx generated." -ForegroundColor Green

if(Test-Path $GalleryFile){

Write-Host "[OK] Validation passed." -ForegroundColor Green

}else{

Write-Host "[ERROR] Failed to create Gallery.tsx" -ForegroundColor Red

}