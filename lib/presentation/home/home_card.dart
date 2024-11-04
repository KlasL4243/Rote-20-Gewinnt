import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/presentation/home/nothing_here.dart';

const textScaler = TextScaler.linear(2);

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.text,
    this.widget,
  });

  final String text;
  final Widget Function()? widget;

  @override
  Widget build(BuildContext context) {
    void ontap() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return widget == null ? const NothingHere() : widget!();
          },
        ),
      );
    }

    return Flexible(
      child: Card(
        elevation: 8,
        color: widget != null ? Colors.lightBlue : Colors.grey,
        child: InkWell(
          onTap: widget != null ? ontap : null,
          child: Center(
            child: Text(text, textScaler: textScaler),
          ),
        ),
      ),
    );
  }
}
