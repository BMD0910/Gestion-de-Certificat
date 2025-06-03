import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

Future<void> savePdfLocally(Uint8List pdfBytes, String fileName) async {
  final directory = Directory("/storage/emulated/0/Download"); // dossier app
  final filePath = "${directory.path}/$fileName";

  final file = File(filePath);
  await file.writeAsBytes(pdfBytes);

  print("Fichier enregistré ici : ${directory.path} ");
}
