Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 5B PACK 2A" -ForegroundColor Green
Write-Host " Premium Loader Component" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$LoaderFile = Join-Path $Root "src\components\ui\Loader.tsx"

$Code = @'
import { motion } from "framer-motion";

export default function Loader() {

  return (

    <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-white">

      <div className="text-center">

        <motion.div
          className="mx-auto h-20 w-20 rounded-full border-4 border-blue-200 border-t-blue-700"
          animate={{ rotate: 360 }}
          transition={{
            repeat: Infinity,
            duration: 1,
            ease: "linear"
          }}
        />

        <h2 className="mt-6 text-2xl font-bold text-blue-700">
          Dr. Samantha Hospital
        </h2>

        <p className="mt-2 text-slate-600">
          Loading...
        </p>

      </div>

    </div>

  );

}
'@

[System.IO.File]::WriteAllText(
    $LoaderFile,
    $Code,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] Loader.tsx generated." -ForegroundColor Green

if(Test-Path $LoaderFile){
    Write-Host "[OK] Validation passed." -ForegroundColor Green
}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 5B PACK 2A COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next: Pack 2B - Page Transition & Loader Integration"