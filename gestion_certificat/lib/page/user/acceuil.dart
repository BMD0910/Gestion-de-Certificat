import 'package:flutter/material.dart';
import 'package:gestion_certificat/page/user/header.dart';
import 'package:gestion_certificat/page/auth/inscription.dart';
import 'package:gestion_certificat/page/auth/reinitialisation.dart';


class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  // List <String> nomPages = ['Connexion', 'Inscription'];
  // int indexPageCourant = 0;
  // List pages = [Connexion(), Inscription(), Reinitialisation(), AcceuilHabitant(),];

  @override
  Widget build(BuildContext context) {
    // padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: MediaQuery.of(context).viewInsets.bottom+24),
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Acceuil()),
              );
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          // decoration: BoxDecoration(color: Colors.red),
          child: Column(
            children: [
              MyCustomHeader(),
              // pages[indexPageCourant],
              // pages[indexPageCourant],
              // indexPageCourant == 0 ? _bottomRow(context) : SizedBox(height: 0,),
            ]
          )
        ),
      )
    );
  }

  _bottomRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
                // indexPageCourant = 2;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Reinitialisation()),
                );
              });
          },
          child: const Text("Mot de passe oublie ?",
            style: TextStyle(color: Colors.green),
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                // indexPageCourant = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inscription()),
                );
              });
            },
            child: const Text("Creer un compte", style: TextStyle(color: Colors.green),)
        )
      ],
    );
  }
}