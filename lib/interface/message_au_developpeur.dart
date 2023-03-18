// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously, prefer_interpolation_to_compose_strings, unused_local_variable

import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/provider/provider_apprecier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

class MessageAuDeveloppeur extends StatefulWidget {
  const MessageAuDeveloppeur({super.key});

  @override
  State<MessageAuDeveloppeur> createState() => _MessageAuDeveloppeurState();
}

class _MessageAuDeveloppeurState extends State<MessageAuDeveloppeur> {
  bool affiche = false;

  String nom = "";

  String email = "";

  String appreciation = "";

  String suggestion = "";

  TextEditingController nom_user = TextEditingController();

  TextEditingController email_user = TextEditingController();

  TextEditingController appreciation_user = TextEditingController();

  TextEditingController suggestion_user = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderApprecierNosServices>(context);
    affiche = provider.affiche;
    nom = provider.nom;
    email = provider.email;
    appreciation = provider.appreciation;
    suggestion = provider.suggestion;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerClient(),
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
        centerTitle: true,
        title: Text(
          "Message",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
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
                          "images/image8.jfif",
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Message au développeur",
                textAlign: TextAlign.center,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 2,
                width: 80,
                color: Colors.white,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Votre nom d'utilisateur svp",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                child: TextField(
                  controller: nom_user,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: nom.length < 3
                              ? BorderSide(color: Colors.red)
                              : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_nom(value, nom_user);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Adresse E-Mail",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                child: TextField(
                  controller: email_user,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: email.isEmpty ||
                                  email.length < 7 ||
                                  !email.contains("@")
                              ? BorderSide(color: Colors.red)
                              : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_email(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Votre appréciation",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                child: TextField(
                  controller: appreciation_user,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: appreciation.isEmpty
                              ? BorderSide(color: Colors.red)
                              : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_appreciation(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Vos Suggestions",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                child: TextField(
                  controller: suggestion_user,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: suggestion.isEmpty
                              ? BorderSide(color: Colors.red)
                              : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_suggestion(value);
                  },
                ),
              ),
              SizedBox(
                height: 52,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () async {
                      try {
                        provider.affiche_true();
                        if (nom_user.text.isEmpty ||
                            email_user.text.isEmpty ||
                            !email_user.text.contains("@") ||
                            appreciation_user.text.isEmpty ||
                            suggestion_user.text.isEmpty) {
                          provider.affiche_false();
                          _speak(
                              "Veuillez bien renseigner les champs. Vérifier surtout si vous avez bien renseigné l'adresse mail");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Veuillez bien renseigner les champs. Vérifier si vous avez bien renseigné l'adresse e-mail",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        } else {
                          String username = 'agripilalo@gmail.com';
                          String password = 'kgbadpzwmbaxkzch';
                          final smtpServer = gmail(username, password);
                          // Use the SmtpServer class to configure an SMTP server:
                          // final smtpServer = SmtpServer('smtp.domain.com');
                          // See the named arguments of SmtpServer for further configuration
                          // options.

                          // Create our message.
                          final message = Message()
                            ..from = Address(username, nom_user.text)
                            ..recipients.add("marcellindeveloppeur@gmail.com")
                            ..ccRecipients
                            //.addAll(['destCc1@example.com', 'destCc2@example.com'])
                            //..bccRecipients.add(Address('bccAddress@example.com'))
                            ..subject =
                                "Appréciation de votre travail via Agri PIYALO"
                            ..text = "Mon apprécation est : << " +
                                appreciation +
                                " >> . \n Je te suggère : << " +
                                suggestion +
                                "  >>";
                          //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

                          final sendReport = await send(message, smtpServer);

                          nom_user.clear();
                          email_user.clear();
                          appreciation_user.clear();
                          suggestion_user.clear();

                          provider.affiche_false();
                          _speak(
                              "Votre suggestion à été bien enregistré cher client. Nous vous remercions");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Successfully saved in data base. Thank you very much !",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            backgroundColor: Colors.black87,
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }
                      } catch (e) {
                        provider.affiche_false();
                        _speak("Une erreur s'est produite");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Une erreur s'est produite !",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          backgroundColor: Colors.redAccent.withOpacity(.8),
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snakbar);
                      }
                    },
                    child: affiche
                        ? CircularProgressIndicator(
                            color: Colors.black87,
                          )
                        : Text(
                            "Envoyez".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          )),
    );
  }
}

Future _speak(String text) async {
  final FlutterTts flutter_tts = FlutterTts();
  flutter_tts.setLanguage("Fr");
  flutter_tts.setSpeechRate(0.5);
  flutter_tts.setVolume(0.5);
  flutter_tts.setPitch(1.0);
  flutter_tts.speak(text);
}
