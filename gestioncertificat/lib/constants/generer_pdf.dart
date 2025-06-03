import 'package:flutter/services.dart' show rootBundle, Uint8List;
import 'package:gestioncertificat/constants/caratere_font.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

Future<Uint8List> generateCertificatPDF({
  required String nomComplet,
  required String quartier,
  required String numeroMaison,
  required String date,
  required String nomSignataire,
}) async {
  final pdf = pw.Document();

  // Charger les images
  final cachetImage = pw.MemoryImage(
    (await rootBundle.load('assets/cachet.png')).buffer.asUint8List(),
  );
  final signatureImage = pw.MemoryImage(
    (await rootBundle.load('assets/signature.jpg')).buffer.asUint8List(),
  );

  final font = await loadCustomFont();

  pdf.addPage(
    pw.Page(
      build:
          (pw.Context context) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                  "RÉPUBLIQUE DU SÉNÉGAL\nUn Peuple - Un But - Une Foi",
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.SizedBox(height: 8),
              pw.Center(
                child: pw.Text(
                  "COMMUNE D’ARRONDISSEMENT DE $quartier)",
                  style: pw.TextStyle(fontSize: 12, font: font),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.SizedBox(height: 12),
              pw.Center(
                child: pw.Text(
                  "CERTIFICAT DE DOMICILE",
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                "Je soussigné, $nomSignataire, déclare que :",
                style: pw.TextStyle(font: font),
              ),
              pw.SizedBox(height: 8),
              pw.Text("Mr/Mme : $nomComplet", style: pw.TextStyle(font: font)),
              pw.Text(
                "Demeurant à : Maison n°$numeroMaison, quartier $quartier",
                style: pw.TextStyle(font: font),
              ),
              pw.SizedBox(height: 12),
              pw.Text(
                "Est bien domicilié à l'adresse susmentionnée.",
                style: pw.TextStyle(font: font),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                "Ce certificat est délivré pour servir et valoir ce que de droit.",
                style: pw.TextStyle(font: font),
              ),
              pw.SizedBox(height: 30),

              // Row avec cachet et signature
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    children: [
                      pw.Text("Cachet", style: pw.TextStyle(font: font)),
                      pw.SizedBox(height: 5),
                      pw.Image(cachetImage, width: 90),
                    ],
                  ),
                  pw.Column(
                    children: [
                      pw.Text(
                        "Fait à Dakar, le $date",
                        style: pw.TextStyle(font: font),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Image(signatureImage, width: 80),
                      pw.Text(
                        "Le signataire : $nomSignataire",
                        style: pw.TextStyle(fontSize: 10, font: font),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
    ),
  );

  return pdf.save();
}
