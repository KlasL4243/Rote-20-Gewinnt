import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormField extends StatelessWidget {
  const NumberFormField({
    super.key,
    required this.labelText,
    this.initialValue,
    required this.onSaved,
    required this.validator,
  });

  final String labelText;
  final String? initialValue;
  final void Function(String?) onSaved;
  final FormFieldValidator<int> validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      initialValue: initialValue,
      onSaved: onSaved,
      validator: (String? value) {
        if (value == null || value.isEmpty) return "Keine valide Zahl";
        return validator(int.parse(value));
      },
    );
  }
}
