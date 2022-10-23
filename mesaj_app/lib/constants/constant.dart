import 'package:flutter/material.dart';

class Renkler {
  static Color red = Colors.red;
  static Color green = Colors.green;
  static Color grey = Colors.grey;
  static Color transparent = Colors.transparent;
  static Color grey200 = Colors.grey.shade200;
  static Color grey300 = Colors.grey.shade300;
  static Color white = Colors.white;
  static Color grey100 = Colors.grey.shade100;
}

class Mesajlar {
  static String hataMesaji = "Hata";
  static String messages = "Messages";
  static String search = "Search";
  static String home = "Home";
  static String add = "Add";
  static String heart = "Heart";
  static String profile = "profile";
}

class YaziStilleri {
  static TextStyle fontSize20Bold =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle overFlowEllipsis =
      const TextStyle(overflow: TextOverflow.ellipsis);
  static TextStyle colorGrey = TextStyle(color: Renkler.grey);
  static TextStyle colorWhite = TextStyle(color: Renkler.white);
  static TextStyle bold = const TextStyle(fontWeight: FontWeight.bold);
}

class Uzunluklar {
  static double height40 = 40;
  static double height50 = 50;
  static double width10 = 10;
  static double width20 = 20;
  static double width30 = 30;
}

class Radiuslar {
  static BorderRadius circular10 = BorderRadius.circular(10);
  static BorderRadius circular20 = BorderRadius.circular(20);
  static BorderRadius only10 = const BorderRadius.only(
      bottomRight: Radius.circular(10),
      topRight: Radius.circular(10),
      topLeft: Radius.circular(10));
}

class Paddingler {
  static EdgeInsets onlyLeft10 = const EdgeInsets.only(left: 10);
  static EdgeInsets l10T30r10b10 = const EdgeInsets.fromLTRB(10, 30, 10, 10);
}
