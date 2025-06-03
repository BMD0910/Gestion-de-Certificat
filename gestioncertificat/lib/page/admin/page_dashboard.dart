import 'package:flutter/material.dart';
import 'package:gestioncertificat/models/certificat_model.dart';
import 'package:gestioncertificat/page/admin/page_gestion_certificat.dart';
import 'package:gestioncertificat/page/admin/page_gestion_habitant.dart';
import 'package:gestioncertificat/page/admin/page_gestion_maison.dart';
import 'package:gestioncertificat/page/admin/page_gestion_quartier.dart';
import 'package:gestioncertificat/services/certificat_service.dart';
import 'package:gestioncertificat/services/dashboard_service.dart';

import 'package:gestioncertificat/widgets/appbar2.dart';
import 'package:gestioncertificat/widgets/card1_certif_Admin.dart';

import '../../constants/app_colors.dart';

class PageDashboard extends StatefulWidget {
  const PageDashboard({super.key});

  @override
  State<PageDashboard> createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {
  late Future<List<CertificatModel>> certificatFuture;

  int indexPageCourant = 0;
  int nbMaisons = 0;
  int nbQuartiers = 0;
  int nbHabitants = 0;
  int nbCertificats = 0;

  @override
  void initState() {
    super.initState();
    _loadStats();
    certificatFuture = CertificatService.getCertificatsEnAttente();
  }

  Future<void> _loadStats() async {
    final maisons = await DashboardService.getMaisons();
    final quartiers = await DashboardService.getQuartiers();
    final habitants = await DashboardService.getHabitants();
    final certificats = await DashboardService.getCertificatsEnAttente();
    setState(() {
      nbMaisons = maisons;
      nbQuartiers = quartiers;
      nbHabitants = habitants;
      nbCertificats = certificats;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Largeur automatique des cartes
    final double cardWidth = (screenWidth - 48) / 2;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: MyAppbar1(
        nomUtilisateur: "Baye Mor Diouf",
        profilUtilisateur: "administrateur",
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
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
                        value: nbQuartiers.toString(),
                        color: AppColors.cardBackground1,
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PageGestionQuartier(),
                              ),
                            ),
                        width: cardWidth,
                      ),
                      _buildCard(
                        context,
                        title: "Maisons",
                        icon: Icons.home,
                        value: nbMaisons.toString(),
                        color: AppColors.cardBackground2,
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PageGestionMaison(),
                              ),
                            ),
                        width: cardWidth,
                      ),
                      _buildCard(
                        context,
                        title: "Certificats",
                        icon: Icons.description,
                        value: nbCertificats.toString(),
                        color: AppColors.cardBackground2,
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PageGestionCertificat(),
                              ),
                            ),
                        width: cardWidth,
                      ),
                      _buildCard(
                        context,
                        title: "Habitants",
                        icon: Icons.person,
                        value: nbHabitants.toString(),
                        color: AppColors.cardBackground1,
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PageGestionHabitant(),
                              ),
                            ),
                        width: cardWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.center,

              // height: 800,
              padding: const EdgeInsets.all(10),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 200, 243, 204),
              ),

              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Liste des Demandes",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10),

                  FutureBuilder<List<CertificatModel>>(
                    future: certificatFuture,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("Aucun certificat trouvé"),
                        );
                      } else {
                        final certificats = snapshot.data!;

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: certificats.length,
                          itemBuilder: (context, index) {
                            final certificat = certificats[index];
                            return Card1CertifAdmin(
                              id: certificat.id,
                              nom: certificat.nom,
                              email: certificat.email,
                              nci: certificat.nci,
                              datecreation:
                                  "${certificat.datecreation.day}-${certificat.datecreation.month}-${certificat.datecreation.year} ${certificat.datecreation.hour}:${certificat.datecreation.minute}",
                            );
                          },
                        );
                      }
                    },
                  ),

                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PageGestionCertificat(),
                          ),
                        ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.background2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "Voir Plus",
                      style: TextStyle(color: AppColors.textTertiary),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour créer une carte pour les gestion de nos entités(Maison , )
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
            Text(
              title,
              style: TextStyle(
                color: AppColors.textTertiary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(icon, color: AppColors.textTertiary, size: 30),
            Text(
              value,
              style: TextStyle(
                color: AppColors.textTertiary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
