import 'package:flutter/material.dart';

class StyleItem extends StatelessWidget {
  final double itemSize;
  final String imageUrl;
  final VoidCallback? onStyleSelected;

  const StyleItem({
    super.key,
    required this.itemSize,
    required this.imageUrl,
    this.onStyleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onStyleSelected,
      child: SizedBox(
        width: itemSize,
        height: itemSize,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
