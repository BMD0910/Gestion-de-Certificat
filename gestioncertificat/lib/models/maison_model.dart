class MaisonModel {
  final String id;
  final String numero;
  final String quartier;
  final String proprietaire;
  final String description;

  MaisonModel({
    required this.id,
    required this.numero,
    required this.quartier,
    required this.proprietaire,
    required this.description,
  });

  Map<String, dynamic> toMap() => {
    'numero': numero,
    'quartier': quartier,
    'proprietaire': proprietaire,
    'description': description,
  };

  factory MaisonModel.fromMap(String id, Map<String, dynamic> data) {
    print("Data reçu de Firestore : ${data.toString()}");

    return MaisonModel(
      id: id,
      numero: data['numero'] ?? '',
      quartier: data['quartier'] ?? '',
      proprietaire: data['proprietaire'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
