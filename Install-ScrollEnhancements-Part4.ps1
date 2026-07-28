Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " SCROLL ENHANCEMENTS - PART 4" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$Folder = ".\src\components\common"

New-Item `
    -ItemType Directory `
    -Force `
    -Path $Folder | Out-Null

$Component = Join-Path $Folder "ScrollEnhancements.tsx"

$Code = @'
import { useEffect, useState } from "react";
import { ArrowUp } from "lucide-react";

export default function ScrollEnhancements() {

const [progress,setProgress]=useState(0);
const [showTop,setShowTop]=useState(false);

useEffect(()=>{

function onScroll(){

const total =
document.documentElement.scrollHeight -
window.innerHeight;

const percent =
(window.scrollY/total)*100;

setProgress(percent);

setShowTop(window.scrollY>300);

}

window.addEventListener("scroll",onScroll);

onScroll();

return ()=>window.removeEventListener("scroll",onScroll);

},[]);

return(

<>

<div
className="fixed left-0 top-0 z-[9999] h-1 bg-blue-600 transition-all duration-150"
style={{width:`${progress}%`}}
/>

{showTop && (

<button

onClick={()=>window.scrollTo({

top:0,

behavior:"smooth"

})}

className="fixed bottom-24 right-6 z-50 flex h-14 w-14 items-center justify-center rounded-full bg-blue-700 text-white shadow-2xl transition hover:scale-110 hover:bg-blue-800"

aria-label="Back to top"

>

<ArrowUp size={24}/>

</button>

)}

</>

);

}
'@

Set-Content `
    -Path $Component `
    -Value $Code `
    -Encoding UTF8

Write-Host "[OK] ScrollEnhancements.tsx created." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================="
Write-Host " PART 4 COMPLETE"
Write-Host "===================================================="