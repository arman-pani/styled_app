import 'package:flutter/material.dart';
import 'package:nst_app/constants/color_pallete.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: TabBarPersistentHeader(TabBar(
        labelPadding: const EdgeInsets.symmetric(vertical: 5),
        dividerHeight: 0,
        labelColor: ColorPallete.defaultOrangeColor,
        unselectedLabelColor: Colors.white,
        splashFactory: NoSplash.splashFactory,
        indicatorColor: Colors.transparent,
        tabs: [
          const TabButton(
            label: "Posts",
            icon: Icons.photo_library_outlined,
          ),
          const TabButton(
            icon: Icons.bookmark_rounded,
            label: 'Saved',
          ),
        ],
      )),
      pinned: true,
    );
  }
}

class TabBarPersistentHeader extends SliverPersistentHeaderDelegate {
  TabBarPersistentHeader(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black,
      height: 100,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(TabBarPersistentHeader oldDelegate) {
    return false;
  }
}

class TabButton extends StatelessWidget {
  final String label;
  final IconData icon;
  const TabButton({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto Mono"),
          ),
        ],
      ),
    );
  }
}
