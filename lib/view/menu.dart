import 'package:flutter/material.dart';
import 'package:sigla_paises_app/view/about.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

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
                child: const Text('Menu', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),),
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Search'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: 
                      (BuildContext context) => const Sobre()
                    )
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}