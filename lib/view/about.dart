import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              Text('Application developed for study purposes.', style: TextStyle(fontSize: 20.0),),
              SizedBox(height: 20.0,),
              Text('Developed by:', style: TextStyle(fontSize: 20.0),),
              SizedBox(height: 16.0,),
              Text('Juliano Costa Silva', style: TextStyle(fontSize: 20.0, color: Colors.redAccent, fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0,),
              Text('This application aims to list and search the abbreviations of countries in the world.'),
            ],
          ),
      ),
      ),
    );
  }
}