// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mesaj_app/Service/service_model.dart';

class VerileriOkuma {
  Future<List<ServiceModel>> verileriGetir(BuildContext gelenContext) async {
    try {
       await Future.delayed(const Duration(seconds: 5));
      String okunanDeger = await DefaultAssetBundle.of(gelenContext)
          .loadString("assets/data/veriler.json");
      var gelenjsonDegeri = jsonDecode(okunanDeger);
      List<ServiceModel> geciciListe = (gelenjsonDegeri as List)
          .map((okunanDeger) => ServiceModel.fromJson(okunanDeger))
          .toList();

      return geciciListe;
    } catch (e) {
      
      return Future.error(e.toString());
    }
  }
}
