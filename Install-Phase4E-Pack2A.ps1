Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 4E PACK 2A" -ForegroundColor Green
Write-Host " Premium Contact Component" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$ContactFile = Join-Path $Root "src\components\home\Contact.tsx"

$Code = @'

import FadeIn from "../ui/FadeIn";
import { Container, Card, SectionTitle } from "../ui";
import { Phone, Mail, MapPin, Clock } from "lucide-react";

export default function Contact() {

  return (

    <FadeIn>

      <section
        id="contact"
        className="bg-slate-50 py-24"
      >

        <Container>

          <SectionTitle
            eyebrow="Contact Us"
            title="Get In Touch"
            subtitle="Reach out to Dr. Samantha Hospital. We are always ready to assist you."
          />

          <div className="grid gap-8 lg:grid-cols-2">

            <Card>

              <div className="space-y-8">

                <div className="flex items-start gap-4">

                  <Phone className="h-8 w-8 text-blue-700"/>

                  <div>

                    <h3 className="font-bold text-xl">Phone</h3>

                    <p className="text-slate-600">
                      +254 704 271129
                    </p>

                  </div>

                </div>

                <div className="flex items-start gap-4">

                  <Mail className="h-8 w-8 text-blue-700"/>

                  <div>

                    <h3 className="font-bold text-xl">Email</h3>

                    <p className="text-slate-600">
                      wasikesamantha03@gmail.com
                    </p>

                  </div>

                </div>

                <div className="flex items-start gap-4">

                  <MapPin className="h-8 w-8 text-blue-700"/>

                  <div>

                    <h3 className="font-bold text-xl">Location</h3>

                    <p className="text-slate-600">
                      Nairobi, Kenya
                    </p>

                  </div>

                </div>

                <div className="flex items-start gap-4">

                  <Clock className="h-8 w-8 text-blue-700"/>

                  <div>

                    <h3 className="font-bold text-xl">
                      Working Hours
                    </h3>

                    <p className="text-slate-600">
                      Mon - Sun : 24 Hours
                    </p>

                  </div>

                </div>

              </div>

            </Card>

            <Card>

              <form className="space-y-5">

                <input
                  className="w-full rounded-xl border p-4"
                  placeholder="Full Name"
                />

                <input
                  className="w-full rounded-xl border p-4"
                  placeholder="Email Address"
                />

                <input
                  className="w-full rounded-xl border p-4"
                  placeholder="Phone Number"
                />

                <textarea
                  rows={6}
                  className="w-full rounded-xl border p-4"
                  placeholder="Your Message"
                />

                <button
                  className="w-full rounded-xl bg-blue-700 py-4 font-semibold text-white hover:bg-blue-800"
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

[System.IO.File]::WriteAllText(
    $ContactFile,
    $Code,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] Contact.tsx generated." -ForegroundColor Green

if(Test-Path $ContactFile){

    Write-Host "[OK] Validation passed." -ForegroundColor Green

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 4E PACK 2A COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next: Pack 2B - Premium Footer"