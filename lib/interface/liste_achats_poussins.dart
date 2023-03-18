// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/interface/stream_achat_de_poussin.dart';
import 'package:deogracias/modele/achat_poussins.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AchatsPoussinsEffectues extends StatefulWidget {
  AchatsPoussinsEffectues({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  State<AchatsPoussinsEffectues> createState() =>
      _AchatsPoussinsEffectuesState();
}

class _AchatsPoussinsEffectuesState extends State<AchatsPoussinsEffectues> {
  bool affiche = false;

  String value = "";

  @override
  Widget build(BuildContext context) {
    final achat_poussins = Provider.of<List<AchatPoussins>>(context);
    final provider = Provider.of<Search>(context);
    affiche = provider.afficher;
    value = provider.value;

    if (achat_poussins.isEmpty) {
      return Scaffold(
          backgroundColor: Colors.green.shade800,
          drawer: DrawerVagueAdmin(vague_uid: widget.vague_uid),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            actions: [
              Image.asset(
                "images/icon2.jpg",
                scale: 4.5,
                height: 100,
                width: 100,
              ),
            ],
            elevation: 0,
            centerTitle: false,
            title: Text(
              "Achats de poussins",
              style: GoogleFonts.alike(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          body: Center(child: CircularProgressIndicator(color: Colors.white)));
    }
    return Scaffold(
      drawer: DrawerVagueAdmin(vague_uid: widget.vague_uid),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                provider.afficher_void();
              },
              icon: Icon(Icons.search, color: Colors.black)),
        ],
        elevation: 0,
        centerTitle: false,
        title: affiche
            ? Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: TextField(
                  autocorrect: true,
                  autofocus: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_value(value);
                  },
                ),
              )
            : Text(
                "Achats de poussins",
                style: GoogleFonts.alike(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            AchatPoussins achat_poussin = achat_poussins[index];
            return !affiche
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StreamDeAchatPoussinEffectue(
                                      vague_uid: widget.vague_uid,
                                      achat_poussin_uid: achat_poussin.uid,
                                      user_uid: achat_poussin.user_uid)));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlue.shade900,
                      child: Text(
                        "AP".toUpperCase().substring(0, 2).toUpperCase(),
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      "Poussin de " + achat_poussin.origine,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alike(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Effectué le : " +
                        achat_poussin.cretaed_at +
                        " à " +
                        achat_poussin.created_at_heure),
                  )
                : achat_poussin.origine
                        .toLowerCase()
                        .contains(value.toLowerCase())
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StreamDeAchatPoussinEffectue(
                                          vague_uid: widget.vague_uid,
                                          achat_poussin_uid: achat_poussin.uid,
                                          user_uid: achat_poussin.user_uid)));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Text(
                            "AP".toUpperCase().substring(0, 2).toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          "Poussin de " + achat_poussin.origine,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Effectué le : " +
                            achat_poussin.cretaed_at +
                            " à " +
                            achat_poussin.created_at_heure),
                      )
                    : Container();
          },
          itemCount: achat_poussins.length,
        ),
      ),
    );
  }
}
