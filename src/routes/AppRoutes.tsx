import { Routes, Route } from "react-router-dom";
import { AnimatePresence } from "framer-motion";

import MainLayout from "../layouts/MainLayout";
import Home from "../pages/Home";

export default function AppRoutes() {

  return (

    <AnimatePresence mode="wait">

      <Routes>

        <Route element={<MainLayout />}>

          <Route
            path="/"
            element={<Home />}
          />

        </Route>

      </Routes>

    </AnimatePresence>

  );

}