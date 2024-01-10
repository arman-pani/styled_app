import 'package:flutter/material.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/delete_alert_dialog.dart';

class StylePageMainBar extends StatelessWidget {
  final VoidCallback generateButtonOnTap;
  const StylePageMainBar({super.key, required this.generateButtonOnTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      // Edit Button
      IconButton(
        onPressed: () {
          // goes to edit screen
        },
        icon: const Icon(Icons.brush_outlined),
        iconSize: 45,
      ),

      //Generate Styled Image Button
      IconButton(
        onPressed: generateButtonOnTap,
        icon: const Icon(Icons.play_circle_outline_rounded),
        iconSize: 85,
      ),

      // Delete Button
      IconButton(
        onPressed: () {
          const DeleteAlertDialog();
        },
        icon: const Icon(Icons.delete),
        iconSize: 45,
      )
    ]);
  }
}
