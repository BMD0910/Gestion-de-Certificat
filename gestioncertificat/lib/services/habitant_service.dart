import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestioncertificat/models/habitant_model.dart';

class HabitantService {
  static final habitantCollection = FirebaseFirestore.instance.collection(
    'habitant',
  );

  //cette service Récupère la liste des maisons depuis Firestore.
  static Future<List<HabitantModel>> getHabitants() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('habitant').get();

      return snapshot.docs
          .map((doc) => HabitantModel.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e, stack) {
      print("Erreur lors du chargement des habitants : $e");
      print(stack);
      return [];
    }
  }

  //cette service Ajoute un nouveau maison à Firestore.
  static Future<void> addHabitant(HabitantModel habitant) async {
    try {
      await habitantCollection.add(habitant.toMap());
      print("maison ajouté avec succès !");
    } catch (e) {
      print("Erreur lors de l'ajout du maison : $e");
      rethrow;
    }
  }

  //cette service Supprime un maison de Firestore en utilisant son ID.
  static Future<void> deleteHabitant(String id) async {
    try {
      await habitantCollection.doc(id).delete();
      print("habitant supprimé avec succès !");
    } catch (e) {
      print("Erreur lors de la suppression du habitant : $e");
      rethrow;
    }
  }

  //cette service Met à jour un maison existant dans Firestore.
  static Future<void> updateHabitant(
    String id,
    String nom,
    String nci,
    String telephone,
    String email,
    String lieunaissance,
    String villa,
    DateTime datenaissance,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('habitant').doc(id).update({
        'nom': nom,
        'nci': nci,
        'telephone': telephone,
        'email': email,
        'lieunaissance': lieunaissance,
        'villa': villa,
        'datenaissance': datenaissance.toIso8601String(),
      });
    } catch (e) {
      throw Exception("Erreur lors de la mise à jour du habitant : $e");
    }
  }
}
