import 'package:flutter/material.dart';
import 'package:sigla_paises_app/service/request.dart';

class CountriesData extends StatefulWidget {
  const CountriesData({super.key});

  @override
  State<CountriesData> createState() => _CountriesDataState();
}

class _CountriesDataState extends State<CountriesData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
            future: Request.requestCountry(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                List countries = snapshot.data as List<dynamic>;
                return _listCountries(countries);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }

  Widget _listCountries(List countries) {
    return countries != null
    ? Flexible(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: countries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Card(
                child: ExpansionTile(
                  title: Text("${countries[index]["name"]}",
                    style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 20.0),),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 20.0),
                      child: Container(
                      alignment: Alignment.centerLeft,
                        child: Text("${countries[index]["code"] ?? "Not informed"}",
                          style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ),
                    ),
                  ],
                )
              )
            );
          },
        ),
      )
    : Container(
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.all(50.0),
          child: Text('Loading...', style: TextStyle(fontSize: 16.0)),
        ),
      );
  }
}
