import 'package:flutter/material.dart';
import 'package:nst_app/constants/color_pallete.dart';

class UserPost extends StatelessWidget {
  final String userName;
  final String createdPostTime;
  final String userPostImageUrl;
  final String userProfilePictureUrl;
  const UserPost(
      {super.key,
      required this.userPostImageUrl,
      required this.userProfilePictureUrl,
      required this.userName,
      required this.createdPostTime});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: double.infinity,
        height: 320,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(userPostImageUrl),
                // Top section of Post
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // User's Profile Picture
                      CircleAvatar(
                        backgroundImage: AssetImage(userProfilePictureUrl),
                        radius: 35 / 2,
                      ),
                      const Spacer(flex: 1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // UserName
                          Text(
                            userName,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          // Post Creation Time
                          Text(
                            "$createdPostTime ago",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      const Spacer(flex: 10),
                      // More Button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert_rounded,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            // Bottom section of Post
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: ColorPallete.defaultOrangeColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.brush_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_outline_rounded),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
