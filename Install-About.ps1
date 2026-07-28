# ==========================================================
# Dr. Samantha Hospital Website
# Install-About.ps1
# ==========================================================

Clear-Host
$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " Installing About Component" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$Folder = Join-Path $ProjectRoot "src\components\home"

if (!(Test-Path $Folder)) {
    New-Item -ItemType Directory -Force -Path $Folder | Out-Null
}

if (Test-Path (Join-Path $Folder "About.tsx")) {
    Copy-Item (Join-Path $Folder "About.tsx") (Join-Path $Folder "About.tsx.bak") -Force
    Write-Host "[OK] Backup created." -ForegroundColor Yellow
}

$Code = @'
import FadeIn from "../ui/FadeIn";

export default function About() {
  return (
    <FadeIn>
      <section id="about" className="bg-slate-50 py-24">
        <div className="mx-auto max-w-7xl px-6 grid gap-16 lg:grid-cols-2">

          <div>

            <p className="uppercase tracking-[4px] font-semibold text-blue-700">
              About Dr. Samantha Hospital
            </p>

            <h2 className="mt-4 text-5xl font-bold text-slate-900">
              Compassionate Healthcare for Every Patient
            </h2>

            <p className="mt-8 text-lg leading-8 text-gray-600">
              Dr. Samantha Hospital provides modern healthcare services
              focused on quality treatment, compassion and patient safety.
            </p>

            <p className="mt-6 text-lg leading-8 text-gray-600">
              We combine experienced professionals with advanced medical
              technology to ensure every patient receives exceptional care.
            </p>

          </div>

          <div className="rounded-3xl bg-gradient-to-br from-blue-700 to-cyan-600 p-10 text-white shadow-xl">

            <h3 className="text-3xl font-bold">
              Why Choose Us?
            </h3>

            <ul className="mt-8 space-y-4 text-lg">
              <li>✓ Compassionate Care</li>
              <li>✓ Experienced Medical Team</li>
              <li>✓ Modern Equipment</li>
              <li>✓ Personalized Treatment</li>
              <li>✓ Comfortable Environment</li>
            </ul>

          </div>

        </div>
      </section>
    </FadeIn>
  );
}
'@

$Output = Join-Path $Folder "About.tsx"

[System.IO.File]::WriteAllText(
    $Output,
    $Code,
    (New-Object System.Text.UTF8Encoding($false))
)

Write-Host ""
Write-Host "[OK] About.tsx created successfully." -ForegroundColor Green
Write-Host ""
Write-Host "=========================================" -ForegroundColor Green
Write-Host " INSTALL COMPLETE" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green