import type { ButtonHTMLAttributes } from "react";

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
