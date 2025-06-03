import 'package:flutter/material.dart';
import 'package:gestioncertificat/models/habitant_model.dart';
import 'package:gestioncertificat/services/habitant_service.dart';

import 'package:gestioncertificat/widgets/appbar3.dart';
import 'package:gestioncertificat/widgets/card1_gestion_habitant.dart';
import 'package:gestioncertificat/widgets/formulaire_ajout_habitant.dart';

import '../../constants/app_colors.dart';

class PageGestionHabitant extends StatefulWidget {
  const PageGestionHabitant({super.key});

  @override
  State<PageGestionHabitant> createState() => _PageGestionHabitantState();
}

class _PageGestionHabitantState extends State<PageGestionHabitant> {
  int indexPageCourant = 0;

  late Future<List<HabitantModel>> habitantFuture;

  @override
  void initState() {
    super.initState();
    habitantFuture = HabitantService.getHabitants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,

      //
      appBar: MyAppbar2(nomPage: "Habitant"),

      //
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ajouter un habitant",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: boutonAjouter(),
                  ),
                  const SizedBox(height: 16),
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
                    "Liste des habitants",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 10),

                  FutureBuilder<List<HabitantModel>>(
                    future: habitantFuture,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("Aucun habitant trouvé"),
                        );
                      } else {
                        final habitants = snapshot.data!;

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: habitants.length,
                          itemBuilder: (context, index) {
                            final habitant = habitants[index];

                            return Card1GestionHabitant(
                              nomHabitant: habitant.nom,
                              nci: habitant.nci,
                              telephone: habitant.telephone,

                              onDelete: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder:
                                      (ctx) => AlertDialog(
                                        backgroundColor: AppColors.background1,
                                        title: Text(
                                          "Supprimer cet habitant ?",
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
                                  await HabitantService.deleteHabitant(
                                    habitant.id,
                                  );
                                  setState(() {
                                    habitantFuture =
                                        HabitantService.getHabitants();
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.background1,
                                      content: Text(
                                        "habitant supprimé avec succès",
                                        style: TextStyle(
                                          color: AppColors.buttonDelete,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              onTap: () {},
                              onEdit: () {
                                TextEditingController nomCtrl =
                                    TextEditingController(text: habitant.nom);
                                TextEditingController nciCtrl =
                                    TextEditingController(text: habitant.nci);
                                TextEditingController telephoneCtrl =
                                    TextEditingController(
                                      text: habitant.telephone,
                                    );
                                TextEditingController emailCtrl =
                                    TextEditingController(text: habitant.email);
                                TextEditingController lieunaissanceCtrl =
                                    TextEditingController(
                                      text: habitant.lieunaissance,
                                    );
                                TextEditingController villaCtrl =
                                    TextEditingController(text: habitant.villa);

                                DateTime? datenaissanceCtrl =
                                    habitant.datenaissance;

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
                                              labelText: "Nom complet",
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
                                            controller: nciCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "NCI",
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
                                            controller: telephoneCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "Téléphone",
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
                                            controller: emailCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "Email",
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
                                            controller: lieunaissanceCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "Lieu de naissance",
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
                                            controller: villaCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "Numéro Villa",
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
                                            controller: nciCtrl,
                                            decoration: const InputDecoration(
                                              labelText: "NCI",
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

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Date de naissance",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  final picked =
                                                      await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            datenaissanceCtrl ??
                                                            DateTime.now(),
                                                        firstDate: DateTime(
                                                          1900,
                                                        ),
                                                        lastDate:
                                                            DateTime.now(),
                                                      );
                                                  if (picked != null) {
                                                    setState(() {
                                                      datenaissanceCtrl =
                                                          picked;
                                                    });
                                                  }
                                                },
                                                child: Text(
                                                  datenaissanceCtrl != null
                                                      ? "${datenaissanceCtrl!.day}/${datenaissanceCtrl!.month}/${datenaissanceCtrl!.year}"
                                                      : "Sélectionner une date",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                            await HabitantService.updateHabitant(
                                              habitant.id,
                                              nomCtrl.text,
                                              nciCtrl.text,
                                              telephoneCtrl.text,
                                              emailCtrl.text,
                                              lieunaissanceCtrl.text,
                                              villaCtrl.text,

                                              datenaissanceCtrl ??
                                                  DateTime.now(),
                                            );
                                            Navigator.pop(ctx);
                                            setState(() {
                                              habitantFuture =
                                                  HabitantService.getHabitants();
                                            });
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                backgroundColor:
                                                    AppColors.background1,
                                                content: Text(
                                                  "Habitant modifié avec succès",
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

  // cette widget crée un formulaire pour ajouter un habitant
  Widget Formulaire() {
    final formKey = GlobalKey<FormState>();
    final nomController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final nciController = TextEditingController();
    final lieuController = TextEditingController();
    final villaController = TextEditingController();

    DateTime? selectedDate;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          champsQuartier(
            nomController: nomController,
            phoneController: phoneController,
            emailController: emailController,
            nciController: nciController,
            lieuController: lieuController,
            villaController: villaController,

            selectedDate: selectedDate,
          ),
          const SizedBox(height: 24),
          boutonEnregistrer(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final newHabitant = HabitantModel(
                  id: '', // L'ID sera généré par Firestore
                  nom: nomController.text.trim(),
                  nci: nciController.text.trim(),
                  email: emailController.text.trim(),
                  telephone: phoneController.text.trim(),
                  lieunaissance: lieuController.text.trim(),
                  villa: villaController.text.trim(),

                  datenaissance: selectedDate ?? DateTime.now(),
                );

                try {
                  await HabitantService.addHabitant(newHabitant);

                  // Réinitialiser les champs
                  nomController.clear();
                  phoneController.clear();
                  emailController.clear();
                  nciController.clear();
                  lieuController.clear();
                  villaController.clear();

                  selectedDate = null;

                  // Recharger les données
                  setState(() {
                    habitantFuture = HabitantService.getHabitants();
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.background1,
                      duration: Duration(seconds: 4),
                      content: Text(
                        "Habitant ajouté avec succès",
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

  // cette widget crée lese champs du formulaire pour ajouter un habitant
  Widget champsQuartier({
    required TextEditingController nomController,
    required TextEditingController phoneController,
    required TextEditingController emailController,
    required TextEditingController nciController,
    required TextEditingController lieuController,
    required TextEditingController villaController,

    required DateTime? selectedDate,
  }) {
    // couleur personnalisée

    return formulaireAjoutHabitant(
      nomController: nomController,
      phoneController: phoneController,
      emailController: emailController,

      nciController: nciController,
      lieuController: lieuController,
      villaController: villaController,

      selectedDate: selectedDate,
      onSelectDate: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime(2000),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          setState(() {
            selectedDate = picked;
          });
        }
      },
      borderColor: const Color(0xFF298267),
    );
  }

  // cette widget crée un bouton pour enregistrer les données du formulaire
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

  // cette widget crée un bouton pour lancer le pop-up d'ajout d'habitant
  Widget boutonAjouter({
    String label = "Ajouter habitant",
    Color color = AppColors.primary,
  }) {
    return SizedBox(
      width: 200,

      child: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return popUpAjouter();
            },
          );
        },

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

  // cette widget crée un pop-up pour ajouter un habitant
  Widget popUpAjouter() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 10,
      backgroundColor: AppColors.background1,
      child: Stack(
        children: [
          // Contenu du dialog
          Container(
            constraints: const BoxConstraints(maxWidth: 400, minHeight: 200),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Ajouter un habitant",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                // Notre Formulaire d'ajout
                Formulaire(),
              ],
            ),
          ),

          //Bouton de fermeture
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close, size: 24, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
