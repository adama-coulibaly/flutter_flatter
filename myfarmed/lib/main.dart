import 'package:flutter/material.dart';
import 'package:myfarmed/pages/accueil.dart';
import 'package:myfarmed/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 
     const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
     
    return const MaterialApp(
      home: myHome(),
   
      debugShowCheckedModeBanner: false,
         
    );
  }
}

// WIDGET DE CONNEXION


class connexion extends StatelessWidget {

   connexion({super.key});
 TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
         children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
               
                ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Image(image: AssetImage('assets/images/connexion.png'),
                height: 200,),
                ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration:  InputDecoration(
                   prefixIcon: const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Icon(Icons.mail,size: 40,color: Colors.green,),
                   ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(width: 3, color: Colors.green),
                     borderRadius: BorderRadius.circular(50.0),

                  ),
                  
                  labelText: 'Adresse email',
                  
                ),style: const TextStyle(
                  color: Colors.green,fontSize: 20
                ),
                
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration:  InputDecoration(
                   prefixIcon: const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Icon(Icons.key,size: 40,color: Colors.green,),
                   ),
                  border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(width: 3, color: Colors.green),
                     borderRadius: BorderRadius.circular(50.0),

                  ),
                  labelText: 'Mot de passe',
                ),style: const TextStyle(
                  color: Colors.green,fontSize: 20
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Mot de passe oublié',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),),
            ),
            const SizedBox(height: 40,),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },

                   style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.white, 
                    minimumSize: Size(20, 60)
                   
                  ),
                  child: const Text('Connexion',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
             
              children: <Widget>[
                 const SizedBox(height: 105,),
                const Text('Vous n\'avez pas de compte ?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700
                ),),
                TextButton(
                  child: const Text(
                    'Inscription',
                    style: TextStyle(fontSize: 25,
                    color: Colors.green),
                    
                  ),
                  onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  inscription() ),);
                  },
                )
              ],
            ),
          ],
        ));
  }
}


// WIDGET D'INSCRIPTION

class inscription extends StatelessWidget {
   inscription({super.key});

   TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
         children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
               
                ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Image(image: AssetImage('assets/images/inscription.png'),
                height: 200,),
                ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration:  InputDecoration(
                   prefixIcon: const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Icon(Icons.man,size: 40,color: Colors.green,),
                   ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(width: 3, color: Colors.green),
                     borderRadius: BorderRadius.circular(50.0),

                  ),
                  
                  labelText: 'Nom complet',
                  
                ),style: const TextStyle(
                  color: Colors.green,fontSize: 20
                ),
                
              ),
            ),
          Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration:  InputDecoration(
                   prefixIcon: const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Icon(Icons.mail,size: 40,color: Colors.green,),
                   ),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(width: 3, color: Colors.green),
                     borderRadius: BorderRadius.circular(50.0),

                  ),
                  
                  labelText: 'adresse email',
                  
                ),style: const TextStyle(
                  color: Colors.green,fontSize: 20
                ),
                
              ),
            ),


             Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration:  InputDecoration(
                   prefixIcon: const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Icon(Icons.key,size: 40,color: Colors.green,),
                   ),
                  border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 3, color: Colors.green),
                     borderRadius: BorderRadius.circular(50.0),

                  ),
                  labelText: 'Mot de passe',
                ),style: const TextStyle(
                  color: Colors.green,fontSize: 20
                ),
              ),
            ),

             Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration:  InputDecoration(
                   prefixIcon: const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Icon(Icons.verified_user,size: 40,color: Colors.green,),
                   ),
                  border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 3, color: Colors.green),
                     borderRadius: BorderRadius.circular(50.0),

                  ),
                  labelText: 'Confirmé',
                ),style: const TextStyle(
                  color: Colors.green,fontSize: 20
                ),
              ),
            ),
            
            const SizedBox(height: 40,),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> homePrincipal(),),);
                  },

                   style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.white, 
                    minimumSize: Size(20, 60)
                   
                  ),
                  child: const Text('Inscription',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                )
            ),
       
          ],
        ));
  }
}