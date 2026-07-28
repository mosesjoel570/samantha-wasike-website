Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 5A PACK 2A" -ForegroundColor Green
Write-Host " Premium Scroll Animation Component" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$FadeFile = Join-Path $Root "src\components\ui\FadeIn.tsx"

$Code = @'

import { motion } from "framer-motion";
import { ReactNode } from "react";

type Props = {
  children: ReactNode;
  delay?: number;
};

export default function FadeIn({
  children,
  delay = 0,
}: Props) {

  return (

    <motion.div

      initial={{
        opacity:0,
        y:40
      }}

      whileInView={{
        opacity:1,
        y:0
      }}

      viewport={{
        once:true,
        amount:0.2
      }}

      transition={{
        duration:0.7,
        delay
      }}

    >

      {children}

    </motion.div>

  );

}

'@

[System.IO.File]::WriteAllText(
    $FadeFile,
    $Code,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] FadeIn.tsx generated." -ForegroundColor Green

if(Test-Path $FadeFile){
    Write-Host "[OK] Validation passed." -ForegroundColor Green
}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 5A PACK 2A COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next: Pack 2B - Smooth Scroll & Global Animation Setup"