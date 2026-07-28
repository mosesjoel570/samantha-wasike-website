import {
  Stethoscope,
  HeartPulse,
  Ambulance,
  Microscope,
  ShieldCheck,
  Baby
} from "lucide-react";

import FadeIn from "../ui/FadeIn";

const services = [
  {
    icon: Stethoscope,
    title: "General Consultation",
    description:
      "Professional diagnosis and treatment for patients of all ages.",
  },
  {
    icon: HeartPulse,
    title: "Cardiac Care",
    description:
      "Comprehensive heart screening and specialist consultation.",
  },
  {
    icon: Ambulance,
    title: "Emergency Services",
    description:
      "Rapid emergency response available whenever needed.",
  },
  {
    icon: Microscope,
    title: "Laboratory",
    description:
      "Accurate diagnostic laboratory testing using modern equipment.",
  },
  {
    icon: Baby,
    title: "Maternal Care",
    description:
      "Safe prenatal, maternity and postnatal healthcare services.",
  },
  {
    icon: ShieldCheck,
    title: "Preventive Care",
    description:
      "Routine checkups, vaccinations and wellness programs.",
  },
];

export default function Services() {
  return (
    <FadeIn>
      <section
        id="services"
        className="bg-white py-24"
      >
        <div className="mx-auto max-w-7xl px-6">

          <div className="text-center">

            <p className="font-semibold uppercase tracking-[4px] text-blue-700">
              Our Services
            </p>

            <h2 className="mt-4 text-5xl font-bold text-slate-900">
              Professional Medical Services
            </h2>

            <p className="mx-auto mt-6 max-w-3xl text-lg text-gray-600">
              Dr. Samantha Hospital provides comprehensive healthcare
              services using experienced professionals and modern
              medical technology.
            </p>

          </div>

          <div className="mt-20 grid gap-8 md:grid-cols-2 lg:grid-cols-3">

            {services.map((service) => {

              const Icon = service.icon;

              return (

                <div
                  key={service.title}
                  className="rounded-2xl border border-slate-200 bg-white p-8 shadow transition duration-300 hover:-translate-y-2 hover:shadow-xl"
                >

                  <div className="flex h-16 w-16 items-center justify-center rounded-full bg-blue-100">

                    <Icon
                      className="text-blue-700"
                      size={32}
                    />

                  </div>

                  <h3 className="mt-6 text-2xl font-bold">
                    {service.title}
                  </h3>

                  <p className="mt-4 leading-7 text-gray-600">
                    {service.description}
                  </p>

                </div>

              );

            })}

          </div>

        </div>
      </section>
    </FadeIn>
  );
}
