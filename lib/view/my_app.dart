import 'package:flutter/material.dart';
import 'package:sigla_paises_app/view/countries_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Countries abbreviations',
      home: CountriesScreen(),
    );
  }
}