import Link from "next/link";

export function Header(){return <header className="container nav"><Link className="brand" href="/"><span>Courrier</span> Facile</Link><nav className="navlinks"><a href="#fonctionnalites">Fonctionnalités</a><Link href="/tarifs">Tarifs</Link><a href="#securite">Sécurité</a><Link href="/dashboard">Connexion</Link><Link className="btn primary" href="/analyse">Essayer gratuitement</Link></nav></header>}
