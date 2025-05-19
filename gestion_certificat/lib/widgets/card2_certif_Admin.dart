import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class Card2CertifAdmin extends StatelessWidget {
  final String date;
  final String nom;
  final String datenaissance;
  final String nci;
  final String telephone;
  final String lieunaissance;
  final String numvilla;
  final VoidCallback? onTap;

  const Card2CertifAdmin({
    super.key,
    required this.date,
    required this.nom,
    required this.datenaissance,
    required this.nci,
    required this.telephone,
    required this.lieunaissance,   
    required this.numvilla,
    this.onTap,
  });

  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: onTap,
      child: Card(
        elevation: 3,
        color: const Color.fromARGB(255, 200, 243, 204),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),

        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text(date,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold , color: AppColors.textSecondary)),
                const SizedBox(height: 10),
              ],),
              
              Text("Nom : $nom",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold , color: AppColors.textPrimary)),
              const SizedBox(height: 10),

              Text("Date de naissance : $datenaissance",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold , color: AppColors.textPrimary)),
              const SizedBox(height: 10),

              Text("NCI : $nci",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold , color: AppColors.textPrimary)),
              const SizedBox(height: 10),

              Text("Téléphone : $telephone",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold , color: AppColors.textPrimary)),
              const SizedBox(height: 10),

              Text("Lieu de naissance : $lieunaissance",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold , color: AppColors.textPrimary)),
              const SizedBox(height: 10),


              Text("N° Villa : $numvilla",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold , color: AppColors.textPrimary)),
              const SizedBox(height: 10),
              
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
