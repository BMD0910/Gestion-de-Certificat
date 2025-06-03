import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestioncertificat/models/quratier_model.dart';

class QuartierService {
  static final quartierCollection = FirebaseFirestore.instance.collection(
    'quartier',
  );

  //cette service Récupère la liste des quartiers depuis Firestore.
  static Future<List<QuartierModel>> getQuartiers() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('quartier').get();

      return snapshot.docs
          .map((doc) => QuartierModel.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e, stack) {
      print("Erreur lors du chargement des quartiers : $e");
      print(stack);
      return [];
    }
  }

  //cette service Ajoute un nouveau quartier à Firestore.
  static Future<void> addQuartier(QuartierModel quartier) async {
    try {
      await quartierCollection.add(quartier.toMap());
      print("Quartier ajouté avec succès !");
    } catch (e) {
      print("Erreur lors de l'ajout du quartier : $e");
      rethrow;
    }
  }

  //cette service Supprime un quartier de Firestore en utilisant son ID.
  static Future<void> deleteQuartier(String id) async {
    try {
      await quartierCollection.doc(id).delete();
      print("Quartier supprimé avec succès !");
    } catch (e) {
      print("Erreur lors de la suppression du quartier : $e");
      rethrow;
    }
  }

  //cette service Met à jour un quartier existant dans Firestore.
  static Future<void> updateQuartier(
    String id,
    String nom,
    String description,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('quartier').doc(id).update({
        'nom': nom,
        'description': description,
      });
    } catch (e) {
      throw Exception("Erreur lors de la mise à jour du quartier : $e");
    }
  }
}
