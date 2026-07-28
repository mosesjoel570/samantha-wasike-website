Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 6A PACK 2B" -ForegroundColor Green
Write-Host " Global Theme Integration" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

# ----------------------------------------------------
# App.tsx
# ----------------------------------------------------

$AppFile = Join-Path $Root "src\App.tsx"

$AppCode = @'
import AppRoutes from "./routes/AppRoutes";
import { ThemeProvider } from "./context/ThemeContext";

export default function App() {

  return (

    <ThemeProvider>

      <AppRoutes />

    </ThemeProvider>

  );

}
'@

$AppCode | Set-Content $AppFile -Encoding UTF8

Write-Host "[OK] App.tsx updated." -ForegroundColor Green

# ----------------------------------------------------
# main.tsx
# ----------------------------------------------------

$MainFile = Join-Path $Root "src\main.tsx"

$MainCode = @'
import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter } from "react-router-dom";

import App from "./App";

import "./index.css";

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

$MainCode | Set-Content $MainFile -Encoding UTF8

Write-Host "[OK] main.tsx updated." -ForegroundColor Green

# ----------------------------------------------------
# Tailwind Dark Mode
# ----------------------------------------------------

$Tailwind = Join-Path $Root "tailwind.config.js"

if(Test-Path $Tailwind){

    $Content = Get-Content $Tailwind -Raw

    if($Content -notmatch "darkMode"){

        $Content = $Content -replace "module\.exports\s*=\s*{","module.exports = {`r`n  darkMode: 'class',"

        Set-Content $Tailwind $Content -Encoding UTF8

        Write-Host "[OK] Dark mode enabled in tailwind.config.js" -ForegroundColor Green

    }
    else{

        Write-Host "[OK] Tailwind already configured." -ForegroundColor Green

    }

}
else{

    Write-Host "[INFO] tailwind.config.js not found. Skipped." -ForegroundColor Yellow

}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 6A PACK 2B COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Phase 6A COMPLETE."
Write-Host "Next: Phase 6B - Advanced UI Polish & Responsive Optimization"