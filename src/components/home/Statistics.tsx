import FadeIn from "../ui/FadeIn";

const stats = [
  { number: "3+", title: "Years of Excellence" },
  { number: "10,000+", title: "Patients Served" },
  { number: "Day", title: "Emergency Care" },
  { number: "98%", title: "Patient Satisfaction" }
];

export default function Statistics() {
  return (
    <FadeIn>
      <section
        id="statistics"
        className="bg-blue-700 py-20 text-white"
      >
        <div className="mx-auto max-w-7xl px-6">
          <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-4">

            {stats.map((item) => (

              <div
                key={item.title}
                className="rounded-2xl bg-white/10 p-8 text-center backdrop-blur"
              >

                <h2 className="text-5xl font-bold">
                  {item.number}
                </h2>

                <p className="mt-4 text-blue-100">
                  {item.title}
                </p>

              </div>

            ))}

          </div>
        </div>
      </section>
    </FadeIn>
  );
}
