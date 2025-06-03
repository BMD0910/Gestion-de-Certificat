import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestioncertificat/models/certificat_model.dart';

class CertificatService {
  static final CertificatCollection = FirebaseFirestore.instance.collection(
    'certificat',
  );

  //cette service Récupère la liste des certificats depuis Firestore.
  static Future<List<CertificatModel>> getCertificats() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('certificat').get();

      return snapshot.docs
          .map((doc) => CertificatModel.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e, stack) {
      print("Erreur lors du chargement des certificats : $e");
      print(stack);
      return [];
    }
  }

  //cette service Récupère la liste des certificats depuis Firestore.
  static Future<List<CertificatModel>> getCertificatsEnAttente() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance
              .collection('certificat')
              .where('validite', isEqualTo: 'en-attente')
              .get();

      return snapshot.docs
          .map((doc) => CertificatModel.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e, stack) {
      print("Erreur lors du chargement des certificats : $e");
      print(stack);
      return [];
    }
  }

  // Service pour mettre à jour la validité d'un certificat en valide et ajouter une valeur à un champ "lien"
  static Future<void> validerCertificat(String id, String lien) async {
    try {
      await CertificatCollection.doc(
        id,
      ).update({'validite': 'valide', 'lien': lien});
      print("Certificat validé et lien ajouté avec succès !");
    } catch (e) {
      print("Erreur lors de la validation du certificat : $e");
      rethrow;
    }
  }

  // Service pour rejeter un certificat (mettre à jour la validité en rejete)
  static Future<void> rejeterCertificat(String id) async {
    try {
      await CertificatCollection.doc(id).update({'validite': 'rejete'});
      print("Certificat rejeté avec succès !");
    } catch (e) {
      print("Erreur lors du rejet du certificat : $e");
      rethrow;
    }
  }

  //

  // Service pour récupérer la liste des certificats avec une validité "en-attente"
  // static Future<List<CertificatModel>> getCertificatsEnAttente() async {
  //   try {
  //     final snapshot = await CertificatCollection
  //         .where('validite', isEqualTo: 'en-attente')
  //         .get();

  //     return snapshot.docs
  //         .map((doc) => CertificatModel.fromMap(doc.id, doc.data()))
  //         .toList();
  //   } catch (e, stack) {
  //     print("Erreur lors du chargement des certificats en attente : $e");
  //     print(stack);
  //     return [];
  //   }
  // }

  //cette service Supprime un maison de Firestore en utilisant son ID.
  static Future<void> deleteCertificat(String id) async {
    try {
      await CertificatCollection.doc(id).delete();
      print("Certificat supprimé avec succès !");
    } catch (e) {
      print("Erreur lors de la suppression du Certificat : $e");
      rethrow;
    }
  }

  //cette service Met à jour un maison existant dans Firestore.
  static Future<void> updateCertificat(
    String id,
    String nom,
    String nci,
    String validite,
    String email,
    String lieunaissance,
    String villa,
    DateTime datenaissance,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('Certificat').doc(id).update({
        'nom': nom,
        'nci': nci,
        'validite': validite,
        'email': email,
        'lieunaissance': lieunaissance,
        'villa': villa,
        'datenaissance': datenaissance.toIso8601String(),
      });
    } catch (e) {
      throw Exception("Erreur lors de la mise à jour du Certificat : $e");
    }
  }
}
