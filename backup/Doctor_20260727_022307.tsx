export default function Doctor() {
  return (
    <section id="doctor" className="bg-slate-50 py-24">
      <div className="mx-auto grid max-w-7xl items-center gap-16 px-6 lg:grid-cols-2">
        {/* Image Placeholder */}
        <div className="flex justify-center">
          <div className="flex h-[500px] w-[400px] items-center justify-center rounded-3xl border-2 border-dashed border-blue-300 bg-white shadow-xl">
            <span className="text-center text-gray-500">
              Professional Photo
              <br />
              <strong>Dr. Samantha</strong>
            </span>
          </div>
        </div>

        {/* Content */}
        <div>
          <p className="font-semibold uppercase tracking-widest text-blue-700">
            Meet Your Doctor
          </p>

          <h2 className="mt-4 text-5xl font-bold text-slate-900">
            Dr. Samantha
          </h2>

          <p className="mt-8 text-lg leading-8 text-gray-600">
            Dr. Samantha is committed to providing compassionate,
            evidence-based healthcare with a strong focus on patient
            well-being. Every consultation is centered on listening,
            understanding, and delivering personalized medical care.
          </p>

          <div className="mt-10 grid gap-4 sm:grid-cols-2">
            <div className="rounded-xl bg-white p-5 shadow">
              <h3 className="font-bold text-blue-700">Patient Care</h3>
              <p className="mt-2 text-gray-600">
                Personalized treatment plans tailored to each patient.
              </p>
            </div>

            <div className="rounded-xl bg-white p-5 shadow">
              <h3 className="font-bold text-blue-700">Modern Medicine</h3>
              <p className="mt-2 text-gray-600">
                High-quality healthcare supported by current medical
                practices.
              </p>
            </div>
          </div>

          <div className="mt-10 flex flex-wrap gap-4">
            <a
              href="/appointment"
              className="rounded-lg bg-blue-700 px-6 py-3 font-semibold text-white hover:bg-blue-800"
            >
              Book Appointment
            </a>

            <a
              href="/contact"
              className="rounded-lg border border-blue-700 px-6 py-3 font-semibold text-blue-700 hover:bg-blue-700 hover:text-white"
            >
              Contact Dr. Samantha
            </a>
          </div>
        </div>
      </div>
    </section>
  );
}
