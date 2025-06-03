import 'package:cloud_firestore/cloud_firestore.dart';

class CertificatModel {
  final String id;
  final String nom;
  final String nci;
  final String validite;
  final String email;
  // final String lieunaissance;
  final String villa;
  // final String mdp;
  final DateTime datecreation;

  CertificatModel({
    required this.id,
    required this.nom,
    required this.nci,
    required this.validite,
    required this.email,
    // required this.lieunaissance,
    required this.villa,
    // this.mdp = '',
    required this.datecreation,
  });

  Map<String, dynamic> toMap() => {
    'nom': nom,
    'nci': nci,
    'validite': validite,
    'email': email,
    // 'lieunaissance': lieunaissance,
    'villa': villa,
    'datecreation': datecreation.toIso8601String(),
  };

  factory CertificatModel.fromMap(String id, Map<String, dynamic> data) {
    print("Data reçu de Firestore : ${data.toString()}");

    return CertificatModel(
      id: id,
      nom: data['nom'] ?? '',
      nci: data['nci'] ?? '',
      validite: data['validite'] ?? '',
      email: data['email'] ?? '',
      // lieunaissance: data['lieunaissance'] ?? '',
      villa: data['villa'] ?? '',
      datecreation:
          data['datecreation'] != null
              ? (data['datecreation'] is String
                  ? DateTime.parse(data['datecreation'])
                  : (data['datecreation'] is DateTime
                      ? data['datecreation']
                      : (data['datecreation'] is Timestamp
                          ? (data['datecreation'] as Timestamp).toDate()
                          : DateTime.now())))
              : DateTime.now(),
    );
  }
}
