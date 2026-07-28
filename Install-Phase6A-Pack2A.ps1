Clear-Host

Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 6A PACK 2A" -ForegroundColor Green
Write-Host " Theme Context & Dark Mode Toggle" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

# ----------------------------------------------------
# ThemeContext.tsx
# ----------------------------------------------------

$ContextFolder = Join-Path $Root "src\context"

if (!(Test-Path $ContextFolder)) {
    New-Item -ItemType Directory -Force $ContextFolder | Out-Null
}

$ThemeContext = @'
import {
  createContext,
  useContext,
  useEffect,
  useState,
  ReactNode
} from "react";

type Theme = "light" | "dark";

type ThemeContextType = {
  theme: Theme;
  toggleTheme: () => void;
};

const ThemeContext = createContext<ThemeContextType>({
  theme: "light",
  toggleTheme: () => {}
});

export function ThemeProvider({
  children,
}: {
  children: ReactNode;
}) {

  const [theme, setTheme] = useState<Theme>("light");

  useEffect(() => {

    const saved = localStorage.getItem("theme") as Theme | null;

    if (saved) {
      setTheme(saved);
      document.documentElement.classList.toggle(
        "dark",
        saved === "dark"
      );
    }

  }, []);

  const toggleTheme = () => {

    const next = theme === "light"
      ? "dark"
      : "light";

    setTheme(next);

    document.documentElement.classList.toggle(
      "dark",
      next === "dark"
    );

    localStorage.setItem("theme", next);

  };

  return (
    <ThemeContext.Provider
      value={{
        theme,
        toggleTheme
      }}
    >
      {children}
    </ThemeContext.Provider>
  );

}

export const useTheme = () => useContext(ThemeContext);
'@

$ThemeContext | Set-Content "$ContextFolder\ThemeContext.tsx" -Encoding UTF8

Write-Host "[OK] ThemeContext.tsx generated." -ForegroundColor Green

# ----------------------------------------------------
# Navbar.tsx
# ----------------------------------------------------

$Navbar = Join-Path $Root "src\components\layout\Navbar\Navbar.tsx"

$NavbarCode = @'
import { useEffect, useState } from "react";
import { Moon, Sun } from "lucide-react";
import { motion } from "framer-motion";
import { useTheme } from "../../../context/ThemeContext";

const links = [
  { name: "Home", href: "#home" },
  { name: "About", href: "#about" },
  { name: "Services", href: "#services" },
  { name: "Doctor", href: "#doctor" },
  { name: "Gallery", href: "#gallery" },
  { name: "Contact", href: "#contact" }
];

export default function Navbar() {

  const { theme, toggleTheme } = useTheme();

  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {

    const scroll = () => {
      setScrolled(window.scrollY > 20);
    };

    window.addEventListener("scroll", scroll);

    return () => window.removeEventListener("scroll", scroll);

  }, []);

  return (

    <motion.header
      initial={{ y: -80 }}
      animate={{ y: 0 }}
      className={`fixed inset-x-0 top-0 z-50 transition ${
        scrolled
          ? "bg-white shadow-xl"
          : "bg-white/80 backdrop-blur"
      }`}
    >

      <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">

        <h2 className="text-2xl font-bold text-blue-700">
          Dr. Samantha Hospital
        </h2>

        <nav className="hidden gap-8 lg:flex">
          {links.map(link => (
            <a
              key={link.name}
              href={link.href}
              className="hover:text-blue-700"
            >
              {link.name}
            </a>
          ))}
        </nav>

        <div className="flex items-center gap-4">

          <button
            onClick={toggleTheme}
            className="rounded-full bg-slate-100 p-3"
          >
            {theme === "light"
              ? <Moon size={18}/>
              : <Sun size={18}/>}
          </button>

          <a
            href="#contact"
            className="rounded-xl bg-blue-700 px-5 py-3 text-white"
          >
            Book Appointment
          </a>

        </div>

      </div>

    </motion.header>

  );

}
'@

$NavbarCode | Set-Content $Navbar -Encoding UTF8

Write-Host "[OK] Navbar.tsx updated." -ForegroundColor Green

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 6A PACK 2A COMPLETED" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Next: Pack 2B - Global Theme Integration"