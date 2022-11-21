// ignore_for_file: unrelated_type_equality_checks
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfarmed/pages/accueil.dart';
import 'package:email_validator/email_validator.dart';
import 'package:myfarmed/pages/home.dart';
// import 'package:myfarmed/pages/home.dart';

// ICI ON INITIALISE FIREBASE AVEC  WidgetsFlutterBinding.ensureInitialized();
// ET ON FAIT DE LUI UNE METHODE ASYNCHRONE AVEC FUTURE ET ASYNC
// AWAIT EST UTILISE EN GENERAL POUR LES 
Future <void> main() async{
runApp(const MyApp());
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
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


class connexion extends StatefulWidget {

connexion({super.key});

@override
State<connexion> createState() => _connexionState();
}

// ICI NOTRE CLASS DE CONNEXION

class _connexionState extends State<connexion> {
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

// VARIABLE DE RECUPERATION DEPUIS FIREBASE
var tout = FirebaseFirestore.instance.collection("Etudiants").snapshots();

// WIDGET DE SCAFFOLD
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

// ICI LE CONTENU DE LA PAGE

    body: ListView(
// WIDGET DE CONNEXION 
      children: <Widget>[

        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            
            ),

// CONTAINER DE MISE EN PLACE DE L'IMAGE
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Image(image: AssetImage('assets/images/connexion.png'),
            height: 200,),
            ),
      
// CONTAINER DE CHAMP DE SAISIE POUR ADRESSE

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

// CONTAINER DE CHAMP DE SAISIE POUR MOT DE PASSE
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


// CONTAINER DE MOT DE PASSE OUBLIE          
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

// CONTAINER DE BOUTON DE CONNEXION
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: () {

                // print(nameController.text);
                // print(passwordController.text);
//                 FirebaseFirestore.instance.collection("Etudiants").add({
//   "email": nameController.text,
//   "mot de passe": passwordController.text,
// });
                // sauvegarder(nameController.text, passwordController.text);
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

// VOUS N'AVEZ PAS DE COMPTE 
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Inscription() ),);
              },
            )
          ],
        ),
      ],
    ));
}
}



class Inscription extends StatefulWidget {
Inscription({super.key});



@override
State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

TextEditingController nameControllerInsc = TextEditingController();
TextEditingController adresseMailController = TextEditingController();
TextEditingController passe1Controller = TextEditingController();
TextEditingController passe2Controller = TextEditingController();
late  bool ok = false;
// MA METHODE D'INSCRIPTION

void Inscrit(){
// String adresseInscription;
// ICI ON CREE UNE VARIABLE BOOLEAN QUI VERIFIE SI TOUTE FOIS L'ADRESSE EMAIL EST VALIDE
final bool EmailValider = EmailValidator.validate(adresseMailController.text);
String passe1,passe2;

 if( nameControllerInsc.text == "" ||  adresseMailController.text == "" || passe1Controller.text == "" || passe2Controller.text == ""){
       ok == true;
        showDialog(
        context: context,
        builder: (cxt) =>const Center(
            child:AlertDialog(
            title: Center(child: Text("Veuillez remplir tous les champs !")),
            content: Icon(Icons.warning_amber,size: 100,color: Colors.yellow,),
          ),
          
        )
          
          );
      }
      else{
        if(EmailValider){
           if(passe1Controller.text == passe2Controller.text){
  
FirebaseFirestore.instance.collection("Inscription").add({
    "nom complet":nameControllerInsc.text,
    "adresse mail":adresseMailController.text,
    "passe1":passe1Controller.text
      
    
  });
  // ICI CONFIRMATION DE LA CREATION DES COMPTES
  showDialog(
            context: context,
            builder: (ctxt) =>  Center(
              child: AlertDialog(
                title: const Text("Compte créer avec succes"),
                content: const Icon(Icons.check_box,size: 100,color: Colors.green,),
                actions: [
                  // BOUTON ANNULER
                    TextButton(onPressed: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Inscription() ),);
                    },
                  style: TextButton.styleFrom(backgroundColor: Colors.red), child: const Text('Annuler',style: 
                  TextStyle(color: Colors.white,),
                  ),
                  ),
                  
                //  BOUTON CONTUNIER
                  TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  homePrincipal() ),);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.green), child: const Text('Contunier',style: 
                  TextStyle(color: Colors.white,),
                  ),
                  ),

                
                  
                  
                ], 
            ),
            ),
            
        );



           }
           else{
              showDialog(
        context: context,
        builder: (cxt) =>const Center(
            child:AlertDialog(
            title: Text("Mot de passe incorrect !"),
          )
        )
          
          );
           }

        }
        else{

          showDialog(
        context: context,
        builder: (cxt) =>const Center(
            child:AlertDialog(
            title: Text("Email non valide !"),
          )
        )
          
          );

        }
        
      }



}

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

// **************************************************************************************************

// LE CORPS DE LA PAGE D'INSCRIPTION
//    
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
            controller: nameControllerInsc,
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
            controller: adresseMailController,
            decoration:  InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.mail,size: 40,color: Colors.green,),
                ),
              //  suffixIcon: IconButton(onPressed: (() => widget., icon: Icon(Icons.close)),
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
            maxLength: 10,
        
            controller: passe1Controller,
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
              maxLength: 10,

            controller: passe2Controller,
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
                // ICI ON FAIT APPEL A LA FONCTION PERMETTANT DE FAIRE LA CREATION DES COMPTES 
                  Inscrit ();

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
