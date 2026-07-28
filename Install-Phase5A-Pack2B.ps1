Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 5A PACK 2B" -ForegroundColor Green
Write-Host " Smooth Scroll & Global Animation Setup" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

# ---------------------------------------------------
# App.tsx
# ---------------------------------------------------

$AppFile = Join-Path $Root "src\App.tsx"

$AppCode = @'
import AppRoutes from "./routes/AppRoutes";

export default function App() {

  return (

    <div className="scroll-smooth">

      <AppRoutes />

    </div>

  );

}
'@

[System.IO.File]::WriteAllText(
    $AppFile,
    $AppCode,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] App.tsx updated." -ForegroundColor Green

# ---------------------------------------------------
# main.tsx
# ---------------------------------------------------

$MainFile = Join-Path $Root "src\main.tsx"

$MainCode = @'
import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter } from "react-router-dom";
import "./index.css";
import App from "./App";

ReactDOM.createRoot(
  document.getElementById("root")!
).render(

  <React.StrictMode>

    <BrowserRouter>

      <App />

    </BrowserRouter>

  </React.StrictMode>

);
'@

[System.IO.File]::WriteAllText(
    $MainFile,
    $MainCode,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] main.tsx updated." -ForegroundColor Green

# ---------------------------------------------------
# index.css
# ---------------------------------------------------

$CssFile = Join-Path $Root "src\index.css"

if(Test-Path $CssFile){

Add-Content $CssFile @'

html{
scroll-behavior:smooth;
}

body{
overflow-x:hidden;
}

section{
scroll-margin-top:90px;
}

'@

Write-Host "[OK] Smooth scrolling enabled." -ForegroundColor Green

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 5A PACK 2B COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Phase 5A COMPLETE."
Write-Host "Next: Phase 5B - Loading Screen & Page Transitions"