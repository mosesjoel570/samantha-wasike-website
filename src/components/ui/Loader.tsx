import { motion } from "framer-motion";

export default function Loader() {

  return (

    <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-white">

      <div className="text-center">

        <motion.div
          className="mx-auto h-20 w-20 rounded-full border-4 border-blue-200 border-t-blue-700"
          animate={{ rotate: 360 }}
          transition={{
            repeat: Infinity,
            duration: 1,
            ease: "linear"
          }}
        />

        <h2 className="mt-6 text-2xl font-bold text-blue-700">
          Samantha Wasike
        </h2>

        <p className="mt-2 text-slate-600">
          Loading...
        </p>

      </div>

    </div>

  );

}
