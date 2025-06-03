import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String?> uploadToGofile(Uint8List fileBytes) async {
  final request = http.MultipartRequest(
    'POST',
    Uri.parse('https://store1.gofile.io/uploadFile'),
  );

  request.files.add(
    http.MultipartFile.fromBytes('file', fileBytes, filename: 'certificat.pdf'),
  );

  try {
    final response = await request.send();
    final body = await response.stream.bytesToString();
    final data = jsonDecode(body);

    if (data['status'] == 'ok') {
      final link = data['data']['downloadPage'];
      print("✅ Lien Gofile.io : $link");
      return link;
    } else {
      print("❌ Upload échoué : ${data['message']}");
      return null;
    }
  } catch (e) {
    print("❌ Erreur : $e");
    return null;
  }
}
