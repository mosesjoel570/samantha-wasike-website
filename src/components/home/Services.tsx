import FadeIn from "../ui/FadeIn";
import { Container, SectionTitle } from "../ui";

const services = [

{
title:"Daily Living & Personal Care",
image:"https://images.unsplash.com/photo-1584515933487-779824d29309?auto=format&fit=crop&w=1200&q=80",
items:[
"Bathing & Grooming",
"Dressing Assistance",
"Toileting Support",
"Feeding Assistance"
]
},

{
title:"Basic Medical Monitoring",
image:"https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&w=1200&q=80",
items:[
"Vital Signs Monitoring",
"Medication Reminders",
"Wound Dressing",
"Mobility Assistance",
"Health Status Reporting"
]
},

{
title:"Home Support",
image:"https://images.unsplash.com/photo-1576091160550-2173dba999ef?auto=format&fit=crop&w=1200&q=80",
items:[
"Meal Preparation",
"Laundry",
"Bed Making",
"Light Housekeeping"
]
},

{
title:"Health & Hygiene",
image:"https://images.unsplash.com/photo-1582750433449-648ed127bb54?auto=format&fit=crop&w=1200&q=80",
items:[
"Personal Hygiene",
"Infection Prevention",
"Patient Safety",
"Clean Environment"
]
},

{
title:"Companionship",
image:"https://images.unsplash.com/photo-1516549655169-df83a0774514?auto=format&fit=crop&w=1200&q=80",
items:[
"Emotional Support",
"Patient Companionship",
"Social Interaction",
"Family Communication"
]
},

{
title:"Wellness & Safety",
image:"https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?auto=format&fit=crop&w=1200&q=80",
items:[
"Fall Prevention",
"Wellness Monitoring",
"Patient Observation",
"Care Coordination"
]
}

];

export default function Services(){

return(

<FadeIn>

<section id="services" className="bg-slate-50 py-24">

<Container>

<SectionTitle
eyebrow="Professional Services"
title="Compassionate Nursing Care"
subtitle="High-quality nursing services tailored to promote comfort, dignity, safety, and independence."
/>

<div className="grid gap-10 md:grid-cols-2 lg:grid-cols-3">

{services.map((service)=>(

<div
key={service.title}
className="overflow-hidden rounded-3xl bg-white shadow-lg transition-all duration-500 hover:-translate-y-2 hover:shadow-2xl"
>

<div className="overflow-hidden">

<img
src={service.image}
alt={service.title}
loading="lazy"
className="h-64 w-full object-cover transition duration-700 hover:scale-110"
/>

</div>

<div className="p-6">

<h3 className="mb-5 text-2xl font-bold text-slate-900">

{service.title}

</h3>

<ul className="space-y-3">

{service.items.map(item=>(

<li
key={item}
className="flex items-center gap-3 text-slate-700"
>

<span className="text-blue-700 font-bold">&#10003;</span>

{item}

</li>

))}

</ul>

<a
href="#contact"
className="mt-8 inline-block rounded-full bg-blue-700 px-6 py-3 font-semibold text-white transition duration-300 hover:bg-blue-800"
>

Book Appointment

</a>

</div>

</div>

))}

</div>

</Container>

</section>

</FadeIn>

);

}
