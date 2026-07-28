import { Phone, Mail, MessageCircle } from "lucide-react";

export default function Contact() {
  return (
    <section id="contact" className="bg-slate-100 py-24">
      <div className="mx-auto max-w-6xl px-6">
        <h2 className="text-center text-5xl font-bold">
          Contact Dr. Samantha
        </h2>

        <p className="mt-6 text-center text-gray-600">
          Reach out by phone, email or WhatsApp.
        </p>

        <div className="mt-16 grid gap-8 md:grid-cols-3">
          <a
            href="tel:+254704271129"
            className="rounded-2xl bg-white p-8 text-center shadow transition hover:-translate-y-2"
          >
            <Phone className="mx-auto text-blue-700" size={40} />
            <h3 className="mt-4 text-2xl font-semibold">Phone</h3>
            <p className="mt-2 text-gray-600">
              +254 704271129
            </p>
          </a>

          <a
            href="mailto:drsamantha.com"
            className="rounded-2xl bg-white p-8 text-center shadow transition hover:-translate-y-2"
          >
            <Mail className="mx-auto text-blue-700" size={40} />
            <h3 className="mt-4 text-2xl font-semibold">Email</h3>
            <p className="mt-2 break-all text-gray-600">
            wasikesamantha03@gmail.com
            </p>
          </a>

          <a
            href="https://wa.me/254704271129"
            target="_blank"
            rel="noopener noreferrer"
            className="rounded-2xl bg-white p-8 text-center shadow transition hover:-translate-y-2"
          >
            <MessageCircle className="mx-auto text-green-600" size={40} />
            <h3 className="mt-4 text-2xl font-semibold">WhatsApp</h3>
            <p className="mt-2 text-gray-600">
              Chat with Dr. Samantha
            </p>
          </a>
        </div>
      </div>
    </section>
  );
}
