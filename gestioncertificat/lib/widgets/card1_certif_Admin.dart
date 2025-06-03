import 'package:flutter/material.dart';
import 'package:gestioncertificat/constants/envoyer_email_certificat.dart';
import 'package:gestioncertificat/constants/generer_pdf.dart';
import 'package:gestioncertificat/constants/upload_pdf.dart';
import 'package:gestioncertificat/page/admin/page_dashboard.dart';
import 'package:gestioncertificat/services/certificat_service.dart';
import '../constants/app_colors.dart';

class Card1CertifAdmin extends StatelessWidget {
  final String id;
  final String nom;
  final String email;
  final String nci;
  final String datecreation;

  const Card1CertifAdmin({
    super.key,
    required this.id,
    required this.nom,
    required this.email,
    required this.nci,
    required this.datecreation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(38, 0, 0, 0).withValues(),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    7,
                  ), // si tu veux aussi arrondir l’image
                  child: Image.asset('assets/images/quartier.png', height: 70),
                ),
              ),

              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nom,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      nci,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      datecreation,
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                    SizedBox(height: 10),
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
                              print(
                                "Lien d’upload est NULL. L’upload a échoué.",
                              );
                            }

                            print("URL de l'upload : $url");

                            if (url != null) {
                              await envoyerEmailCertificat(
                                nom: nom,
                                email: email,
                                urlPdf: url,
                              );

                              await CertificatService.validerCertificat(
                                id,
                                url,
                              );

                              // Recharger les données en revenant à la page dashboard et en supprimant toutes les routes précédentes
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PageDashboard(),
                                ),
                                (route) => false,
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.miniBackground,
                                  content: Text(
                                    'Certificat validé avec succès',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                    ),
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
                                      builder: (_) => PageDashboard(),
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
