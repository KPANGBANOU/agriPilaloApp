// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:deogracias/interface/stock_fientes_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base_donne/servicebasededonnees.dart';
import '../modele/fientes.dart';

class StreamVagueStockRechargerFientesUser extends StatelessWidget {
  const StreamVagueStockRechargerFientesUser(
      {super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_fientes(vague_uid),
            initialData: <Fientes>[])
      ],
      child: StockFientesUser(vague_uid: vague_uid),
    );
  }
}
