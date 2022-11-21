

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfarmed/pages/produits.dart';

import '../main.dart';

class homePrincipal extends StatefulWidget {
  const homePrincipal({super.key});

  @override
  State<homePrincipal> createState() => _homePrincipalState();
}

class _homePrincipalState extends State<homePrincipal> {
//  Ma fonctionde liste des carde
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
      body: Center(
        
        child: GridView.count(
          
          padding: const EdgeInsets.all(15.0),
          crossAxisCount: 2,
          children:   <Widget>[
// ICI ON PLACE NOS SERVICES

          mesCardes(titre: "Pondeuses",  image: 'assets/images/pondeuses.jpg',  textButton:   TextButton( onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Pondeuse() ),);}, child: const Text("Visiter")),),
          mesCardes(titre: "Chairs",  image: 'assets/images/pondeuses.jpg',  textButton:   TextButton( onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Inscription() ),);}, child: const Text("Visiter")),),
          mesCardes(titre: "Barahama",  image: 'assets/images/pondeuses.jpg',  textButton:   TextButton( onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Inscription() ),);}, child: const Text("Visiter")),),
          mesCardes(titre: "Poussins",  image: 'assets/images/pondeuses.jpg',  textButton:   TextButton( onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Inscription() ),);}, child: const Text("Visiter")),),
          mesCardes(titre: "Oeufs",  image: 'assets/images/pondeuses.jpg',  textButton:   TextButton( onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Inscription() ),);}, child: const Text("Visiter")),),
          mesCardes(titre: "Materieaux",  image: 'assets/images/pondeuses.jpg',  textButton:   TextButton( onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Inscription() ),);}, child: const Text("Visiter")),),
          
            // mesCardes(titre: "Pondeuses", , image: 'assets/images/pondeuses.jpg',liens: 'Kayes',),
            // mesCardes(titre: "Pondeuses", , image: 'assets/images/pondeuses.jpg',liens: 'Sikasso',),
          
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class mesCardes extends StatelessWidget {


 const mesCardes({super.key, required this.titre, required this.image, required this.textButton});
  final String titre;
  final String image;
  // ignore: prefer_typing_uninitialized_variables
  final textButton;


  
  @override
  Widget build(BuildContext context) {              
    

    return Center(
     
     
      child: Container(
        
        child: Card(
          elevation: 5,
          
          child: InkWell(
            onTap: () {
              
            },
            child: SingleChildScrollView(
              child: Container(  

                
                //height: 1200,
                child: Center(
                        
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                     
                      Image(image: AssetImage(image,),
                      alignment: const Alignment(0, 0),
            
                
                      ),
                       Text(titre,
                        style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold,
                           fontSize: 15,
                        ),
                      ),

                      // LE BOUTON DES LIENS
      
                      Container(
                          child: textButton,
                        ),
                        
                        
                    
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    
  }
}
