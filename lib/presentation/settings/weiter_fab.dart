import 'package:flutter/material.dart';

class WeiterFab extends StatelessWidget {
  const WeiterFab({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: Colors.lightBlue,
      label: const Text("Weiter"),
      icon: const Icon(Icons.arrow_forward),
    );
  }
}
