# ==========================================================
# Dr. Samantha Hospital Website
# Install-Statistics.ps1
# ==========================================================

Clear-Host
$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " Installing Statistics Component" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$Folder = Join-Path $ProjectRoot "src\components\home"

if (!(Test-Path $Folder)) {
    New-Item -ItemType Directory -Force -Path $Folder | Out-Null
}

if (Test-Path "$Folder\Statistics.tsx") {
    Copy-Item "$Folder\Statistics.tsx" "$Folder\Statistics.tsx.bak" -Force
    Write-Host "[OK] Backup created." -ForegroundColor Yellow
}

$Code = @'
import FadeIn from "../ui/FadeIn";

const stats = [
  { number: "15+", title: "Years of Excellence" },
  { number: "10,000+", title: "Patients Served" },
  { number: "24/7", title: "Emergency Care" },
  { number: "98%", title: "Patient Satisfaction" }
];

export default function Statistics() {
  return (
    <FadeIn>
      <section
        id="statistics"
        className="bg-blue-700 py-20 text-white"
      >
        <div className="mx-auto max-w-7xl px-6">
          <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-4">

            {stats.map((item) => (

              <div
                key={item.title}
                className="rounded-2xl bg-white/10 p-8 text-center backdrop-blur"
              >

                <h2 className="text-5xl font-bold">
                  {item.number}
                </h2>

                <p className="mt-4 text-blue-100">
                  {item.title}
                </p>

              </div>

            ))}

          </div>
        </div>
      </section>
    </FadeIn>
  );
}
'@

$OutputFile = Join-Path $Folder "Statistics.tsx"

[System.IO.File]::WriteAllText(
    $OutputFile,
    $Code,
    (New-Object System.Text.UTF8Encoding($false))
)

Write-Host ""
Write-Host "[OK] Statistics.tsx created successfully." -ForegroundColor Green
Write-Host ""
Write-Host "=========================================" -ForegroundColor Green
Write-Host " INSTALL COMPLETE" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green