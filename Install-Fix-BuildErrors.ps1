Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE BUILD FIXER" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

# ----------------------------------------
# Backup
# ----------------------------------------

$Backup = Join-Path $Root "backup"

New-Item -ItemType Directory -Force $Backup | Out-Null

foreach($File in @(
"src\components\home\Doctor.tsx",
"vite.config.ts"
)){

    $Path = Join-Path $Root $File

    if(Test-Path $Path){

        Copy-Item $Path `
        (Join-Path $Backup ((Split-Path $File -Leaf)+"_"+(Get-Date -Format yyyyMMdd_HHmmss))) `
        -Force

        Write-Host "[OK] Backup:" (Split-Path $File -Leaf) -ForegroundColor Green

    }

}

# ----------------------------------------
# Fix Doctor.tsx
# ----------------------------------------

$DoctorFile = Join-Path $Root "src\components\home\Doctor.tsx"

$DoctorCode = @'
import FadeIn from "../ui/FadeIn";
import { Container, SectionTitle, Card } from "../ui";

export default function Doctor() {

  return (

    <FadeIn>

      <section id="doctor" className="py-24 bg-slate-50">

        <Container>

          <SectionTitle
            eyebrow="Meet Your Doctor"
            title="Dr. Samantha"
            subtitle="Compassionate, evidence-based healthcare tailored to every patient."
          />

          <div className="grid items-center gap-16 lg:grid-cols-2">

            <div className="flex justify-center">

              <div className="flex h-80 w-80 items-center justify-center rounded-3xl bg-slate-200 text-2xl font-bold text-slate-600 shadow-xl">

                Professional Photo

              </div>

            </div>

            <Card>

              <h3 className="text-3xl font-bold text-blue-700">
                Dr. Samantha
              </h3>

              <p className="mt-6 leading-8 text-slate-600">
                Dr. Samantha is committed to providing compassionate,
                evidence-based healthcare with a strong focus on
                patient well-being.
              </p>

              <div className="mt-8 space-y-4">

                <div>✓ Personalized Patient Care</div>

                <div>✓ Modern Medical Practice</div>

                <div>✓ Preventive Healthcare</div>

                <div>✓ Long-term Wellness</div>

              </div>

            </Card>

          </div>

        </Container>

      </section>

    </FadeIn>

  );

}
'@

[System.IO.File]::WriteAllText(
$DoctorFile,
$DoctorCode,
[System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] Doctor.tsx repaired." -ForegroundColor Green

# ----------------------------------------
# Fix vite.config.ts
# ----------------------------------------

$ViteFile = Join-Path $Root "vite.config.ts"

$ViteCode = @'
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({

  plugins: [react()],

  build: {

    target: "esnext",

    sourcemap: false,

    minify: "esbuild"

  }

});
'@

[System.IO.File]::WriteAllText(
$ViteFile,
$ViteCode,
[System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] vite.config.ts repaired." -ForegroundColor Green

# ----------------------------------------
# Build
# ----------------------------------------

Write-Host ""
Write-Host "Running production build..." -ForegroundColor Yellow

npm run build

if($LASTEXITCODE -eq 0){

Write-Host ""
Write-Host "[OK] BUILD SUCCESSFUL" -ForegroundColor Green

}else{

Write-Host ""
Write-Host "[ERROR] Build still has errors." -ForegroundColor Red

}

Write-Host ""
Write-Host "==============================================="
Write-Host " BUILD FIX COMPLETE"
Write-Host "==============================================="