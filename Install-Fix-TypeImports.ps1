Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " FIXING TYPESCRIPT TYPE IMPORTS" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$Files = Get-ChildItem "$Root\src" -Recurse -Filter *.tsx

foreach($File in $Files){

    $Content = Get-Content $File.FullName -Raw

    $Content = $Content.Replace(
'import { ReactNode } from "react";',
'import type { ReactNode } from "react";'
)

    $Content = $Content.Replace(
'import { ButtonHTMLAttributes } from "react";',
'import type { ButtonHTMLAttributes } from "react";'
)

    $Content = $Content.Replace(
'import {
  ReactNode
} from "react";',
'import type {
  ReactNode
} from "react";'
)

    [System.IO.File]::WriteAllText(
        $File.FullName,
        $Content,
        [System.Text.UTF8Encoding]::new($false)
    )

}

Write-Host "[OK] Type imports fixed." -ForegroundColor Green

Write-Host ""
Write-Host "Running production build..." -ForegroundColor Yellow
Write-Host ""

npm run build

if($LASTEXITCODE -eq 0){

    Write-Host ""
    Write-Host "===============================================" -ForegroundColor Green
    Write-Host " BUILD SUCCESSFUL" -ForegroundColor Green
    Write-Host "===============================================" -ForegroundColor Green

}else{

    Write-Host ""
    Write-Host "===============================================" -ForegroundColor Red
    Write-Host " BUILD STILL HAS ERRORS" -ForegroundColor Red
    Write-Host "===============================================" -ForegroundColor Red

}