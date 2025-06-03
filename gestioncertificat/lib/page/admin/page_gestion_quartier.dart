import 'package:flutter/material.dart';
import 'package:gestioncertificat/models/quratier_model.dart';
import 'package:gestioncertificat/services/quartier_service.dart';

import 'package:gestioncertificat/widgets/appbar3.dart';
import 'package:gestioncertificat/widgets/card1_gestion_quartier.dart';

import '../../constants/app_colors.dart';

class PageGestionQuartier extends StatefulWidget {
  const PageGestionQuartier({super.key});

  @override
  State<PageGestionQuartier> createState() => _PageGestionQuartierState();
}

class _PageGestionQuartierState extends State<PageGestionQuartier> {
  int indexPageCourant = 0;

  late Future<List<QuartierModel>> quartierFuture;

  @override
  void initState() {
    super.initState();
    quartierFuture = QuartierService.getQuartiers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,

      //
      appBar: MyAppbar2(nomPage: "Quartier"),

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
                    "Ajouter un quartier",
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
                    "Liste des quartiers",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 10),
                  FutureBuilder<List<QuartierModel>>(
                    future: quartierFuture,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("Aucun quartier trouvé"),
                        );
                      } else {
                        final quartiers = snapshot.data!;

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: quartiers.length,
                          itemBuilder: (context, index) {
                            final quartier = quartiers[index];
                            return Card1GestionQuartier(
                              nomQuratier: quartier.nom,
                              descriptionQuartier: quartier.description,
                              onDelete: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder:
                                      (ctx) => AlertDialog(
                                        backgroundColor: AppColors.background1,
                                        title: Text(
                                          "Supprimer ce quartier ?",
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
                                  await QuartierService.deleteQuartier(
                                    quartier.id,
                                  );
                                  setState(() {
                                    quartierFuture =
                                        QuartierService.getQuartiers();
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.background1,
                                      content: Text(
                                        "Quartier supprimé avec succès",
                                        style: TextStyle(
                                          color: AppColors.buttonDelete,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              onEdit: () {
                                TextEditingController nomCtrl =
                                    TextEditingController(text: quartier.nom);
                                TextEditingController descCtrl =
                                    TextEditingController(
                                      text: quartier.description,
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
                                            controller: nomCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "Nom",
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
                                          const SizedBox(height: 12),
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
                                            await QuartierService.updateQuartier(
                                              quartier.id,
                                              nomCtrl.text,
                                              descCtrl.text,
                                            );
                                            Navigator.pop(ctx);
                                            setState(() {
                                              quartierFuture =
                                                  QuartierService.getQuartiers();
                                            });
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                backgroundColor:
                                                    AppColors.background1,
                                                content: Text(
                                                  "Quartier modifié avec succès",
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
    final nomController = TextEditingController();
    final descController = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          champsQuartier(
            nomController: nomController,
            descController: descController,
          ),
          const SizedBox(height: 24),
          boutonEnregistrer(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final newQuartier = QuartierModel(
                  id: '', // L'ID sera généré par Firestore
                  nom: nomController.text.trim(),
                  description: descController.text.trim(),
                );

                try {
                  await QuartierService.addQuartier(newQuartier);

                  // Réinitialiser les champs
                  nomController.clear();
                  descController.clear();

                  // Recharger les données
                  setState(() {
                    quartierFuture = QuartierService.getQuartiers();
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.background1,
                      duration: Duration(seconds: 4),
                      content: Text(
                        "Quartier ajouté avec succès",
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
    required TextEditingController nomController,
    required TextEditingController descController,
  }) {
    const Color borderColor = AppColors.primary; // couleur personnalisée

    return Column(
      children: [
        // Champ NOM
        TextFormField(
          controller: nomController,
          decoration: InputDecoration(
            labelText: "Nom",
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
              return 'Le nom est obligatoire';
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
