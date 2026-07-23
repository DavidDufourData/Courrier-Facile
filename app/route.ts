import { NextResponse } from "next/server";
import { z } from "zod";

const Input=z.object({text:z.string().min(20).max(50000)});

export async function POST(request:Request){
  try{
    const body=Input.parse(await request.json());
    // TODO: remplacer par un appel serveur au modèle IA choisi.
    return NextResponse.json({
      organisme:"À identifier",
      urgence:"moyenne",
      resume:"Analyse de démonstration. Connectez ici votre fournisseur IA.",
      actions:["Vérifier le document","Confirmer l'échéance","Préparer la réponse"],
      sourceTextLength:body.text.length
    });
  }catch(error){return NextResponse.json({error:"Requête invalide"},{status:400});}
}
