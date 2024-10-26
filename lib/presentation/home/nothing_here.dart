import 'package:flutter/material.dart';

class NothingHere extends StatelessWidget {
  const NothingHere({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Noch nicht Fertig"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Noch nicht Fertig"),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Zurück"),
            ),
          ],
        ),
      ),
    );
  }
}
