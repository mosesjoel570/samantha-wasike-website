Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " SMART APPOINTMENT FORM - PART 2" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$File = ".\src\components\home\Contact.tsx"

if (!(Test-Path $File)) {
    Write-Host "[ERROR] Contact.tsx not found." -ForegroundColor Red
    exit
}

$Backup = "..\backups\AppointmentForm_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
New-Item -ItemType Directory -Force -Path $Backup | Out-Null
Copy-Item $File "$Backup\Contact.tsx"

Write-Host "[OK] Backup created." -ForegroundColor Green

$Code = @'
import { useState } from "react";
import FadeIn from "../ui/FadeIn";
import { Container, SectionTitle } from "../ui";
import { Phone, Mail, MapPin, MessageCircle } from "lucide-react";

export default function Contact(){

const [form,setForm]=useState({
name:"",
email:"",
phone:"",
message:""
});

const [loading,setLoading]=useState(false);

function update(e:any){
setForm({...form,[e.target.name]:e.target.value});
}

function submit(e:any){

e.preventDefault();

if(
!form.name||
!form.email||
!form.phone||
!form.message
){
alert("Please complete all fields.");
return;
}

setLoading(true);

const text=encodeURIComponent(
`Appointment Request

Name: ${form.name}

Email: ${form.email}

Phone: ${form.phone}

Care Needed:
${form.message}`
);

setTimeout(()=>{

window.open(
`https://wa.me/254704271129?text=${text}`,
"_blank"
);

setLoading(false);

alert("Your appointment request is ready to send via WhatsApp.");

},1000);

}

return(

<FadeIn>

<section id="contact" className="bg-slate-50 py-24">

<Container>

<SectionTitle
eyebrow="Appointments"
title="Book Nursing Care"
subtitle="Complete the form below and we'll prepare your WhatsApp appointment request."
/>

<form
onSubmit={submit}
className="mx-auto max-w-3xl rounded-3xl bg-white p-10 shadow-xl space-y-6"
>

<input
name="name"
placeholder="Full Name"
value={form.name}
onChange={update}
className="w-full rounded-xl border p-4"
/>

<input
name="email"
type="email"
placeholder="Email Address"
value={form.email}
onChange={update}
className="w-full rounded-xl border p-4"
/>

<input
name="phone"
placeholder="Phone Number"
value={form.phone}
onChange={update}
className="w-full rounded-xl border p-4"
/>

<textarea
name="message"
rows={6}
placeholder="Describe the nursing care you need..."
value={form.message}
onChange={update}
className="w-full rounded-xl border p-4"
/>

<button
type="submit"
disabled={loading}
className="w-full rounded-xl bg-blue-700 py-4 font-semibold text-white hover:bg-blue-800 disabled:opacity-60"
>
{loading ? "Preparing..." : "Book via WhatsApp"}
</button>

</form>

</Container>

</section>

</FadeIn>

);

}
'@

Set-Content -Path $File -Value $Code -Encoding UTF8

Write-Host ""
Write-Host "[OK] Smart appointment form installed." -ForegroundColor Green
Write-Host ""
Write-Host "===================================================="
Write-Host " PART 2 COMPLETE"
Write-Host "===================================================="