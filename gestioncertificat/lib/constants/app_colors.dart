import 'package:flutter/material.dart';

class AppColors {
  // Couleurs principales
  static const Color primary = Color.fromARGB(
    255,
    41,
    130,
    103,
  ); // Vert foncé que tu avais demandé
  static const Color secondary = Color.fromARGB(
    255,
    255,
    255,
    255,
  ); // Vert moyen (optionnel)

  // Couleurs de fond
  static const Color background1 = Color.fromARGB(255, 255, 255, 255);
  static const Color background2 = Color.fromARGB(255, 41, 130, 103);
  static const Color miniBackground = Color.fromARGB(255, 200, 243, 204);

  // Couleurs de carte
  static const Color cardBackground1 = Color.fromARGB(
    255,
    41,
    130,
    103,
  ); // Blanc
  static const Color cardBackground2 = Color(0xFF3AC0A0); // Blanc

  // Couleurs de texte
  static const Color textPrimary = Color.fromARGB(255, 41, 130, 103);
  static const Color textSecondary = Color.fromARGB(226, 8, 67, 49);
  static const Color textTertiary = Color.fromARGB(255, 255, 255, 255); // Blanc

  // Couleurs boutons
  static const Color buttonPrimary = Color.fromARGB(255, 41, 130, 103);
  static const Color buttonSecondary = Color.fromARGB(255, 255, 255, 255);
  static const Color buttonDelete = Color(0xFFFE0000);
}
