import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/main.dart';

void goto(BuildContext context, Routes route) {
  Navigator.of(context).pushNamed(route.route);
}
