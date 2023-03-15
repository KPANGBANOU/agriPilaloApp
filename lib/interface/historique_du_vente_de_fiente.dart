// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:deogracias/modele/ventes_fientes.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'drawer_admin.dart';

class HistoriqueDuVenteDeFiente extends StatelessWidget {
  const HistoriqueDuVenteDeFiente({super.key});

  @override
  Widget build(BuildContext context) {
    final fiente = Provider.of<Fientes>(context);
    final vente_fiente = Provider.of<VenteFientes>(context);
    final user = Provider.of<donnesUtilisateur>(context);
    final budget = Provider.of<Budget>(context);
    return Scaffold(
      drawer: DrawerAdmin(),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Agri Piyalo",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _update(
                    context,
                    fiente.nom,
                    vente_fiente.nombre,
                    vente_fiente.montant,
                    fiente.uid,
                    vente_fiente.uid,
                    budget.uid,
                    budget.solde_total,
                    fiente.prix_unitaire,
                    fiente.nombre_restant,
                    fiente.montant_vendu);
              },
              icon: Icon(Icons.edit)),
          Image.asset(
            "images/icon2.jpg",
            height: 70,
            width: 70,
            scale: 4.5,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  image: DecorationImage(
                      image: AssetImage(
                        "images/image2.jpeg",
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Détail de la vente",
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 44,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlue.shade800),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Information sur la vente ".toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.vertical_align_bottom,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Vente éffectuée ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Vente de " +
                                vente_fiente.nombre.toString() +
                                " " +
                                fiente.nom,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Nombre de sacks vendus ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            vente_fiente.nombre.toString(),
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Prix unitaire de vente",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            fiente.prix_unitaire.toString() + " XOF",
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Effectuée par ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            user.prenom + ' ' + user.nom,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Date de vente ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            vente_fiente.created_at +
                                ' à ' +
                                vente_fiente.created_at_heure,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    vente_fiente.updated
                        ? Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Modifiez le ",
                                    style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade800,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      vente_fiente.updated_at +
                                          " à " +
                                          vente_fiente.updated_at_heure,
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlue.shade800),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total de vente",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            vente_fiente.montant.toString() + " XOF",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _update(
      BuildContext context,
      String bete_non,
      int vente_nombre,
      int vente_montant,
      String bete_uid,
      String vente_uid,
      String budget_uid,
      int budget_solde_total,
      int bete_prix_unitaire,
      int bete_nombre_restant,
      int bete_montant_vendu) async {
    TextEditingController _nombre = TextEditingController();
    TextEditingController _montant = TextEditingController();
    _nombre.text = vente_nombre.toString();
    _montant.text = vente_montant.toString();
    int nombre_saise = 0;
    int difference = 0;
    int nombre = 0;
    int montant = 0;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            "Mise à jour de la vente",
            style: GoogleFonts.alike(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Veuillez saisir le nombre de " + bete_non + " à vendre",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _nombre,
                  ),
                ),
                bete_prix_unitaire > 0
                    ? Container()
                    : Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Veuillez saisir le montant total de vente de ces " +
                                vente_nombre.toString() +
                                " " +
                                bete_non,
                            style:
                                GoogleFonts.alike(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: _montant,
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Confirmer'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () async {
                        try {
                          nombre_saise = _nombre.text.isNotEmpty
                              ? int.parse(_nombre.text)
                              : 0;
                          montant = _montant.text.isNotEmpty
                              ? int.parse(_montant.text)
                              : 0;
                          if (_nombre.text.isEmpty) {
                            _speak(
                                "Tous les champs n'ont pas été renseigné. Réessayez s'il vous plait ");
                          } else if (nombre_saise > vente_nombre &&
                              (nombre_saise - vente_nombre) >
                                  bete_nombre_restant) {
                            _speak("Stock insuffisant");
                          } else if (bete_prix_unitaire > 0) {
                            difference = vente_nombre - nombre_saise;

                            if (difference < 0) {
                              nombre = nombre_saise - vente_nombre;
                              await FirebaseFirestore.instance
                                  .collection("budget")
                                  .doc(budget_uid)
                                  .update({
                                "solde_total": budget_solde_total +
                                    (nombre * bete_prix_unitaire)
                              });
                              await FirebaseFirestore.instance
                                  .collection("vente_fientes")
                                  .doc(vente_uid)
                                  .update({
                                "nombre": nombre_saise,
                                "montant": nombre_saise * bete_prix_unitaire,
                                "updated": true,
                                "updated_at": DateTime.now(),
                              });

                              await FirebaseFirestore.instance
                                  .collection("fientes")
                                  .doc(bete_uid)
                                  .update({
                                "nombre_restant": bete_nombre_restant - nombre,
                                "montant_vendu": bete_montant_vendu +
                                    (nombre * bete_prix_unitaire)
                              });
                            } else {
                              nombre = vente_nombre - nombre_saise;
                              await FirebaseFirestore.instance
                                  .collection("budget")
                                  .doc(budget_uid)
                                  .update({
                                "solde_total": budget_solde_total -
                                    (nombre * bete_prix_unitaire)
                              });
                              await FirebaseFirestore.instance
                                  .collection("vente_fientes")
                                  .doc(vente_uid)
                                  .update({
                                "nombre": nombre_saise,
                                "montant": nombre_saise * bete_prix_unitaire,
                                "updated": true,
                                "updated_at": DateTime.now(),
                              });

                              await FirebaseFirestore.instance
                                  .collection("fientes")
                                  .doc(bete_uid)
                                  .update({
                                "nombre_restant": bete_nombre_restant + nombre,
                                "montant_vendu": bete_montant_vendu -
                                    (nombre * bete_prix_unitaire)
                              });
                            }

                            _speak("Mise à jour effectué avec succès");
                            Navigator.of(dialogContext).pop();
                          } else {
                            if (_montant.text.isEmpty) {
                              _speak(
                                  "Vous devez saisir le montant total de vente de " +
                                      vente_nombre.toString() +
                                      " " +
                                      bete_non);
                            } else {
                              difference = vente_nombre - nombre_saise;

                              await FirebaseFirestore.instance
                                  .collection("budget")
                                  .doc(budget_uid)
                                  .update({
                                "solde_total": montant < vente_montant
                                    ? budget_solde_total -
                                        (vente_montant - montant)
                                    : budget_solde_total +
                                        (montant - vente_montant)
                              });

                              await FirebaseFirestore.instance
                                  .collection("vente_betes")
                                  .doc(vente_uid)
                                  .update({
                                "updated_at": DateTime.now(),
                                "updated": true,
                                "montant": montant,
                                "nombre": nombre_saise
                              });

                              await FirebaseFirestore.instance
                                  .collection("betes")
                                  .doc(bete_uid)
                                  .update({
                                "montant_vendu": (vente_montant - montant) < 0
                                    ? bete_montant_vendu +
                                        (montant - vente_montant)
                                    : bete_montant_vendu -
                                        (vente_montant - montant),
                                "nombre_restant": difference < 0
                                    ? bete_nombre_restant -
                                        (nombre_saise - vente_nombre)
                                    : bete_nombre_restant +
                                        (vente_nombre - nombre_saise)
                              });

                              _speak("Mise à jour effectué avec succès");
                              Navigator.of(dialogContext).pop();
                            }
                          }

                          // ignore: empty_catches
                        } catch (e) {
                          _speak(
                              "Une erreur inattendue s'est produite. Vérifiez votre connection internet et réessayez s'il vous plait");
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.withOpacity(.7),
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Annuler'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        _speak("Mise à jour annulééé");
                        Navigator.of(dialogContext).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        );
      },
    );
  }

  Future _speak(String text) async {
    final FlutterTts _flutter_tts = FlutterTts();
    _flutter_tts.setLanguage("Fr");
    _flutter_tts.setSpeechRate(0.5);
    _flutter_tts.setVolume(0.5);
    _flutter_tts.setPitch(1.0);
    _flutter_tts.speak(text);
  }
}
