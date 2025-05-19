import 'package:flutter/material.dart';
import 'package:gestion_certificat/page/admin/page_gestion_certificat.dart';
import 'package:gestion_certificat/page/admin/page_gestion_maison.dart';
import 'package:gestion_certificat/page/admin/page_gestion_quartier.dart';
import 'package:gestion_certificat/widgets/appbar.dart';
import 'package:gestion_certificat/widgets/card1_certif_Admin.dart';
import 'dart:async';


import '../../constants/app_colors.dart';

class PageDashboard extends StatefulWidget {
  const PageDashboard({super.key});

  @override
  State<PageDashboard> createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {

  int indexPageCourant = 0;

  

  @override
  void initState() {
    super.initState();

    // Rediriger après 10 secondes
    // Timer(const Duration(seconds: 4), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) =>  LoginPage()),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 350;

    // Largeur automatique des cartes
    final double cardWidth = (screenWidth - 48) / 2;

    return Scaffold(
      appBar: AppBar(title: const Text("Tableau de bord Admin")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "STATISTIQUES",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),

            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildCard(
                  context,
                  title: "Quartiers",
                  icon: Icons.location_on,
                  value: "17",
                  color: AppColors.cardBackground1,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  PageGestionQuartier()),
                  ),
                  width: cardWidth,
                ),
                _buildCard(
                  context,
                  title: "Maisons",
                  icon: Icons.home,
                  value: "93",
                  color: AppColors.cardBackground2,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  PageGestionMaison()),
                  ),
                  width: cardWidth,
                ),
                _buildCard(
                  context,
                  title: "Certificats",
                  icon: Icons.description,
                  value: "106",
                  color: AppColors.cardBackground2,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  PageGestionCertificat()),
                  ),
                  width: cardWidth,
                ),
                _buildCard(
                  context,
                  title: "Habitants",
                  icon: Icons.person,
                  value: "760",
                  color: AppColors.cardBackground1,
                  onTap: () => print("Habitants cliqué"),
                  width: cardWidth,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String value,
    required Color color,
    required VoidCallback onTap,
    required double width,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(139, 1, 3, 3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Icon(icon, color: AppColors.textTertiary, size: 30),
            Text(value,
                style: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
