import 'package:flutter/material.dart';


import 'package:gestion_certificat/widgets/appbar3.dart';
import 'package:gestion_certificat/widgets/card1_gestion_habitant.dart';
import 'package:gestion_certificat/widgets/card1_gestion_maison.dart';
import 'package:gestion_certificat/widgets/formulaire_ajout_habitant.dart';




import '../../constants/app_colors.dart';

class PageGestionHabitant extends StatefulWidget {
  const PageGestionHabitant({super.key});

  @override
  State<PageGestionHabitant> createState() => _PageGestionHabitantState();
}

class _PageGestionHabitantState extends State<PageGestionHabitant> {

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              
              padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ajouter un habitant",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: boutonAjouter(),
                  ),
                  const SizedBox(height: 16),
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
                    "Liste des habitants",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card1GestionHabitant(nomHabitant: "Baye mor Diouf",nci: "160820000915", telephone: "771044213",) ,
                  Card1GestionHabitant(nomHabitant: "Baye mor Diouf",nci: "160820000915", telephone: "771044213",) ,
                  Card1GestionHabitant(nomHabitant: "Baye mor Diouf",nci: "160820000915", telephone: "771044213",) ,
                  Card1GestionHabitant(nomHabitant: "Baye mor Diouf",nci: "160820000915", telephone: "771044213",) ,
                  
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
  final nomController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final nciController = TextEditingController();
  final lieuController = TextEditingController();
  final villaController = TextEditingController();
  final mdpController = TextEditingController();
  DateTime? selectedDate;
   

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          champsQuartier(
            
            nomController: nomController,
            phoneController: phoneController,
            emailController: emailController,
            nciController: nciController,
            lieuController: lieuController,
            villaController: villaController,
            mdpController: mdpController,
            selectedDate: selectedDate,

          ),
          const SizedBox(height: 24),
          boutonEnregistrer(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                
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
    required TextEditingController phoneController,
    required TextEditingController emailController,
    required TextEditingController nciController,
    required TextEditingController lieuController,
    required TextEditingController villaController,
    required TextEditingController mdpController,
    required DateTime? selectedDate,
    
    

  }) {
    // couleur personnalisée

    return formulaireAjoutHabitant(
      nomController: nomController,
      phoneController: phoneController,
      emailController: emailController,

      nciController: nciController,
      lieuController: lieuController,
      villaController: villaController,
      mdpController: mdpController,
      selectedDate: selectedDate,
      onSelectDate: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime(2000),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          setState(() {
            selectedDate = picked;
          });
        }
      },
      borderColor: const Color(0xFF298267),
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




  Widget boutonAjouter({
    
    String label = "Ajouter habitant",
    Color color =  AppColors.primary,
  }) {
    return SizedBox(
      width: 200 ,
      height: 35,
      
      child: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return popUpAjouter();
            },
          );

        },
          
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


  Widget popUpAjouter() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 10,
      backgroundColor: AppColors.background1,
      child: Stack(
        children: [
          // Contenu du dialog
          Container(
            constraints: const BoxConstraints(
              maxWidth: 400,
              minHeight: 200,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Ajouter un habitant",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                // Notre Formulaire d'ajout
                Formulaire(),

              ],
            ),
          ),

          //Bouton de fermeture 
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close, size: 24, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
            
  }





}




