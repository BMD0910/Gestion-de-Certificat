import 'package:flutter/material.dart';
import 'package:gestion_certificat/page/user/header.dart';


class Reinitialisation extends StatefulWidget {
  const Reinitialisation({super.key});

  @override
  State<StatefulWidget> createState() => _ReinitialisationState();
}

class _ReinitialisationState extends State<Reinitialisation> {
  bool messageEnvoye = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyCustomHeader(),
          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 12),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  messageEnvoye ? CodeReinit() : MyCustomForm(),
                  SizedBox(height: 20,),
                  messageEnvoye ? _boutonConfirmer(context) : _boutonEnvoyer(context),
                ],
              ),
          ),
        ],
      ),
    );
  }

  _boutonEnvoyer(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              messageEnvoye = true;
            });
          },
          style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: Colors.green,
        ),
          child: const Text(
            "Envoyer",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }

  _boutonConfirmer(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: Colors.green,
        ),
          child: const Text(
            "Confirmer",
            style: TextStyle(fontSize: 20, color: Colors.white),
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
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: FocusScope(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Un message de reinitialisation sera envoye au numero de telephone fourni.",
              style: TextStyle(color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
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
                    borderSide: BorderSide.none
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                prefixIcon: const Icon(Icons.phone)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CodeReinit extends StatefulWidget {
  const CodeReinit({super.key, bool? messageEnvoye});

  @override
  State<CodeReinit> createState() => _CodeReinitState();
}

class _CodeReinitState extends State<CodeReinit> {
  final GlobalKey _formKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: FocusScope(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Veuillez remplir le champ ci-dessous avec le code recu par sms",
              style: TextStyle(color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: "code reinitialisation",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                prefixIcon: const Icon(Icons.password),
              ),
              obscureText: true,
            ),
          ]
        ),
      ),
    );
  }
}