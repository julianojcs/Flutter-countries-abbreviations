import 'package:flutter/material.dart';
import 'package:sigla_paises_app/view/countries_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final primaryColor = Colors.orangeAccent;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countries abbreviations',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: primaryColor,
      )),
      home: const CountriesScreen(),
    );
  }
}
