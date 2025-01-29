import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlacaInput extends StatelessWidget {
  final TextEditingController controller;

  PlacaInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Placa do Carro',
        border: OutlineInputBorder(),
      ),
      style: TextStyle(fontSize: 24),
      textCapitalization: TextCapitalization.characters, // Força maiúsculas
      inputFormatters: [
        UpperCaseTextFormatter(), // Formata o texto para maiúsculas
      ],
    );
  }
}

// Formatter para converter texto em maiúsculas
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
