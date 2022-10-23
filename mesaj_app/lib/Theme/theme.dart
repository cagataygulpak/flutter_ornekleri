import 'package:flutter/material.dart';
import 'package:mesaj_app/constants/constant.dart';

class Tema {
  static ThemeData tema = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Renkler.transparent,
      elevation: 5,
      color: Colors.green,
      actionsIconTheme: IconThemeData(color: Renkler.grey),
    ),
  );
}
