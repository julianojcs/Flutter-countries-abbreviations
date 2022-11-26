import 'package:flutter/material.dart';
import 'package:sigla_paises_app/view/menu.dart';
import 'package:sigla_paises_app/view/country_data.dart';

class CountriesScreen extends StatelessWidget {
  final String country;
  const CountriesScreen({this.country = "", super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries abbreviations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const CountriesScreen(country: ""),
                  ));
            },
          ),
        ],
      ),
      body: CountriesData(country: country, countriesState: []),
      drawer: Menu(),
    );
  }
}
