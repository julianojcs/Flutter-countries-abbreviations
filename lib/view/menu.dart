import 'package:flutter/material.dart';
import 'package:sigla_paises_app/view/about.dart';
import 'package:sigla_paises_app/view/countries_screen.dart';
import 'package:sigla_paises_app/view/message.dart';

class Menu extends StatelessWidget with Message {
  Menu({super.key});
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.orangeAccent,
                height: 100,
                child: const Text(
                  'Menu',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Search'),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Search',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.bold)),
                          content: TextField(
                            controller: _search,
                            decoration: const InputDecoration(
                              labelText: 'Enter country name',
                              labelStyle: TextStyle(color: Colors.orangeAccent),
                              hintText: 'Country name',
                              // border: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Colors.orangeAccent,
                              //       width: 0.0
                              //   ), // width: 0.0 produces a thin "hairline" border
                              //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              // ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orangeAccent,
                                    width:
                                        0.0), // width: 0.0 produces a thin "hairline" border
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orangeAccent,
                                    width:
                                        0.0), // width: 0.0 produces a thin "hairline" border
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CountriesScreen(
                                                country: _search.text)));
                                showMessage("Searched country: ${_search.text}",
                                    context);
                              },
                              child: const Text('Search'),
                            ),
                            ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.grey),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                showMessage('Search canceled', context);
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        );
                      });
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Sobre()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
