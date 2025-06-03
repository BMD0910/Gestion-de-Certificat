import 'package:flutter/material.dart';
import 'package:gestioncertificat/constants/app_colors.dart';
import 'package:gestioncertificat/page/page_acceuil.dart';

class MyAppbar1 extends StatefulWidget implements PreferredSizeWidget {
  final String nomUtilisateur;
  final String profilUtilisateur;
  const MyAppbar1({
    super.key,
    required this.nomUtilisateur,
    required this.profilUtilisateur,
  });

  @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Size get preferredSize => const Size.fromHeight(200);

  @override
  State<MyAppbar1> createState() => _MyAppbar1State();
}

class _MyAppbar1State extends State<MyAppbar1> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(400, 170),

      child: Column(
        children: [
          AppBar(
            foregroundColor: AppColors.buttonSecondary,
            toolbarHeight: 170,
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
              child: Column(
                children: [
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PageAcceuil(),
                            ),
                          );
                        },
                        icon: Image.asset(
                          "assets/images/logo5.png",
                          height: 90,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.menu_rounded),
                        color: AppColors.buttonSecondary,
                        iconSize: 50,
                        tooltip: 'Menu',
                        onPressed: () {
                          // handle the press
                        },
                      ),
                    ],
                  ),

                  //
                  Column(
                    children: [
                      Text(
                        "Bienvenue, ${widget.nomUtilisateur}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.profilUtilisateur,
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            backgroundColor: AppColors.background2,
          ),
        ],
      ),
    );
  }
}
