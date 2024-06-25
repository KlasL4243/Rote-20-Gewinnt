import 'dart:developer';

import 'package:flutter/material.dart';

const TextScaler textScaler = TextScaler.linear(2);

class HomeCard extends StatelessWidget {
  const HomeCard({
    required this.text,
    super.key,
  });

  final String text;
  void onTap() => log('Pressed: $text');

  @override
  Widget build(final BuildContext context) {
    return Flexible(
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              textScaler: textScaler,
            ),
          ),
        ),
      ),
    );
  }
}
