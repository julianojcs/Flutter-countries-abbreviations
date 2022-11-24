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
                color: Colors.blue,
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
                      // context: context,
                      // builder: (BuildContext context) => SimpleDialog(
                      //   title: const Text('Enter country name'),
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(20.0),
                      //       child: TextField(
                      //         controller: _search,
                      //       ),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       children: [
                      //         TextButton(
                      //           onPressed: () {
                      //             Navigator.pop(context);
                      //           },
                      //           child: const Text(
                      //             'Cancel',
                      //             style: TextStyle(color: Colors.grey),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.fromLTRB(
                      //               0.0, 0.0, 20.0, 0.0),
                      //           child: TextButton(
                      //             onPressed: () {
                      //               Navigator.pop(context);
                      //               Navigator.push(context, MaterialPageRoute(
                      //                 builder: (BuildContext context) => CountriesScreen(country: _search.text)
                      //               ));
                      //             },
                      //             child: const Text(
                      //               'Search',
                      //               style: TextStyle(color: Colors.blueAccent),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     )
                      //   ],
                      // ),

                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Search',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold)),
                          content: TextField(
                            controller: _search,
                            decoration: const InputDecoration(
                              labelText: 'Enter country name',
                              hintText: 'Country name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
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
