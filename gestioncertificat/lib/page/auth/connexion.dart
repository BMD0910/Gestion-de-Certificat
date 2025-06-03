import 'package:flutter/material.dart';
import 'package:gestioncertificat/page/user/acceuil_hab.dart';
import 'package:gestioncertificat/page/user/header.dart';
import 'package:gestioncertificat/page/auth/inscription.dart';
import 'package:gestioncertificat/page/auth/reinitialisation.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<StatefulWidget> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 20,),
          MyCustomHeader(),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 12,
            ),
            child: Column(
              children: [
                MyCustomForm(),
                SizedBox(height: 20),
                _bottomRow(context),
              ],
            ),
          ),
        ],
      ),
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
          child: const Text(
            "Mot de passe oublie ?",
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
          child: const Text(
            "Creer un compte",
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final FocusScopeNode _node = FocusScopeNode();
  final GlobalKey _formKey = GlobalKey();

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: FocusScope(
        node: _node,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              maxLength: 9,
              onEditingComplete: _node.nextFocus,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Votre numero de telephone",
                hintText: "7x 123 45 67",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                prefixIcon: const Icon(Icons.phone),
              ),
            ),
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onEditingComplete: _node.nextFocus,
              decoration: InputDecoration(
                labelText: "Votre mot de passe",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                prefixIcon: const Icon(Icons.password),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcceuilHabitant()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Connexion",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
