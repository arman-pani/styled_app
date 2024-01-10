import 'package:flutter/material.dart';

class SelectionRing extends StatelessWidget {
  final double itemSize;
  final EdgeInsets padding;
  const SelectionRing({
    super.key,
    required this.itemSize,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Padding(
        padding: padding,
        child: SizedBox(
          width: itemSize,
          height: itemSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              border: const Border.fromBorderSide(
                BorderSide(width: 3.5, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
