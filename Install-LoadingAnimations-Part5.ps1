Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " PROFESSIONAL LOADING - PART 5" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

#----------------------------------------------------
# Create Component Folder
#----------------------------------------------------

$Folder = ".\src\components\common"

New-Item `
    -ItemType Directory `
    -Force `
    -Path $Folder | Out-Null

#----------------------------------------------------
# LoadingScreen.tsx
#----------------------------------------------------

$Loading = Join-Path $Folder "LoadingScreen.tsx"

$Code = @'
import { useEffect, useState } from "react";

export default function LoadingScreen(){

const [hide,setHide]=useState(false);

useEffect(()=>{

const timer=setTimeout(()=>{

setHide(true);

},1500);

return()=>clearTimeout(timer);

},[]);

if(hide) return null;

return(

<div className="fixed inset-0 z-[99999] flex items-center justify-center bg-white">

<div className="flex flex-col items-center">

<div className="h-20 w-20 animate-spin rounded-full border-4 border-slate-200 border-t-blue-700"/>

<h2 className="mt-8 text-3xl font-bold text-blue-700">

Samantha Wasike

</h2>

<p className="mt-2 text-slate-600">

Certified Nursing Assistant

</p>

</div>

</div>

);

}
'@

Set-Content `
    $Loading `
    $Code `
    -Encoding UTF8

#----------------------------------------------------
# PageFade.tsx
#----------------------------------------------------

$Fade = Join-Path $Folder "PageFade.tsx"

$FadeCode = @'
import { motion } from "framer-motion";

export default function PageFade({

children

}:{

children:React.ReactNode

}){

return(

<motion.div

initial={{opacity:0,y:20}}

animate={{opacity:1,y:0}}

transition={{

duration:.6

}}

>

{children}

</motion.div>

);

}
'@

Set-Content `
    $Fade `
    $FadeCode `
    -Encoding UTF8

Write-Host ""
Write-Host "[OK] LoadingScreen created." -ForegroundColor Green
Write-Host "[OK] PageFade created." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================="
Write-Host " PART 5 COMPLETE"
Write-Host "===================================================="