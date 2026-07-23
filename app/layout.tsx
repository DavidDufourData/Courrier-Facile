import "./globals.css";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Courrier Facile — L'IA qui simplifie votre administratif",
  description: "Analysez vos courriers, identifiez les échéances et préparez vos réponses en quelques secondes."
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="fr"><body>{children}</body></html>;
}
