import 'package:flutter/material.dart';

const textScaler = TextScaler.linear(2);

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.text,
    required this.widget,
  });

  final String text;
  final Widget Function() widget;

  @override
  Widget build(BuildContext context) {
    void ontap() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return widget();
          },
        ),
      );
    }

    return Flexible(
      child: Card(
        elevation: 8,
        color: Colors.lightBlue,
        child: InkWell(
          onTap: ontap,
          child: Center(
            child: Text(text, textScaler: textScaler),
          ),
        ),
      ),
    );
  }
}
