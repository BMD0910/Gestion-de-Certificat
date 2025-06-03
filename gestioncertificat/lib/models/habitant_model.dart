import 'package:cloud_firestore/cloud_firestore.dart';

class HabitantModel {
  final String id;
  final String nom;
  final String nci;
  final String telephone;
  final String email;
  final String lieunaissance;
  final String villa;
  final String mdp;
  final DateTime datenaissance;

  HabitantModel({
    required this.id,
    required this.nom,
    required this.nci,
    required this.telephone,
    required this.email,
    required this.lieunaissance,
    required this.villa,
    this.mdp = '',
    required this.datenaissance,
  });

  Map<String, dynamic> toMap() => {
    'nom': nom,
    'nci': nci,
    'telephone': telephone,
    'email': email,
    'lieunaissance': lieunaissance,
    'villa': villa,
    'datenaissance': datenaissance.toIso8601String(),
  };

  factory HabitantModel.fromMap(String id, Map<String, dynamic> data) {
    print("Data reçu de Firestore : ${data.toString()}");

    return HabitantModel(
      id: id,
      nom: data['nom'] ?? '',
      nci: data['nci'] ?? '',
      telephone: data['telephone'] ?? '',
      email: data['email'] ?? '',
      lieunaissance: data['lieunaissance'] ?? '',
      villa: data['villa'] ?? '',
      datenaissance:
          data['datenaissance'] != null
              ? (data['datenaissance'] is String
                  ? DateTime.parse(data['datenaissance'])
                  : (data['datenaissance'] is DateTime
                      ? data['datenaissance']
                      : (data['datenaissance'] is Timestamp
                          ? (data['datenaissance'] as Timestamp).toDate()
                          : DateTime.now())))
              : DateTime.now(),
    );
  }
}
