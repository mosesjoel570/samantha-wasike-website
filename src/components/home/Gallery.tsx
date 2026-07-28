import FadeIn from "../ui/FadeIn";
import { Container, Card, SectionTitle } from "../ui";

const gallery = [
  {
    title: "Professional Patient Care",
    image:
      "https://images.unsplash.com/photo-1584515933487-779824d29309?auto=format&fit=crop&w=1200&q=80",
  },
  {
    title: "Home Nursing Support",
    image:
      "https://images.unsplash.com/photo-1576091160550-2173dba999ef?auto=format&fit=crop&w=1200&q=80",
  },
  {
  title: "Medication Assistance",
  image:
    "https://images.unsplash.com/photo-1576671081837-49000212a370?auto=format&fit=crop&w=1200&q=80",
},
  {
    title: "Health Assessment",
    image:
      "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&w=1200&q=80",
  },
  {
    title: "Compassionate Care",
    image:
      "https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb?auto=format&fit=crop&w=1200&q=80",
  },
  {
    title: "Quality Nursing Services",
    image:
      "https://images.unsplash.com/photo-1582750433449-648ed127bb54?auto=format&fit=crop&w=1200&q=80",
  },
];

export default function Gallery() {
  return (
    <FadeIn>
      <section id="gallery" className="bg-slate-50 py-24">
        <Container>
          <SectionTitle
            eyebrow="Gallery"
            title="Professional Nursing Portfolio"
            subtitle="Providing compassionate, professional, and patient-centered nursing care with dignity, respect, and excellence."
          />

          <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
            {gallery.map((item) => (
              <Card
                key={item.title}
                className="overflow-hidden rounded-3xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:shadow-2xl rounded-3xl border-0 p-0 shadow-lg transition duration-500 hover:-translate-y-2 hover:shadow-2xl"
              >
                <div className="overflow-hidden rounded-3xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:shadow-2xl">
                  <img
                    src={item.image}
                    alt={item.title}
                    loading="lazy"
                    className="h-72 w-full object-cover transition duration-700 hover:scale-110"
                  />
                </div>

                <div className="bg-white p-6 text-center">
                  <h3 className="text-xl font-bold text-slate-900">
                    {item.title}
                  </h3>
                </div>
              </Card>
            ))}
          </div>
        </Container>
      </section>
    </FadeIn>
  );
}
