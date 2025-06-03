import 'package:flutter/material.dart';
import 'package:gestioncertificat/constants/envoyer_email_certificat.dart';
import 'package:gestioncertificat/constants/generer_pdf.dart';

import 'package:gestioncertificat/constants/upload_pdf.dart';
import 'package:gestioncertificat/page/admin/page_gestion_certificat.dart';
import 'package:gestioncertificat/services/certificat_service.dart';

import '../constants/app_colors.dart';

class Card2CertifAdmin extends StatelessWidget {
  final String id;
  final String date;
  final String nom;
  final String email;

  final String nci;
  final String validite;

  final String numvilla;
  final VoidCallback? onTap;

  const Card2CertifAdmin({
    super.key,
    required this.id,
    required this.date,
    required this.nom,
    required this.email,

    required this.nci,
    required this.validite,

    required this.numvilla,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        color: const Color.fromARGB(255, 200, 243, 204),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),

        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 16,
            right: 16,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),

              Text(
                "Nom : $nom",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                "NCI : $nci",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                "Validité : $validite",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                "N° Villa : $numvilla",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  boutonCrad(
                    context,
                    label: "Valider",
                    onTap: () async {
                      final pdf = await generateCertificatPDF(
                        nomComplet: nom,
                        quartier: "lieunaissance",
                        numeroMaison: "772",
                        date: "29/05/2025",
                        nomSignataire: "SamaCertif",
                      );

                      print("PDF généré avec succès !");

                      final url = await uploadToGofile(pdf);

                      if (url == null) {
                        print("Lien d’upload est NULL. L’upload a échoué.");
                      }

                      print("URL de l'upload : $url");

                      if (url != null) {
                        await envoyerEmailCertificat(
                          nom: nom,
                          email: email,
                          urlPdf: url,
                        );

                        await CertificatService.validerCertificat(id, url);

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PageGestionCertificat(),
                          ),
                          (route) => false,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.miniBackground,
                            content: Text(
                              'Certificat validé avec succès',
                              style: TextStyle(color: AppColors.textPrimary),
                            ),
                          ),
                        );
                      }
                    },
                    color: AppColors.buttonPrimary,
                  ),
                  SizedBox(width: 10),
                  boutonCrad(
                    context,
                    label: "Rejeter",
                    onTap: () {
                      CertificatService.rejeterCertificat(id)
                          .then((_) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PageGestionCertificat(),
                              ),
                              (route) => false,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.miniBackground,
                                content: Text(
                                  'Certificat rejeté avec succès',
                                  style: TextStyle(
                                    color: AppColors.buttonDelete,
                                  ),
                                ),
                              ),
                            );
                          })
                          .catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.background2,
                                content: Text(
                                  'Erreur lors du rejet du certificat',
                                ),
                              ),
                            );
                          });
                    },
                    color: AppColors.buttonDelete,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget boutonCrad(
    BuildContext context, {
    required String label,

    required VoidCallback onTap,
    required Color color,
  }) {
    return OutlinedButton.icon(
      onPressed: onTap,
      label: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
    );
  }
}
