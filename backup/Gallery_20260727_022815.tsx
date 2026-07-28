const images = [
  "Reception",
  "Consultation Room",
  "Laboratory",
  "Patient Ward",
  "Pharmacy",
  "Emergency Unit",
];

export default function Gallery() {
  return (
    <section id="gallery" className="bg-white py-24">
      <div className="mx-auto max-w-7xl px-6">
        <p className="text-center font-semibold uppercase tracking-widest text-blue-700">
          Gallery
        </p>

        <h2 className="mt-4 text-center text-5xl font-bold">
          Our Hospital
        </h2>

        <div className="mt-16 grid gap-6 md:grid-cols-3">
          {images.map((item) => (
            <div
              key={item}
              className="flex h-64 items-center justify-center rounded-2xl border-2 border-dashed border-blue-300 bg-slate-100 text-center text-gray-500 shadow"
            >
              {item}
              <br />
              Image Placeholder
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
