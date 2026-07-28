Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 4B" -ForegroundColor Green
Write-Host " Premium UI Components" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

$UI = Join-Path $Root "src\components\ui"

if (!(Test-Path $UI)) {
    New-Item -ItemType Directory -Force $UI | Out-Null
}

Write-Host "[OK] UI folder ready." -ForegroundColor Green

# -------------------------------------------------------
# Button
# -------------------------------------------------------

@'
import { ButtonHTMLAttributes } from "react";

type Props = ButtonHTMLAttributes<HTMLButtonElement> & {
  variant?: "primary" | "outline";
};

export default function Button({
  variant = "primary",
  className = "",
  children,
  ...props
}: Props) {

  const base =
    "rounded-xl px-6 py-3 font-semibold transition-all duration-300";

  const styles = {
    primary:
      "bg-blue-700 text-white hover:bg-blue-800 shadow-lg",

    outline:
      "border-2 border-blue-700 text-blue-700 hover:bg-blue-700 hover:text-white",
  };

  return (
    <button
      {...props}
      className={`${base} ${styles[variant]} ${className}`}
    >
      {children}
    </button>
  );
}
'@ | Set-Content "$UI\Button.tsx" -Encoding UTF8

Write-Host "[OK] Button.tsx"

# -------------------------------------------------------
# Card
# -------------------------------------------------------

@'
import { ReactNode } from "react";

type Props = {
  children: ReactNode;
  className?: string;
};

export default function Card({
  children,
  className = "",
}: Props) {
  return (
    <div
      className={`rounded-3xl bg-white p-8 shadow-lg transition duration-300 hover:-translate-y-2 hover:shadow-2xl ${className}`}
    >
      {children}
    </div>
  );
}
'@ | Set-Content "$UI\Card.tsx" -Encoding UTF8

Write-Host "[OK] Card.tsx"

# -------------------------------------------------------
# SectionTitle
# -------------------------------------------------------

@'
type Props = {
  eyebrow: string;
  title: string;
  subtitle?: string;
};

export default function SectionTitle({
  eyebrow,
  title,
  subtitle,
}: Props) {

  return (
    <div className="mx-auto mb-16 max-w-3xl text-center">

      <p className="font-semibold uppercase tracking-[5px] text-blue-700">
        {eyebrow}
      </p>

      <h2 className="mt-4 text-5xl font-bold text-slate-900">
        {title}
      </h2>

      {subtitle && (
        <p className="mt-6 text-lg text-slate-600">
          {subtitle}
        </p>
      )}

    </div>
  );
}
'@ | Set-Content "$UI\SectionTitle.tsx" -Encoding UTF8

Write-Host "[OK] SectionTitle.tsx"

# -------------------------------------------------------
# Container
# -------------------------------------------------------

@'
import { ReactNode } from "react";

type Props = {
  children: ReactNode;
};

export default function Container({
  children,
}: Props) {
  return (
    <div className="mx-auto max-w-7xl px-6">
      {children}
    </div>
  );
}
'@ | Set-Content "$UI\Container.tsx" -Encoding UTF8

Write-Host "[OK] Container.tsx"

# -------------------------------------------------------
# Badge
# -------------------------------------------------------

@'
import { ReactNode } from "react";

type Props = {
  children: ReactNode;
};

export default function Badge({
  children,
}: Props) {
  return (
    <span className="rounded-full bg-blue-100 px-4 py-2 text-sm font-semibold text-blue-700">
      {children}
    </span>
  );
}
'@ | Set-Content "$UI\Badge.tsx" -Encoding UTF8

Write-Host "[OK] Badge.tsx"

# -------------------------------------------------------
# UI Index
# -------------------------------------------------------

@'
export { default as Button } from "./Button";
export { default as Card } from "./Card";
export { default as Badge } from "./Badge";
export { default as Container } from "./Container";
export { default as SectionTitle } from "./SectionTitle";
export { default as FadeIn } from "./FadeIn";
'@ | Set-Content "$UI\index.ts" -Encoding UTF8

Write-Host "[OK] index.ts"

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 4B COMPLETED SUCCESSFULLY" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Generated:"
Write-Host "  - Button"
Write-Host "  - Card"
Write-Host "  - Badge"
Write-Host "  - Container"
Write-Host "  - SectionTitle"
Write-Host "  - UI Index"
Write-Host ""
Write-Host "Next:"
Write-Host "Phase 4C - Premium Services, Doctor & Testimonials"