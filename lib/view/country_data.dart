import 'package:flutter/material.dart';
import 'package:sigla_paises_app/service/request.dart';
import 'package:sigla_paises_app/view/message.dart';

class CountriesData extends StatefulWidget {
  final String country;
  final List countriesState;

  const CountriesData(
      {super.key, this.country = "", required this.countriesState});

  @override
  State<CountriesData> createState() => _CountriesDataState();
}

class _CountriesDataState extends State<CountriesData> with Message {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: Request.requestCountry(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              List countries = snapshot.data as List<dynamic>;
              for (var country in countries) {
                widget.countriesState.add({
                  "name": country["name"],
                  "code": country["code"],
                  "isVisible": false
                });
              }
              return _listCountries(
                  _handleFilter(
                  widget.country, widget.countriesState, context));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }

  Widget _listCountries(List countries) {
    return countries != null
    ? Flexible(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: countries.length,
          itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${countries[index]["name"]}",
                        style: const TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                  subtitle: countries[index]["isVisible"]
                      ?
                    Padding(
                          padding:
                              const EdgeInsets.fromLTRB(30.0, 0.0, 10.0, 10.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${countries[index]["code"] ?? "Not informed"}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                        )
                      : null,
                  onTap: () {
                    debugPrint(countries[index]["isVisible"].toString());
                    setState(() {
                      countries[index]["isVisible"] =
                          !countries[index]["isVisible"];
                    });
                  },
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

  List _handleFilter(String filter, List countries, BuildContext context) {
    if (filter != "") {
      List filteredCountries = [];

      for (var country in countries) {
        if (country["name"]
            .toString()
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          filteredCountries.add(country);
        }
      }
      if (filteredCountries.isEmpty) showMessage('No country found!', context);
      return filteredCountries;
    } else {
      return countries;
    }
  }
}
