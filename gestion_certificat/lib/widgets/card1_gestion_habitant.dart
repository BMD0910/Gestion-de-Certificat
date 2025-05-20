import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class Card1GestionHabitant extends StatelessWidget {
  final String nomHabitant;
  final String nci;
  final String telephone;

  final VoidCallback? onTap;

  const Card1GestionHabitant({
    super.key,
    required this.nomHabitant,
    required this.nci,
    required this.telephone,
 
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
                    'assets/images/habitant.png',
                    height: 70,
                    
                  ),
                ),
              ),

              
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( "Nom : $nomHabitant",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold , color: AppColors.textPrimary)),
                    const SizedBox(height: 4),

                    Text("NCI : $nci",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold , color: AppColors.textPrimary)),
                    const SizedBox(height: 4),
                    
                    Text("Tel : $telephone",
                        style: const TextStyle(color: AppColors.textPrimary)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        boutonCrad(
                          context,
                          icon: const Icon(Icons.edit),
                          onTap: () {
                            print("Bouton appuyé !");
                          }, 
                          color: AppColors.buttonPrimary,
                        ),
                        SizedBox(width: 10),
                        boutonCrad(
                          context,
                          icon: const Icon(Icons.delete),
                          onTap: () {
                            print("Bouton appuyé !");
                          }, 
                          color: AppColors.buttonDelete,
                        ),
                      ],
                    )
                    
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
      required Icon icon,
      
      required VoidCallback onTap,
      required Color color ,
    }) {
      return IconButton(
        onPressed: onTap,  
        icon: icon ,
        color: color,
        iconSize: 25
      );
    }


}
