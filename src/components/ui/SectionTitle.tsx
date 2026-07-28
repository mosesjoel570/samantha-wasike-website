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
