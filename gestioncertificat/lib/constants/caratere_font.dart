import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;

Future<pw.Font> loadCustomFont() async {
  final fontData = await rootBundle.load("assets/fonts/Roboto-Regular.ttf");
  return pw.Font.ttf(fontData);
}
