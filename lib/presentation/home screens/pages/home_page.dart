import 'package:flutter/material.dart';
import 'package:nst_app/constants/color_pallete.dart';
import 'package:nst_app/presentation/home%20screens/widgets/user_post.dart';

class HomePage extends StatefulWidget {
  final String userName;
  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String postStyleUrl = "assets/images/van_gogh.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  // HELLO <USERNAME> TEXT
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // HELLO TEXT
                      Text(
                        "hello",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      // <USERNAME> TEXT
                      Text(
                        widget.userName,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: ColorPallete.defaultOrangeColor,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        postStyleUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Divider(
                  color: Colors.white,
                  thickness: 3,
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const UserPost(
                          userPostImageUrl: "assets/images/gallery_button.jpg",
                          userProfilePictureUrl:
                              "assets/images/gallery_button.jpg",
                          userName: "snake_hecker",
                          createdPostTime: "2 hrs");
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                    itemCount: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
