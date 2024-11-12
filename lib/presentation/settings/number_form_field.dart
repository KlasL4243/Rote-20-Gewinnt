import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormField extends StatelessWidget {
  const NumberFormField({
    super.key,
    required this.onSaved,
    this.initialValue,
    this.validator,
    this.inputFormatters,
  });

  final String? initialValue;
  final void Function(String?) onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      onSaved: onSaved,
      validator: (String? value) {
        if (value == null || value.isEmpty)
          return "Bitte geben sie eine Zahl ein";
        if (value == "-") return "Keine valide Zahl";
        if (validator == null) return null;
        return validator!(value);
      },
    );
  }
}
