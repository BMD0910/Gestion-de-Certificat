import 'package:flutter/material.dart';
import 'package:gestion_certificat/widgets/champ_mdp_form.dart';
import '../constants/app_colors.dart'; // assure-toi d'avoir ce fichier

Widget formulaireAjoutHabitant({
  required TextEditingController nomController,
  required TextEditingController phoneController,
  required TextEditingController emailController,
  required TextEditingController nciController,
  required TextEditingController lieuController,
  required TextEditingController villaController,
  required TextEditingController mdpController,
  required DateTime? selectedDate,
  required VoidCallback onSelectDate,
  required Color borderColor,
}) {
  return Column(
    children: [
      // Champ NOM
      TextFormField(
        controller: nomController,
        decoration: InputDecoration(
          labelText: "Nom complet",
          hintText: "Ex : Baye Mor Diouf",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(7),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 2),
          ),
          prefixIcon: Icon(Icons.person, color: borderColor),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Le nom est obligatoire';
          }
          return null;
        },
      ),


      const SizedBox(height: 16),

      // Champ DATE DE NAISSANCE
      InkWell(
        onTap: onSelectDate,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: "Date de naissance",
            hintText: "Choisissez une date",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(7),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(7),
            ),
            prefixIcon: Icon(Icons.cake, color: borderColor),
          ),
          child: Text(
            selectedDate != null
                ? "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
                : "Sélectionnez une date",
            style: TextStyle(
              color: selectedDate != null ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),


      const SizedBox(height: 16),

      TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: "Numéro de téléphone",
          hintText: "Ex : 77 123 45 67",
          
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(7),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 2),
          ),
          prefixIcon: Icon(Icons.phone, color: borderColor),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Le numéro de téléphone est obligatoire';
          }
          return null;
        },
      ),

      const SizedBox(height: 16),
      
      TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Adresse email",
          hintText: "Ex : baye@example.com",

          // Bordure normale
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(7),
          ),

          // Bordure focus
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(7),
          ),

          // Bordure erreur
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 1.5),
          ),

          // Bordure focus + erreur
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 2),
          ),

          prefixIcon: Icon(Icons.email, color: borderColor),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'L\'adresse email est obligatoire';
          } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Email invalide';
          }
          return null;
        },
      ),

      const SizedBox(height: 16),


      // Champ NCI
      TextFormField(
        controller: nciController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "NCI",
          hintText: "Ex : 1056540522809",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(7),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 2),
          ),
          prefixIcon: Icon(Icons.badge, color: borderColor),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Le NCI est obligatoire';
          }
          return null;
        },
      ),
      const SizedBox(height: 16),

      // Champ Lieu de naissance
      TextFormField(
        controller: lieuController,
        decoration: InputDecoration(
          labelText: "Lieu de naissance",
          hintText: "Ex : Guédiawaye",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(7),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 2),
          ),
          prefixIcon: Icon(Icons.location_on, color: borderColor),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Le lieu de naissance est obligatoire';
          }
          return null;
        },
      ),
      const SizedBox(height: 16),

      // Champ Numéro de villa
      TextFormField(
        controller: villaController,
        decoration: InputDecoration(
          labelText: "Numéro de villa",
          hintText: "Ex : 772",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(7),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.buttonDelete, width: 2),
          ),
          prefixIcon: Icon(Icons.home, color: borderColor),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Le numéro de villa est obligatoire';
          }
          return null;
        },
      ),
       
      const SizedBox(height: 16),

      ChampMdp(controller: mdpController),
    
    ],
  );
}
