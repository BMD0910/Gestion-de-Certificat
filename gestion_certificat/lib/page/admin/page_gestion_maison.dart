import 'package:flutter/material.dart';


import 'package:gestion_certificat/widgets/appbar3.dart';
import 'package:gestion_certificat/widgets/card1_gestion_maison.dart';




import '../../constants/app_colors.dart';

class PageGestionMaison extends StatefulWidget {
  const PageGestionMaison({super.key});

  @override
  State<PageGestionMaison> createState() => _PageGestionMaisonState();
}

class _PageGestionMaisonState extends State<PageGestionMaison> {

  int indexPageCourant = 0;

 

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.secondary,

      //

      appBar: MyAppbar2(nomPage: "Maison",),

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
                    "Ajouter une maison",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Formulaire(),
                  ),
                ],
              ),

            ),
            
            const SizedBox(height: 16),

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
                  const SizedBox(height: 10),
                  Text(
                    "Liste des maisons",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card1GestionMaison(numMaison: "288",nomQuratier: "Quartier Wakhinane Nimzat", descriptionQuartier: "Quartie Wakhinane Nimzat de marché bo bess") ,
                  Card1GestionMaison(numMaison: "288",nomQuratier: "Quartier Wakhinane Nimzat", descriptionQuartier: "Quartie Wakhinane Nimzat de marché bo bess") ,
                  Card1GestionMaison(numMaison: "288",nomQuratier: "Quartier Wakhinane Nimzat", descriptionQuartier: "Quartie Wakhinane Nimzat de marché bo bess") ,
                  Card1GestionMaison(numMaison: "288",nomQuratier: "Quartier Wakhinane Nimzat", descriptionQuartier: "Quartie Wakhinane Nimzat de marché bo bess") ,
                  
                  SizedBox(height: 15,) ,
                  SizedBox(height: 30,) ,
                  
                ],
              ),
          
            ),  
          ],
        ),
      )
    );
  }


Widget Formulaire() {

    final formKey = GlobalKey<FormState>();
    final numController = TextEditingController();
    final nomController = TextEditingController();
    final propietaireController = TextEditingController();
    final descController = TextEditingController();
   

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          champsQuartier(
            numController: numController,
            nomController: nomController,
            propietaireController: propietaireController,
            descController: descController,
          ),
          const SizedBox(height: 24),
          boutonEnregistrer(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                print("Numéro : ${numController.text}");
                print("Nom : ${nomController.text}");
                print("Propriétaire : ${propietaireController.text}");
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
    required TextEditingController numController,
    required TextEditingController nomController,
    required TextEditingController propietaireController,
    required TextEditingController descController,

  }) {
    const Color borderColor = AppColors.primary; // couleur personnalisée

    return Column(
      children: [
        // Champ NOM
        TextFormField(
          controller: numController,
          decoration: InputDecoration(
            labelText: "Numéro de la maison",
            hintText: "Ex : 772",
            
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

            prefixIcon: const Icon(Icons.home, color: borderColor),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Le numéro du maison est obligatoire';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),


        TextFormField(
          controller: nomController,
          decoration: InputDecoration(
            labelText: "Nom du Quartier",
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
              return 'Le nom du quartier est obligatoire';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        TextFormField(
          controller: propietaireController,
          decoration: InputDecoration(
            labelText: "NCI du Propriétaire",
            hintText: "Ex : 1056540522809",
            
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

            prefixIcon: const Icon(Icons.person, color: borderColor),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Le NCI du propriétaire est obligatoire';
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




