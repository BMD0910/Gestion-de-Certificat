import 'package:flutter/material.dart';




import '../../constants/app_colors.dart';



class ChampMdp extends StatefulWidget {

  final TextEditingController controller;
  final Color borderColor;

  const ChampMdp({
    super.key,
    required this.controller,
    this.borderColor = AppColors.primary,
  });

  @override
  State<ChampMdp> createState() => _ChampMdpState();
}

class _ChampMdpState extends State<ChampMdp> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: "Mot de passe",
        hintText: "Entrez votre mot de passe",
        prefixIcon: Icon(Icons.lock, color: widget.borderColor),

        // Icône œil pour afficher/cacher
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: widget.borderColor,
          ),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor, width: 2),
          borderRadius: BorderRadius.circular(7),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: AppColors.buttonDelete, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: AppColors.buttonDelete, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le mot de passe est obligatoire';
        } else if (value.length < 6) {
          return 'Minimum 6 caractères';
        }
        return null;
      },
    );
  }
}
