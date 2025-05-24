import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class Card1CertifAdmin extends StatelessWidget {
  final String title1;
  final String title2;
  final String subtitle;
  final VoidCallback? onTap;

  const Card1CertifAdmin({
    super.key,
    required this.title1,
    required this.title2,
    required this.subtitle,
    this.onTap,
  });

  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: onTap,
      child: Card(
        elevation: 3,
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(38, 0, 0, 0).withValues(),
                      blurRadius: 10,                      
                      offset: const Offset(0, 4),           
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7), // si tu veux aussi arrondir l’image
                  child: 
                  Image.asset(
                    'assets/images/quartier.png',
                    height: 70,
                    
                  ),
                ),
              ),

              
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title1,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold , color: AppColors.textPrimary)),
                    const SizedBox(height: 4),
                    Text(title2,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold , color: AppColors.textPrimary)),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: const TextStyle(color: AppColors.textSecondary)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      boutonCrad(
                        context,
                        label: "Valider",
                        onTap: () {
                          print("Bouton appuyé !");
                        }, 
                        color: AppColors.buttonPrimary,
                      ),
                      SizedBox(width: 10),
                      boutonCrad(
                        context,
                        label: "Rejeter",
                        onTap: () {
                          print("Bouton appuyé !");
                        }, 
                        color: AppColors.buttonDelete,
                      ),
                    ],)
                    
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget boutonCrad(
    BuildContext context, {
      required String label,
     
      required VoidCallback onTap,
      required Color color ,
    }) {
      return OutlinedButton.icon(
        onPressed: onTap,  
        label: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color, width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        ),
      );
    }


}
