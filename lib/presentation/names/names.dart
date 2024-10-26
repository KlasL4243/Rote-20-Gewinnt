import 'dart:developer';

import 'package:flutter/material.dart';

const textScaler = TextScaler.linear(2);

class Names extends StatelessWidget {
  const Names({super.key});

  static int itemcount = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Namen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => log("fab pressed"),
        child: const Icon(Icons.check),
      ),
      body: ListView.builder(
        itemCount: itemcount,
        itemBuilder: (context, index) {
          return MediaQuery(
            data: const MediaQueryData(textScaler: textScaler),
            child: Card(
              color: Colors.lightBlue[100],
              margin: const EdgeInsets.all(5),
              child: TextFormField(
                textInputAction: index == itemcount - 1
                    ? TextInputAction.done
                    : TextInputAction.next,
              ),
            ),
          );
        },
      ),
    );
  }
}
