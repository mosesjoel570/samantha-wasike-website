import type { ReactNode } from "react";

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
