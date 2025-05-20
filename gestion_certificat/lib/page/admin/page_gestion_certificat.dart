import 'package:flutter/material.dart';

import 'package:gestion_certificat/widgets/appbar3.dart';
import 'package:gestion_certificat/widgets/card2_certif_Admin.dart';

import '../../constants/app_colors.dart';



class PageGestionCertificat extends StatefulWidget {
  const PageGestionCertificat({super.key});

  @override
  State<PageGestionCertificat> createState() => _PageGestionCertificatState();
}

class _PageGestionCertificatState extends State<PageGestionCertificat> {

  int indexPageCourant = 0;

 

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.secondary,

      //

      appBar: MyAppbar2(nomPage: "Certificat",),
      

      //

      body:SingleChildScrollView(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              
              padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Demandes en attentes",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0),
                    child: Column(
                      
                      children: [
                       Card2CertifAdmin(
                          date: "09-10-2000 18:05",
                          nom: "Baye Mor Diouf",
                          datenaissance: "09-10-2000",
                          nci: "123456789",
                          telephone: "77 123 45 67",
                          lieunaissance: "Dakar",
                          numvilla: "123",
                        ),

                        Card2CertifAdmin(
                          date: "09-10-2000 18:05",
                          nom: "Baye Mor Diouf",
                          datenaissance: "09-10-2000",
                          nci: "123456789",
                          telephone: "77 123 45 67",
                          lieunaissance: "Dakar",
                          numvilla: "123",
                        ),

                        Card2CertifAdmin(
                          date: "09-10-2000 18:05",
                          nom: "Baye Mor Diouf",
                          datenaissance: "09-10-2000",
                          nci: "123456789",
                          telephone: "77 123 45 67",
                          lieunaissance: "Dakar",
                          numvilla: "123",
                        ),

                        Card2CertifAdmin(
                          date: "09-10-2000 18:05",
                          nom: "Baye Mor Diouf",
                          datenaissance: "09-10-2000",
                          nci: "123456789",
                          telephone: "77 123 45 67",
                          lieunaissance: "Dakar",
                          numvilla: "123",
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),

            ),
            
            const SizedBox(height: 16),

          ],
        ),
      )
    );
  }


Widget Formulaire() {

    final formKey = GlobalKey<FormState>();
    final nomController = TextEditingController();
    final descController = TextEditingController();
   

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          champsQuartier(
            nomController: nomController,
            descController: descController,
          ),
          const SizedBox(height: 24),
          boutonEnregistrer(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                print("Nom : ${nomController.text}");
                print("Description : ${descController.text}");
                // Tu peux maintenant envoyer les données
              }
            },
          ),
        ],
      ),
    );
  }



  Widget champsQuartier({
    required TextEditingController nomController,
    required TextEditingController descController,
  }) {
    const Color borderColor = AppColors.primary; // couleur personnalisée

    return Column(
      children: [
        // Champ NOM
        TextFormField(
          controller: nomController,
          decoration: InputDecoration(
            labelText: "Nom",
            hintText: "Ex : Quartier Darou Salam",
            
            // bordure normale
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand c'est focus (sélectionné)
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(7),
            ),


            // bordure quand une erreur est présente
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: AppColors.buttonDelete, width: 1.5),
            ),

            // bordure quand focus ET erreur
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: AppColors.buttonDelete, width: 2),
            ),

            prefixIcon: const Icon(Icons.location_on, color: borderColor),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Le nom est obligatoire';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Champ DESCRIPTION
        TextFormField(
          controller: descController,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: "Description",
            hintText: "Décrivez cet élément...",

            // bordure normale
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand c'est focus (sélectionné)
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand une erreur est présente
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: AppColors.buttonDelete, width: 1.5),
            ),

            // bordure quand focus ET erreur
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: AppColors.buttonDelete, width: 2),
            ),

            prefixIcon: const Icon(Icons.edit_note, color: borderColor),

          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'La description est obligatoire';
            }
            return null;
          },
        ),
      ],
    );
  }


  Widget boutonEnregistrer({
    required VoidCallback onPressed,
    String label = "Enregistrer",
    Color color =  AppColors.primary,
  }) {
    return SizedBox(
      width: 200 ,
      height: 35,
      
      child: ElevatedButton.icon(
        onPressed: onPressed,
    
        label: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold , color: AppColors.textTertiary,),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }



}




