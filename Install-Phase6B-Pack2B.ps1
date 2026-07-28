Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 6B PACK 2B" -ForegroundColor Green
Write-Host " Final Premium UI Enhancement" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$Navbar = Join-Path $Root "src\components\layout\Navbar\Navbar.tsx"
$Footer = Join-Path $Root "src\components\layout\Footer\Footer.tsx"

if(Test-Path $Navbar){

    $Content = Get-Content $Navbar -Raw

    if($Content -notmatch "backdrop-blur-xl"){

        $Content = $Content.Replace(
            "backdrop-blur",
            "backdrop-blur-xl"
        )

    }

    if($Content -notmatch "shadow-2xl"){

        $Content = $Content.Replace(
            "shadow-xl",
            "shadow-2xl"
        )

    }

    [System.IO.File]::WriteAllText(
        $Navbar,
        $Content,
        [System.Text.UTF8Encoding]::new($false)
    )

    Write-Host "[OK] Navbar enhanced." -ForegroundColor Green

}

if(Test-Path $Footer){

$FooterCode = @'
export default function Footer(){

return(

<footer className="bg-slate-950 text-white">

<div className="mx-auto max-w-7xl px-6 py-16 text-center">

<h2 className="text-3xl font-bold text-blue-400">
Dr. Samantha Hospital
</h2>

<p className="mt-4 text-slate-300">
Exceptional Healthcare | Compassionate Care
</p>

<div className="my-8 h-px bg-slate-700"></div>

<p className="text-sm text-slate-400">
Copyright © 2026 Dr. Samantha Hospital.
All Rights Reserved.
</p>

</div>

</footer>

)

}
'@

    [System.IO.File]::WriteAllText(
        $Footer,
        $FooterCode,
        [System.Text.UTF8Encoding]::new($false)
    )

    Write-Host "[OK] Footer enhanced." -ForegroundColor Green

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 6B PACK 2B COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Phase 6B COMPLETE."
Write-Host "Premium UI Polish Finished."
Write-Host ""
Write-Host "Next: Phase 7A - SEO, Performance & Production Optimization"