import { Star } from "lucide-react";

const testimonials = [
  {
    name: "Patient A",
    review:
      "Excellent care from Dr. Samantha. The staff were professional, friendly, and attentive throughout my visit.",
  },
  {
    name: "Patient B",
    review:
      "A clean facility with outstanding medical services. I felt listened to and received quality treatment.",
  },
  {
    name: "Patient C",
    review:
      "Booking an appointment was easy, and the care I received exceeded my expectations.",
  },
];

export default function Testimonials() {
  return (
    <section className="bg-slate-100 py-24">
      <div className="mx-auto max-w-7xl px-6">
        <p className="text-center font-semibold uppercase tracking-widest text-blue-700">
          Testimonials
        </p>

        <h2 className="mt-4 text-center text-5xl font-bold">
          What Our Patients Say
        </h2>

        <div className="mt-16 grid gap-8 md:grid-cols-3">
          {testimonials.map((item) => (
            <div
              key={item.name}
              className="rounded-2xl bg-white p-8 shadow-lg transition hover:-translate-y-2"
            >
              <div className="mb-4 flex">
                {[1, 2, 3, 4, 5].map((star) => (
                  <Star
                    key={star}
                    size={18}
                    className="fill-yellow-400 text-yellow-400"
                  />
                ))}
              </div>

              <p className="text-gray-600 leading-7">
                "{item.review}"
              </p>

              <h3 className="mt-6 text-xl font-semibold text-blue-700">
                {item.name}
              </h3>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
