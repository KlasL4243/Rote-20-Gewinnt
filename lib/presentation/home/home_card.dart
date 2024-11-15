import 'package:flutter/material.dart';

const textScaler = TextScaler.linear(2);

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        elevation: 8,
        color: onTap != null ? Colors.lightBlue : Colors.grey,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(text, textScaler: textScaler),
          ),
        ),
      ),
    );
  }
}
