import { useState } from "react";

const links = [
  { label: "Home", href: "#home" },
  { label: "About", href: "#about" },
  { label: "Services", href: "#services" },
  { label: "Gallery", href: "#gallery" },
  { label: "Testimonials", href: "#testimonials" },
  { label: "Contact", href: "#contact" },
];

export default function Navbar() {
  const [open, setOpen] = useState(false);

  return (
    <header className="fixed top-0 left-0 right-0 z-50 border-b border-slate-200 bg-white/95 backdrop-blur shadow-sm">
      <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">

        <a
          href="#home"
          className="text-2xl font-bold text-blue-700"
        >
          Samantha Wasike
        </a>

        <nav className="hidden gap-8 md:flex">
          {links.map((link) => (
            <a
              key={link.label}
              href={link.href}
              className="font-medium text-slate-700 transition-colors duration-300 hover:text-blue-700"
            >
              {link.label}
            </a>
          ))}
        </nav>

        <a
          href="#contact"
          className="hidden rounded-full bg-blue-700 px-6 py-3 font-semibold text-white transition hover:bg-blue-800 md:inline-block"
        >
          Book Appointment
        </a>

        <button
          className="md:hidden"
          onClick={() => setOpen(!open)}
        >
          ☰
        </button>
      </div>

      {open && (
        <div className="border-t bg-white md:hidden">
          <div className="flex flex-col p-4">
            {links.map((link) => (
              <a
                key={link.label}
                href={link.href}
                className="py-3 text-slate-700 hover:text-blue-700"
                onClick={() => setOpen(false)}
              >
                {link.label}
              </a>
            ))}

            <a
              href="#contact"
              className="mt-4 rounded-full bg-blue-700 px-5 py-3 text-center font-semibold text-white"
              onClick={() => setOpen(false)}
            >
              Book Appointment
            </a>
          </div>
        </div>
      )}
    </header>
  );
}
