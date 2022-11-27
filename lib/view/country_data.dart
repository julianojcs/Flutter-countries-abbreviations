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
  final Future<List<dynamic>> _countriesData = Request.requestCountry();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _countriesData,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            // debugPrint("CountriesData: ${widget.countriesState}");
            if (snapshot.hasData) {
              List countries = snapshot.data as List<dynamic>;
              if (widget.country != "") {
                countries = countries
                    .where((country) =>
                        country["name"].toLowerCase().contains(widget.country))
                    .toList();
                if (countries.isEmpty)
                  showMessage('No country found!', context);
              }
              widget.countriesState.clear();
              for (var country in countries) {
                widget.countriesState.add(country);
              }
              return _listCountries();
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

  Widget _listCountries() {
    return Flexible(
        child: ListView.builder(
          shrinkWrap: true,
        itemCount: widget.countriesState.length,
          itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                  "${widget.countriesState[index]["name"]}",
                        style: const TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
            subtitle: widget.countriesState[index]["isVisible"]
                      ?
                    Padding(
                          padding:
                              const EdgeInsets.fromLTRB(30.0, 0.0, 10.0, 10.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                        "${widget.countriesState[index]["code"] ?? "Not informed"}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                        )
                      : null,
                  onTap: () {
              debugPrint(widget.countriesState[index]["isVisible"].toString());
                    setState(() {
                widget.countriesState[index]["isVisible"] =
                    !widget.countriesState[index]["isVisible"];
                    });
                  },
              )
            );
          },
      ),
      );
  }
}
