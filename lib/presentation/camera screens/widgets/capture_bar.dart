import 'package:flutter/material.dart';
import 'package:nst_app/constants/color_pallete.dart';

class CaptureBar extends StatelessWidget {
  final VoidCallback onTapToggleButton;
  final VoidCallback onTapCaptureButton;
  final VoidCallback onTapGalleryButton;

  const CaptureBar({
    super.key,
    required this.onTapCaptureButton,
    required this.onTapGalleryButton,
    required this.onTapToggleButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Gallery Button
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onTapGalleryButton,
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/gallery_button.jpg'),
              radius: 55 / 2,
            ),
          ),
        ),

        RawMaterialButton(
          onPressed: onTapCaptureButton,
          elevation: 2.0,
          fillColor: ColorPallete.defaultOrangeColorCaptureButton,
          constraints: const BoxConstraints(
            minHeight: 85,
            minWidth: 85,
          ),
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 6,
            ),
          ),
        ),
        IconButton(
            onPressed: onTapToggleButton,
            iconSize: 55,
            color: Colors.white,
            icon: const Icon(
              Icons.flip_camera_android_rounded,
            ))
      ],
    );
  }
}
