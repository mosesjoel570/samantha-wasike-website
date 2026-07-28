import { MessageCircle } from "lucide-react";

export default function FloatingWhatsApp() {

const phone = "254704271129";

const message =
encodeURIComponent(
"Hello Samantha, I would like to inquire about your nursing care services."
);

return (

<a
href={`https://wa.me/${phone}?text=${message}`}
target="_blank"
rel="noopener noreferrer"
className="fixed bottom-6 right-6 z-50 flex h-16 w-16 items-center justify-center rounded-full bg-green-500 text-white shadow-2xl transition duration-300 hover:scale-110 hover:bg-green-600"
aria-label="Chat on WhatsApp"
>

<MessageCircle size={32}/>

</a>

);

}
