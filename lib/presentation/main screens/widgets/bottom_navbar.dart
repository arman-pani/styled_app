import 'package:flutter/material.dart';
import 'package:nst_app/constants/color_pallete.dart';

class BottomNavBar extends StatefulWidget {
  final List<bool> selections;
  const BottomNavBar({super.key, required this.selections});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  double toggleButtonWidth = 80;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Align(
        alignment: Alignment.center,
        // color: Colors.white,
        child: ToggleButtons(
          borderColor: Colors.white,
          borderWidth: 0,
          color: ColorPallete.defaultOrangeColor, // UnselectedIconColor
          selectedColor: Colors.white, //SelectedIconColor
          fillColor: ColorPallete.defaultOrangeColor, // SelectedBackgroundColor
          borderRadius: BorderRadius.circular(20),
          isSelected: widget.selections,
          onPressed: (index) {
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < widget.selections.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  widget.selections[buttonIndex] = true;
                } else {
                  widget.selections[buttonIndex] = false;
                }
              }
            });
          },
          children: [
            BottomNavBarItem(
              toggleButtonWidth: toggleButtonWidth,
              icon: Icons.search_rounded,
              isSelected: widget.selections[0],
            ),
            BottomNavBarItem(
              toggleButtonWidth: toggleButtonWidth,
              icon: Icons.home_rounded,
              isSelected: widget.selections[1],
            ),
            BottomNavBarItem(
              toggleButtonWidth: toggleButtonWidth,
              icon: Icons.camera_rounded,
              isSelected: widget.selections[2],
            ),
            BottomNavBarItem(
              toggleButtonWidth: toggleButtonWidth,
              icon: Icons.face_rounded,
              isSelected: widget.selections[3],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.toggleButtonWidth,
    required this.icon,
    required this.isSelected,
  });
  final IconData icon;
  final double toggleButtonWidth;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected
          ? ColorPallete.defaultOrangeColorCaptureButton
          : Colors.white,
      height: double.infinity,
      width: toggleButtonWidth,
      child: Icon(
        icon,
        weight: 1,
        size: 30,
      ),
    );
  }
}
