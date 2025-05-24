import 'package:flutter/material.dart';
import 'package:gestion_certificat/page/admin/page_dashboard.dart';
import 'package:gestion_certificat/page/auth/connexion.dart';
import 'package:gestion_certificat/page/user/page_connexion.dart';
import 'dart:async';

import '../../constants/app_colors.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({super.key});

  @override
  State<PageAcceuil> createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  @override
  void initState() {
    super.initState();

    // Rediriger après 10 secondes
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  Connexion()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.primary,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo5.png',
            height: 300,
          ),
          const SizedBox(height: 20),
          
          // const SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white24,  // léger contraste
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),

        ],
      ),
    ),
  );
}
}
