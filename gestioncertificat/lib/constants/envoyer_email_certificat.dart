import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> envoyerEmailCertificat({
  required String nom,
  required String email,
  required String urlPdf,
}) async {
  const serviceId = 'service_yr3sabc';
  const templateId = 'template_emnrwxk';
  const userId = 'Y0AVQJ0VRrfsDjzA9';

  final response = await http.post(
    Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
    headers: {'origin': 'http://localhost', 'Content-Type': 'application/json'},
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': nom,
        'user_email': email,
        'certificat_url': urlPdf,
      },
    }),
  );

  if (response.statusCode == 200) {
    print("E-mail envoyé avec succès !");
  } else {
    print("Échec de l'envoi : ${response.body}");
  }
}
