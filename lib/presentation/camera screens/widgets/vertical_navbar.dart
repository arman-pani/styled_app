import 'package:flutter/material.dart';

class VerticalNavBar extends StatelessWidget {
  final double iconSize;
  const VerticalNavBar({
    super.key,
    this.iconSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.black45,
          padding: const EdgeInsets.symmetric(vertical: 15),
          height: iconSize * 3 + 3 * 2 * 15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home_rounded,
                  size: iconSize,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.camera,
                  size: iconSize,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.face,
                  size: iconSize,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );

    // List<NavigationRailDestination> destinations =
    //     const <NavigationRailDestination>[
    //   NavigationRailDestination(
    //     icon: Icon(
    //       Icons.home_rounded,
    //     ),
    //     label: Text(''),
    //   ),
    //   NavigationRailDestination(
    //     icon: Icon(
    //       Icons.camera,
    //     ),
    //     label: Text(''),
    //   ),
    //   NavigationRailDestination(
    //     icon: Icon(
    //       Icons.face,
    //     ),
    //     label: Text(''),
    //   ),
    // ];
    // return NavigationRail(
    //   groupAlignment: -1.5,
    //   backgroundColor: Colors.black45,
    //   selectedIndex: 1,
    //   unselectedIconTheme: IconThemeData(color: Colors.white, size: iconSize),
    //   selectedIconTheme: IconThemeData(
    //     fill: 1,
    //     color: ColorPallete.defaultOrangeColor,
    //     size: iconSize,
    //   ),
    //   labelType: NavigationRailLabelType.none,
    //   destinations: destinations,
    // );
  }
}
