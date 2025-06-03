import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestioncertificat/firebase_options.dart';
import 'package:gestioncertificat/page/page_acceuil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iCertif',
      debugShowCheckedModeBanner: false,
      home: const PageAcceuil(),
    );
  }
}
