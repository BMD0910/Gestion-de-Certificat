import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestioncertificat/models/certificat_model.dart';
import 'package:gestioncertificat/models/maison_model.dart';

class DashboardService {
  //cette service Récupère le nombre de maison depuis Firestore.
  static Future<int> getMaisons() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('maison').get();

      return snapshot.docs
          .map((doc) => MaisonModel.fromMap(doc.id, doc.data()))
          .toList()
          .length;
    } catch (e, stack) {
      print("Erreur lors du chargement des maisons : $e");
      print(stack);
      return 0;
    }
  }

  //cette service Récupère le nombre d'habitant depuis Firestore.
  static Future<int> getHabitants() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('habitant').get();

      return snapshot.docs
          .map((doc) => MaisonModel.fromMap(doc.id, doc.data()))
          .toList()
          .length;
    } catch (e, stack) {
      print("Erreur lors du chargement des habitants : $e");
      print(stack);
      return 0;
    }
  }

  //cette service Récupère le nombre de quartiers depuis Firestore.
  static Future<int> getQuartiers() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('quartier').get();

      return snapshot.docs
          .map((doc) => MaisonModel.fromMap(doc.id, doc.data()))
          .toList()
          .length;
    } catch (e, stack) {
      print("Erreur lors du chargement des quartiers : $e");
      print(stack);
      return 0;
    }
  }

  //cette service Récupère la liste des certificats depuis Firestore.
  static Future<int> getCertificatsEnAttente() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance
              .collection('certificat')
              .where('validite', isEqualTo: 'en-attente')
              .get();

      return snapshot.docs
          .map((doc) => CertificatModel.fromMap(doc.id, doc.data()))
          .toList()
          .length;
    } catch (e, stack) {
      print("Erreur lors du chargement des certificats : $e");
      print(stack);
      return 0;
    }
  }
}
