import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String label;
  const TextDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.white30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label),
        ),
        Expanded(
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.white30,
          ),
        ),
      ],
    );
  }
}
