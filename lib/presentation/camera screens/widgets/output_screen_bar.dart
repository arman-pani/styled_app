import 'package:flutter/material.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/delete_alert_dialog.dart';

class OutputScreenBar extends StatelessWidget {
  const OutputScreenBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            showDialog(
                context: context, builder: (_) => const DeleteAlertDialog());
          },
          icon: const Icon(Icons.delete),
          iconSize: 55,
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.brush_rounded),
          iconSize: 55,
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.download_rounded),
          iconSize: 55,
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share_rounded),
          iconSize: 55,
          color: Colors.white,
        )
      ],
    );
  }
}
