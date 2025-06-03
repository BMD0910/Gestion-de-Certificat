import "package:flutter/material.dart";

class MyCustomHeader extends StatelessWidget {
  const MyCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 200,
          // width: 300,
          child: Image.asset('assets/images/logo4.png'),
        ),
        Text(
          // "Bienvenue dans la page de connexion",
          "Votre certificat facilement",
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 51, 103, 53),
          ),
        ),
      ],
    );
  }
}
