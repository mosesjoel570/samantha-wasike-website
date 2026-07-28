Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 5B PACK 2B" -ForegroundColor Green
Write-Host " Page Transition & Loader Integration" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

# --------------------------------------------------
# App.tsx
# --------------------------------------------------

$AppFile = Join-Path $Root "src\App.tsx"

$Code = @'
import { useEffect, useState } from "react";
import AppRoutes from "./routes/AppRoutes";
import Loader from "./components/ui/Loader";

export default function App() {

  const [loading, setLoading] = useState(true);

  useEffect(() => {

    const timer = setTimeout(() => {
      setLoading(false);
    }, 1800);

    return () => clearTimeout(timer);

  }, []);

  if (loading) {
    return <Loader />;
  }

  return <AppRoutes />;

}
'@

[System.IO.File]::WriteAllText(
    $AppFile,
    $Code,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] App.tsx updated." -ForegroundColor Green

# --------------------------------------------------
# AppRoutes.tsx
# --------------------------------------------------

$RoutesFile = Join-Path $Root "src\routes\AppRoutes.tsx"

$Routes = @'
import { Routes, Route } from "react-router-dom";
import { AnimatePresence } from "framer-motion";

import MainLayout from "../layouts/MainLayout";
import Home from "../pages/Home";

export default function AppRoutes() {

  return (

    <AnimatePresence mode="wait">

      <Routes>

        <Route element={<MainLayout />}>

          <Route
            path="/"
            element={<Home />}
          />

        </Route>

      </Routes>

    </AnimatePresence>

  );

}
'@

[System.IO.File]::WriteAllText(
    $RoutesFile,
    $Routes,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "[OK] AppRoutes.tsx updated." -ForegroundColor Green

Write-Host ""

Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 5B PACK 2B COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green

Write-Host ""
Write-Host "Phase 5B COMPLETE."
Write-Host "Next: Phase 5C - Premium Navigation Animations"