import 'package:flutter/material.dart';
import 'package:gestioncertificat/models/certificat_model.dart';
import 'package:gestioncertificat/services/certificat_service.dart';

import 'package:gestioncertificat/widgets/appbar3.dart';
import 'package:gestioncertificat/widgets/card2_certif_Admin.dart';

import '../../constants/app_colors.dart';

class PageGestionCertificat extends StatefulWidget {
  const PageGestionCertificat({super.key});

  @override
  State<PageGestionCertificat> createState() => _PageGestionCertificatState();
}

class _PageGestionCertificatState extends State<PageGestionCertificat> {
  int indexPageCourant = 0;

  late Future<List<CertificatModel>> certificatFuture;

  @override
  void initState() {
    super.initState();
    certificatFuture = CertificatService.getCertificatsEnAttente();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,

      //
      appBar: MyAppbar2(nomPage: "Certificat"),

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
                    "Demandes en attentes",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0),
                    child: Column(
                      children: [
                        FutureBuilder<List<CertificatModel>>(
                          future: certificatFuture,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return const Center(
                                child: Text("Aucun certificat trouvé"),
                              );
                            } else {
                              final certificats = snapshot.data!;

                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: certificats.length,
                                itemBuilder: (context, index) {
                                  final certificat = certificats[index];
                                  return Card2CertifAdmin(
                                    date:
                                        "${certificat.datecreation.day}-${certificat.datecreation.month}-${certificat.datecreation.year} ${certificat.datecreation.hour}:${certificat.datecreation.minute}",
                                    id: certificat.id,
                                    nom: certificat.nom,
                                    email: certificat.email,
                                    nci: certificat.nci,
                                    validite: certificat.validite,

                                    numvilla: certificat.villa,
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
