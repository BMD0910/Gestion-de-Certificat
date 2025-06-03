import 'package:flutter/material.dart';
import 'package:gestioncertificat/page/auth/connexion.dart';

// il faut appeler le constructeur MyCustomAppbar.titled() pour les pages ou il y a le bouton
// "retour" et le titre de la page

// Pour les pages d'acceuil "administrateur" et "Habitant", il faut juste appeler le constructeur
// par defaut avec le nom de l'utilisateur et son profil comme arguments "MyCustomAppbar()"

class MyCustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  String? nomUtilisateur;
  String? profilUtilisateur;
  String? title;
  MyCustomAppbar({
    super.key,
    required this.nomUtilisateur,
    required this.profilUtilisateur,
  });
  MyCustomAppbar.titled({super.key, required this.title});

  @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Size get preferredSize => const Size.fromHeight(200);

  @override
  State<MyCustomAppbar> createState() => _MyCustomAppbarState();
}

class _MyCustomAppbarState extends State<MyCustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(400, 200),
      child: Column(
        children: [
          AppBar(
            foregroundColor: Colors.white,
            toolbarHeight: 100,
            leadingWidth: 100,
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Connexion()),
                );
              },
              icon: Image.asset("assets/images/logo5.png"),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.menu_rounded),
                iconSize: 50,
                tooltip: 'Menu',
                onPressed: () {
                  // handle the press
                },
              ),
            ],
            elevation: 10,
            backgroundColor: Color.fromARGB(245, 33, 129, 101),
          ),
          appbarBottom(),
        ],
      ),
    );
  }

  Widget appbarBottom() {
    if (widget.title == null) {
      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 33, 129, 101),
            child: Text(
              "Bienvenue, ${widget.nomUtilisateur!}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 33, 129, 101),
            child: Text(
              widget.profilUtilisateur!,
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    } else {
      return Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 33, 129, 101),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Retour",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.title!,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      );
    }
  }
}
