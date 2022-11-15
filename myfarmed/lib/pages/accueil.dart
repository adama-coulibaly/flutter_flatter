import 'package:flutter/material.dart';

import '../main.dart';

class myHome extends StatefulWidget {
  const myHome({super.key});

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'My Farmed ',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              child: const Center(
                child: Text(
                  'Bienvenue',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Image.asset(
                'assets/images/logo.jpg',
                height: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Nous sommes une entreprise de production et de commercialisation des poulets de chAIr, Poulet pondeuse, œufS  et poussins.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: ElevatedButton(
                  onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  connexion() ),);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.white, 
                    minimumSize: Size(20, 60)
                   
                  ),
                  child: const Text(
                    'Commencer',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                 
                ),
              ),
            ),
          ],
        ),
    );
  }
  }