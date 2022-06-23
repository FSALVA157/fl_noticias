
import 'package:flutter/material.dart';


class MiTema{
  static final Color primario = Colors.indigo;
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
     primaryColor: primario,
     appBarTheme: AppBarTheme(
      color: primario
      
      )
  );
}