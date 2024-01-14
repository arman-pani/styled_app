import 'package:flutter/material.dart';

class BannerAppBar extends StatelessWidget {
  final double kExpandedHeight;
  final bool isSliverAppBarExpanded;
  final String userProfileBannerUrl;
  final String userProfilePictureUrl;
  final String userName;
  final String userBio;

  const BannerAppBar(
      {super.key,
      required this.kExpandedHeight,
      required this.isSliverAppBarExpanded,
      required this.userProfileBannerUrl,
      required this.userProfilePictureUrl,
      required this.userName,
      required this.userBio});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.black,
      expandedHeight: kExpandedHeight,
      floating: false,
      pinned: true,
      snap: false,
      // titleSpacing: 10,
      // backgroundColor: Colors.purple,
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 25,
      ),
      actions: [
        if (!isSliverAppBarExpanded) ...[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_rounded),
          ),
        ],
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_rounded),
        ),
      ],
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(20.0),
      //     bottomRight: Radius.circular(20.0),
      //   ),
      // ),
      title: isSliverAppBarExpanded
          ? ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(userProfilePictureUrl),
                      radius: 47.5 / 2,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontFamily: "Roboto Mono",
                      fontSize: 22,
                      letterSpacing: 0.1,
                    ),
                  ),
                  const Spacer(),
                  const BadgesRow(),
                  const Spacer(
                    flex: 10,
                  ),
                ],
              ),
            )
          : null,
      flexibleSpace: isSliverAppBarExpanded
          ? null
          : FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsets.only(top: 150, left: 15, bottom: 15),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: Image.asset(
                  userProfileBannerUrl,
                  fit: BoxFit.cover,
                ),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(userProfilePictureUrl),
                    radius: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto Mono"),
                      ),
                      const SizedBox(width: 5),
                      const BadgesRow(),
                    ],
                  ),
                  Text(
                    userBio,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        letterSpacing: -0.5,
                        fontFamily: "Roboto Mono"),
                  ),
                ],
              ),
            ),
    );
  }
}

class BadgesRow extends StatelessWidget {
  const BadgesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          LinearGradient(colors: [Colors.pink, Colors.blue])
              .createShader(bounds),
      child: const Row(
        children: [
          Icon(Icons.verified_outlined),
          Icon(Icons.emoji_events_outlined),
        ],
      ),
    );
  }
}
