Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " SAMANTHA WASIKE WEBSITE REBRAND - PART 3" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

$HeroFile = ".\src\components\home\Hero.tsx"

if (!(Test-Path $HeroFile)) {
    Write-Host "[ERROR] Hero.tsx not found." -ForegroundColor Red
    exit
}

$Code = @'
import FadeIn from "../ui/FadeIn";
import { Container } from "../ui";
import heroImage from "../../assets/images/hero.jpg";

export default function Hero() {
  return (
    <FadeIn>
      <section
        id="home"
        className="relative overflow-hidden bg-slate-950"
      >
        <div className="absolute inset-0">
          <img
            src={heroImage}
            alt="Healthcare"
            className="h-full w-full object-cover opacity-30"
          />
          <div className="absolute inset-0 bg-slate-900/60"></div>
        </div>

        <Container>
          <div className="relative z-10 flex min-h-[90vh] items-center">

            <div className="max-w-3xl text-white">

              <p className="mb-4 text-lg font-semibold uppercase tracking-[0.3em] text-blue-300">
                Certified Nursing Assistant
              </p>

              <h1 className="text-5xl font-extrabold leading-tight md:text-7xl">
                Samantha Wasike
              </h1>

              <p className="mt-8 max-w-2xl text-xl leading-9 text-slate-200">
                Providing compassionate, professional, and personalized
                nursing care services that promote comfort, dignity,
                independence, and improved quality of life.
              </p>

              <div className="mt-10 flex flex-wrap gap-5">

                <a
                  href="#contact"
                  className="rounded-xl bg-blue-600 px-8 py-4 font-semibold text-white transition hover:bg-blue-700"
                >
                  Book Appointment
                </a>

                <a
                  href="#services"
                  className="rounded-xl border border-white px-8 py-4 font-semibold text-white transition hover:bg-white hover:text-slate-900"
                >
                  Explore Services
                </a>

              </div>

            </div>

          </div>
        </Container>
      </section>
    </FadeIn>
  );
}
'@

Set-Content `
    -Path $HeroFile `
    -Value $Code `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] Hero.tsx updated successfully." -ForegroundColor Green
Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host " PART 3 COMPLETE" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Cyan