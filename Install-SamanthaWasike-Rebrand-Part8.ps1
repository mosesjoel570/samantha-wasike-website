Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " SAMANTHA WASIKE WEBSITE REBRAND - PART 8" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

$ContactFile = ".\src\components\home\Contact.tsx"

if (!(Test-Path $ContactFile)) {
    Write-Host "[ERROR] Contact.tsx not found." -ForegroundColor Red
    exit
}

$Code = @'
import FadeIn from "../ui/FadeIn";
import { Container, SectionTitle, Card } from "../ui";
import {
  Phone,
  Mail,
  MapPin,
  MessageCircle,
} from "lucide-react";

export default function Contact() {

  return (

<FadeIn>

<section
id="contact"
className="bg-white py-24"
>

<Container>

<SectionTitle
eyebrow="Contact"
title="Get in Touch"
subtitle="I'm available to provide compassionate and professional nursing care. Feel free to contact me for appointments or inquiries."
/>

<div className="grid gap-10 lg:grid-cols-2">

<Card className="space-y-6">

<div className="flex items-center gap-4">
<Phone className="h-6 w-6 text-blue-700"/>
<div>
<h3 className="font-semibold text-slate-900">Phone</h3>
<p className="text-slate-600">+254 704271129</p>
</div>
</div>

<div className="flex items-center gap-4">
<MessageCircle className="h-6 w-6 text-green-600"/>
<div>
<h3 className="font-semibold text-slate-900">WhatsApp</h3>
<p className="text-slate-600">+254 704271129</p>
</div>
</div>

<div className="flex items-center gap-4">
<Mail className="h-6 w-6 text-red-500"/>
<div>
<h3 className="font-semibold text-slate-900">Email</h3>
<p className="text-slate-600">wasikesamantha03@gmail.com</p>
</div>
</div>

<div className="flex items-center gap-4">
<MapPin className="h-6 w-6 text-blue-700"/>
<div>
<h3 className="font-semibold text-slate-900">Location</h3>
<p className="text-slate-600">Nairobi, Kenya</p>
</div>
</div>

</Card>

<Card>

<form className="space-y-5">

<input
type="text"
placeholder="Full Name"
className="w-full rounded-xl border border-slate-300 px-4 py-3 outline-none focus:border-blue-700"
/>

<input
type="email"
placeholder="Email Address"
className="w-full rounded-xl border border-slate-300 px-4 py-3 outline-none focus:border-blue-700"
/>

<input
type="tel"
placeholder="Phone Number"
className="w-full rounded-xl border border-slate-300 px-4 py-3 outline-none focus:border-blue-700"
/>

<textarea
rows={5}
placeholder="Your Message"
className="w-full rounded-xl border border-slate-300 px-4 py-3 outline-none focus:border-blue-700"
/>

<button
type="submit"
className="rounded-xl bg-blue-700 px-8 py-3 font-semibold text-white transition hover:bg-blue-800"
>
Send Message
</button>

</form>

</Card>

</div>

</Container>

</section>

</FadeIn>

);

}
'@

Set-Content `
    -Path $ContactFile `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Contact.tsx updated successfully." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " PART 8 COMPLETE" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan