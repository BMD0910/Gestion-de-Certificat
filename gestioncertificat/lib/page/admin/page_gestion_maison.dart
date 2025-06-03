import 'package:flutter/material.dart';
import 'package:gestioncertificat/models/maison_model.dart';
import 'package:gestioncertificat/services/maison_service.dart';

import 'package:gestioncertificat/widgets/appbar3.dart';
import 'package:gestioncertificat/widgets/card1_gestion_maison.dart';

import '../../constants/app_colors.dart';

class PageGestionMaison extends StatefulWidget {
  const PageGestionMaison({super.key});

  @override
  State<PageGestionMaison> createState() => _PageGestionMaisonState();
}

class _PageGestionMaisonState extends State<PageGestionMaison> {
  int indexPageCourant = 0;

  late Future<List<MaisonModel>> maisonFuture;

  @override
  void initState() {
    super.initState();
    maisonFuture = MaisonService.getMaisons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,

      //
      appBar: MyAppbar2(nomPage: "Maison"),

      //
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ajouter une maison",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Formulaire(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Container(
              alignment: Alignment.center,

              // height: 800,
              padding: const EdgeInsets.all(10),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 200, 243, 204),
              ),

              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Liste des maisons",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 10),

                  FutureBuilder<List<MaisonModel>>(
                    future: maisonFuture,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text("Aucun maison trouvé"));
                      } else {
                        final maisons = snapshot.data!;

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: maisons.length,
                          itemBuilder: (context, index) {
                            final maison = maisons[index];
                            return Card1GestionMaison(
                              numMaison: maison.numero,
                              nomQuratier: maison.quartier,
                              descriptionQuartier: maison.description,
                              onDelete: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder:
                                      (ctx) => AlertDialog(
                                        backgroundColor: AppColors.background1,
                                        title: Text(
                                          "Supprimer ce maison ?",
                                          style: TextStyle(
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        content: Text(
                                          "Cette action est irréversible.",
                                          style: TextStyle(
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed:
                                                () => Navigator.pop(ctx, false),
                                            child: Text(
                                              "Annuler",
                                              style: TextStyle(
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed:
                                                () => Navigator.pop(ctx, true),
                                            child: Text(
                                              "Supprimer",
                                              style: TextStyle(
                                                color: AppColors.buttonDelete,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                );

                                if (confirm == true) {
                                  await MaisonService.deleteMaison(maison.id);
                                  setState(() {
                                    maisonFuture = MaisonService.getMaisons();
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.background1,
                                      content: Text(
                                        "Maison supprimé avec succès",
                                        style: TextStyle(
                                          color: AppColors.buttonDelete,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              onEdit: () {
                                TextEditingController numCtrl =
                                    TextEditingController(text: maison.numero);
                                TextEditingController quartierCtrl =
                                    TextEditingController(
                                      text: maison.quartier,
                                    );
                                TextEditingController proprietaireCtrl =
                                    TextEditingController(
                                      text: maison.proprietaire,
                                    );
                                TextEditingController descCtrl =
                                    TextEditingController(
                                      text: maison.description,
                                    );

                                showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      backgroundColor: AppColors.background1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      title: const Text(
                                        "Modifier le quartier",
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: numCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "Numéro de la maison",
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 22),
                                          TextField(
                                            controller: quartierCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "Nom du quartier",
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 22),
                                          TextField(
                                            controller: proprietaireCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "NCI du propriétaire",
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 22),
                                          TextField(
                                            controller: descCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "Description",
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(ctx),
                                          child: const Text("Annuler"),
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                AppColors.buttonDelete,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            await MaisonService.updateMaison(
                                              maison.id,
                                              numCtrl.text,
                                              quartierCtrl.text,
                                              proprietaireCtrl.text,
                                              descCtrl.text,
                                            );
                                            Navigator.pop(ctx);
                                            setState(() {
                                              maisonFuture =
                                                  MaisonService.getMaisons();
                                            });
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                backgroundColor:
                                                    AppColors.background1,
                                                content: Text(
                                                  "Maison modifié avec succès",
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.textPrimary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text("Enregistrer"),
                                          style: TextButton.styleFrom(
                                            foregroundColor: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                  ),

                  SizedBox(height: 15),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Formulaire() {
    final formKey = GlobalKey<FormState>();
    final numController = TextEditingController();
    final quartierController = TextEditingController();
    final propietaireController = TextEditingController();
    final descController = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          champsQuartier(
            numController: numController,
            quartierController: quartierController,
            propietaireController: propietaireController,
            descController: descController,
          ),
          const SizedBox(height: 24),
          boutonEnregistrer(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final newMaison = MaisonModel(
                  id: '', // L'ID sera généré par Firestore
                  numero: numController.text.trim(),
                  quartier: quartierController.text.trim(),
                  proprietaire: propietaireController.text.trim(),
                  description: descController.text.trim(),
                );

                try {
                  await MaisonService.addMaison(newMaison);

                  // Réinitialiser les champs
                  numController.clear();
                  quartierController.clear();
                  propietaireController.clear();
                  descController.clear();

                  // Recharger les données
                  setState(() {
                    maisonFuture = MaisonService.getMaisons();
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.background1,
                      duration: Duration(seconds: 4),
                      content: Text(
                        "Maison ajouté avec succès",
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.background1,
                      content: Text(
                        "Erreur lors de l'ajout : $e",
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget champsQuartier({
    required TextEditingController numController,
    required TextEditingController quartierController,
    required TextEditingController propietaireController,
    required TextEditingController descController,
  }) {
    const Color borderColor = AppColors.primary; // couleur personnalisée

    return Column(
      children: [
        // Champ NOM
        TextFormField(
          controller: numController,
          decoration: InputDecoration(
            labelText: "Numéro de la maison",
            hintText: "Ex : 772",

            // bordure normale
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand c'est focus (sélectionné)
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand une erreur est présente
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: AppColors.buttonDelete,
                width: 1.5,
              ),
            ),

            // bordure quand focus ET erreur
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: AppColors.buttonDelete,
                width: 2,
              ),
            ),

            prefixIcon: const Icon(Icons.home, color: borderColor),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Le numéro du maison est obligatoire';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        TextFormField(
          controller: quartierController,
          decoration: InputDecoration(
            labelText: "Nom du Quartier",
            hintText: "Ex : Quartier Darou Salam",

            // bordure normale
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand c'est focus (sélectionné)
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand une erreur est présente
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: AppColors.buttonDelete,
                width: 1.5,
              ),
            ),

            // bordure quand focus ET erreur
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: AppColors.buttonDelete,
                width: 2,
              ),
            ),

            prefixIcon: const Icon(Icons.location_on, color: borderColor),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Le nom du quartier est obligatoire';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        TextFormField(
          controller: propietaireController,
          decoration: InputDecoration(
            labelText: "NCI du Propriétaire",
            hintText: "Ex : 1056540522809",

            // bordure normale
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand c'est focus (sélectionné)
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand une erreur est présente
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: AppColors.buttonDelete,
                width: 1.5,
              ),
            ),

            // bordure quand focus ET erreur
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: AppColors.buttonDelete,
                width: 2,
              ),
            ),

            prefixIcon: const Icon(Icons.person, color: borderColor),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Le NCI du propriétaire est obligatoire';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Champ DESCRIPTION
        TextFormField(
          controller: descController,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: "Description",
            hintText: "Décrivez cet élément...",

            // bordure normale
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand c'est focus (sélectionné)
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(7),
            ),

            // bordure quand une erreur est présente
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: AppColors.buttonDelete,
                width: 1.5,
              ),
            ),

            // bordure quand focus ET erreur
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: AppColors.buttonDelete,
                width: 2,
              ),
            ),

            prefixIcon: const Icon(Icons.edit_note, color: borderColor),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'La description est obligatoire';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget boutonEnregistrer({
    required VoidCallback onPressed,
    String label = "Enregistrer",
    Color color = AppColors.primary,
  }) {
    return SizedBox(
      width: 200,

      child: ElevatedButton.icon(
        onPressed: onPressed,

        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textTertiary,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
      ),
    );
  }
}
