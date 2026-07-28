export default function AppointmentCTA() {
  return (
    <section className="bg-blue-800 py-24 text-white">
      <div className="mx-auto max-w-5xl px-6 text-center">
        <h2 className="text-5xl font-bold">
          Book Your Appointment Today
        </h2>

        <p className="mt-6 text-lg text-blue-100">
          Schedule a consultation with Dr. Samantha and receive
          compassionate, professional healthcare tailored to your needs.
        </p>

        <div className="mt-10 flex flex-wrap justify-center gap-4">
          <a
            href="/appointment"
            className="rounded-lg bg-white px-8 py-4 font-semibold text-blue-800 hover:bg-blue-100"
          >
            Book Appointment
          </a>

          <a
            href="/contact"
            className="rounded-lg border border-white px-8 py-4 font-semibold hover:bg-white hover:text-blue-800"
          >
            Contact Dr. Samantha
          </a>
        </div>
      </div>
    </section>
  );
}
