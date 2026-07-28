import { Outlet } from "react-router-dom";

import Navbar from "../components/layout/Navbar/Navbar";
import Footer from "../components/layout/Footer/Footer";

import FloatingWhatsApp from "../components/common/FloatingWhatsApp";
import ScrollEnhancements from "../components/common/ScrollEnhancements";
import LoadingScreen from "../components/common/LoadingScreen";
import PageFade from "../components/common/PageFade";

export default function MainLayout() {
  return (
    <>
      <LoadingScreen />

      <ScrollEnhancements />

      <Navbar />

      <PageFade>
        <Outlet />
      </PageFade>

      <Footer />

      <FloatingWhatsApp />
    </>
  );
}