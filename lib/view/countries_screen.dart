import 'package:flutter/material.dart';
import 'package:sigla_paises_app/service/request.dart';
import 'package:sigla_paises_app/view/menu.dart';
import 'package:sigla_paises_app/view/country_data.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries abbreviations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Request.requestCountry();
            },
          ),
        ],
      ),
      body: const CountriesData(),
      drawer: const Menu(),
    );
  }
}
