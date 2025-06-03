import 'package:flutter/material.dart';
import 'package:gestioncertificat/page/admin/page_dashboard.dart';
import 'package:gestioncertificat/page/user/header.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<StatefulWidget> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom+24),
          child: Column(
            children: [
              MyCustomHeader(),
              SizedBox(height: 20),
              Text(
                "Veuillez fournir les informations pour creer un compte",
                // style: TextStyle(color: Colors.blueGrey, fontSize: 14,),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              MyCustomForm(),
            ],
          ),
        ),
      ),
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
              onEditingComplete: _node.nextFocus,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Adresse mail',
                hintText: "utilisateur@email.com",
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onEditingComplete: _node.nextFocus,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Prenom",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onEditingComplete: _node.nextFocus,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Nom",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
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
            // SizedBox(height:10),
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              maxLength: 13,
              onEditingComplete: _node.nextFocus,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "CNI",
                hintText: "x xxxx xxxx xxxxx",
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                prefixIcon: const Icon(Icons.perm_identity),
              ),
            ),
            // SizedBox(height:10),
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
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageDashboard()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Inscription",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
