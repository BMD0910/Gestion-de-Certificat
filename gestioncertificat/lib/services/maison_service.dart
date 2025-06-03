import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestioncertificat/models/maison_model.dart';

class MaisonService {
  static final maisonCollection = FirebaseFirestore.instance.collection(
    'maison',
  );

  //cette service Récupère la liste des maisons depuis Firestore.
  static Future<List<MaisonModel>> getMaisons() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('maison').get();

      return snapshot.docs
          .map((doc) => MaisonModel.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e, stack) {
      print("Erreur lors du chargement des maisons : $e");
      print(stack);
      return [];
    }
  }

  //cette service Ajoute un nouveau maison à Firestore.
  static Future<void> addMaison(MaisonModel maison) async {
    try {
      await maisonCollection.add(maison.toMap());
      print("maison ajouté avec succès !");
    } catch (e) {
      print("Erreur lors de l'ajout du maison : $e");
      rethrow;
    }
  }

  //cette service Supprime un maison de Firestore en utilisant son ID.
  static Future<void> deleteMaison(String id) async {
    try {
      await maisonCollection.doc(id).delete();
      print("maison supprimé avec succès !");
    } catch (e) {
      print("Erreur lors de la suppression du maison : $e");
      rethrow;
    }
  }

  //cette service Met à jour un maison existant dans Firestore.
  static Future<void> updateMaison(
    String id,
    String numero,
    String quartier,
    String proprietaire,
    String description,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('maison').doc(id).update({
        'numero': numero,
        'quartier': quartier,
        'proprietaire': proprietaire,
        'description': description,
      });
    } catch (e) {
      throw Exception("Erreur lors de la mise à jour du maison : $e");
    }
  }
}
