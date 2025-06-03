class QuartierModel {
  final String id;
  final String nom;
  final String description;

  QuartierModel({
    required this.id,
    required this.nom,
    required this.description,
  });

  Map<String, dynamic> toMap() => {'nom': nom, 'description': description};

  factory QuartierModel.fromMap(String id, Map<String, dynamic> data) {
    print("Data reçu de Firestore : ${data.toString()}");

    return QuartierModel(
      id: id,
      nom: data['nom'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
