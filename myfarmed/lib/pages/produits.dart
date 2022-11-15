import 'package:flutter/material.dart';

class Pondeuse extends StatefulWidget {
  const Pondeuse({super.key});

  @override
  State<Pondeuse> createState() => _PondeuseState();
}

class _PondeuseState extends State<Pondeuse> {
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
        actions: [
          Image.asset('assets/images/luffy.png'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: CircleAvatar(
                  radius: 20, // Image radius

                  backgroundImage: AssetImage(
                    'assets/images/logo.jpg',
                  ),
                )),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: const Center(
        
      ),
      backgroundColor: Colors.blue,
    );
  }
}

