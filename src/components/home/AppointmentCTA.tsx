
import FadeIn from "../ui/FadeIn";
import { Container, Button } from "../ui";
import { CalendarDays } from "lucide-react";

export default function AppointmentCTA(){

return(

<FadeIn>

<section
className="bg-gradient-to-r from-blue-700 to-cyan-600 py-24 text-white"
>

<Container>

<div className="mx-auto max-w-4xl text-center">

<div className="mb-8 flex justify-center">

<div className="rounded-full bg-white/20 p-5">

<CalendarDays className="h-12 w-12"/>

</div>

</div>

<h2 className="text-5xl font-bold">

Book Your Appointment Today

</h2>

<p className="mx-auto mt-6 max-w-2xl text-xl text-blue-100">

Schedule a consultation with Samantha Wasike and receive compassionate,
professional healthcare tailored to your needs.

</p>

<div className="mt-10 flex justify-center gap-4 flex-wrap">

<a href="#contact">

<Button>

Book Appointment

</Button>

</a>

<a
href="tel:+254704271129"
>

<Button variant="outline">

Call Now

</Button>

</a>

</div>

</div>

</Container>

</section>

</FadeIn>

);

}

