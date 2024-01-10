import 'package:flutter/material.dart';

class StyleNameTag extends StatelessWidget {
  final ValueNotifier<String> styleName;

  const StyleNameTag({
    super.key,
    required this.styleName,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: styleName,
        builder: (context, image, child) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Text(
                styleName.value,
                style: const TextStyle(
                  letterSpacing: 0.8,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
