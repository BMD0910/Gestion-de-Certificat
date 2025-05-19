import 'package:flutter/material.dart';
import 'package:gestion_certificat/page/admin/page_gestion_certificat.dart';
import 'package:gestion_certificat/page/admin/page_gestion_maison.dart';
import 'package:gestion_certificat/page/admin/page_gestion_quartier.dart';
import 'package:gestion_certificat/widgets/appbar.dart';
import 'package:gestion_certificat/widgets/card1_certif_Admin.dart';


import '../../constants/app_colors.dart';

class PageDashboard extends StatefulWidget {
  const PageDashboard({super.key});

  @override
  State<PageDashboard> createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {

  int indexPageCourant = 0;

 

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;


    // Largeur automatique des cartes
    final double cardWidth = (screenWidth - 48) / 2;


  return Scaffold(
    backgroundColor: AppColors.secondary,
    appBar: MyCustomAppbar(nomUtilisateur: "Baye Mor Diouf", profilUtilisateur: "administrateur",),
    body:SingleChildScrollView(
      child:  Column(
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
                Card1CertifAdmin(title1: "Baye mor Diouf", title2: "NCI : 091020000915", subtitle: "09-10-2000  12:30") ,
                Card1CertifAdmin(title1: "Baye mor Diouf", title2: "NCI : 091020000915", subtitle: "09-10-2000  12:30") ,
                Card1CertifAdmin(title1: "Baye mor Diouf", title2: "NCI : 091020000915", subtitle: "09-10-2000  12:30") ,
                SizedBox(height: 15,) ,
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  PageGestionCertificat()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.background2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Voir Plus" , style: TextStyle(
                    color: AppColors.textTertiary
                  ),),
                ),
                SizedBox(height: 30,) ,
                
              ],
            ),
          ),

        ],
      
    ) ,
    )
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



