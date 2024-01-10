import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Text("Delete"),
          Icon(
            Icons.delete,
            size: 27,
          ),
        ],
      ),
      content: const Text("Do you really want to delete the photo?"),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
              context.pop();
            },
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              "No",
              style: TextStyle(color: Colors.green),
            ))
      ],
    );
  }
}
