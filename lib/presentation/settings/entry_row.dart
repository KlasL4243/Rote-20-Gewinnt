import 'package:flutter/material.dart';

const TextScaler textScaler = TextScaler.linear(1.5);

class EntryRow extends StatelessWidget {
  const EntryRow({
    super.key,
    required this.text,
    required this.formField,
  });

  final String text;
  final Widget formField;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Center(
            child: Text(
              text,
              textScaler: textScaler,
            ),
          ),
        ),
        Flexible(
          child: formField,
        )
      ],
    );
  }
}
