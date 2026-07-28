Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " SAMANTHA WASIKE WEBSITE REBRAND - PART 2" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

$DoctorFile = ".\src\components\home\Doctor.tsx"

if (!(Test-Path $DoctorFile)) {
    Write-Host "[ERROR] Doctor.tsx not found." -ForegroundColor Red
    exit
}

$Code = @'
import FadeIn from "../ui/FadeIn";
import { Container, SectionTitle, Card } from "../ui";
import doctorImage from "../../assets/images/Dr.Samantha.png";

export default function Doctor() {
  return (
    <FadeIn>
      <section id="doctor" className="bg-slate-50 py-24">
        <Container>

          <SectionTitle
            eyebrow="Meet Your Caregiver"
            title="Samantha Wasike"
            subtitle="Certified Nursing Assistant"
          />

          <div className="grid items-center gap-16 lg:grid-cols-2">

            <div className="flex justify-center">
              <img
                src={doctorImage}
                alt="Samantha Wasike"
                className="h-[430px] w-[360px] rounded-3xl object-cover shadow-2xl"
              />
            </div>

            <Card className="border border-slate-100 shadow-lg">

              <h3 className="text-3xl font-bold text-blue-700">
                Samantha Wasike
              </h3>

              <p className="mt-2 text-lg font-medium text-slate-500">
                Certified Nursing Assistant
              </p>

              <p className="mt-6 leading-8 text-slate-600">
                Samantha Wasike is a compassionate Certified Nursing Assistant
                dedicated to delivering high-quality, patient-centered care.
                She provides professional support with dignity, respect, and
                empathy while promoting the comfort, safety, and well-being of
                every client.
              </p>

              <div className="mt-8 space-y-4 text-slate-700">

                <div>✓ Compassionate Patient Care</div>

                <div>✓ Medication Assistance</div>

                <div>✓ Personal Hygiene Support</div>

                <div>✓ Wound Dressing</div>

                <div>✓ Home-Based Nursing Care</div>

                <div>✓ Health Monitoring</div>

              </div>

            </Card>

          </div>

        </Container>
      </section>
    </FadeIn>
  );
}
'@

Set-Content `
    -Path $DoctorFile `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Doctor.tsx updated successfully." -ForegroundColor Green
Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " PART 2 COMPLETE" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan