// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/historique_de_vente_de_oeuf_de_table.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/modele/vente_oeuf_tables.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modele/budget_tiers.dart';

class StreamHistoriqueVenteOeufTable extends StatelessWidget {
  const StreamHistoriqueVenteOeufTable(
      {super.key,
      required this.vente_uid,
      required this.user_uid,
      required this.vague_uid});
  final String vente_uid;
  final String user_uid;
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().budget_tiers(vague_uid),
            initialData: BudgetTiers(
                uid: "", solde_total: 0, depense: 0, perte: 0, created_at: "")),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().oeuf_table(vague_uid),
            initialData: OeufTables(
                uid: "",
                user_uid: user_uid,
                nom: "",
                nombre_initial: 0,
                nombre_restant: 0,
                nombre_casse: 0,
                prix_unitaire: 0,
                prix_unitaire_plateaux: 0,
                montant_vendu: 0,
                created_at: "")),
        StreamProvider(
            create: (context) => context
                .read<serviceBD>()
                .vente_oeuf_table(vague_uid, vente_uid),
            initialData: VenteOeufTables(
                uid: "",
                oeuf_uid: "",
                user_uid: user_uid,
                montant: 0,
                nombre: 0,
                created_at: "",
                annee: "",
                created_at_in_days: 0,
                cretaed_at_heure: "",
                updated_at: "",
                updated_at_heure: "",
                updated: false,
                unite: false)),
        StreamProvider(
            create: (context) => context.read<serviceBD>().user_data(user_uid),
            initialData: donnesUtilisateur(
                nom: "",
                prenom: "",
                email: "",
                telephone: "",
                role: "",
                sexe: "",
                date_naissance: "",
                uid: "",
                photo_url: "",
                admin: false,
                is_active: true,
                mdp: "",
                date_inscription: "",
                deleted: false))
      ],
      child: HistoriqueDeVenteDeOeufDeTable(
        vague_uid: vague_uid,
      ),
    );
  }
}
