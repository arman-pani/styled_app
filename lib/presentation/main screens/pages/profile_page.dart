import 'package:flutter/material.dart';
import 'package:nst_app/presentation/main%20screens/widgets/banner_appbar.dart';
import 'package:nst_app/presentation/main%20screens/widgets/bottom_navbar.dart';
import 'package:nst_app/presentation/main%20screens/widgets/profile_tab_bar.dart';
import 'package:nst_app/presentation/main%20screens/widgets/user_post.dart';

class ProfilePage extends StatefulWidget {
  final String userProfileBannerUrl;
  final String userProfilePictureUrl;
  final String userName;
  final String userBio;
  const ProfilePage({
    super.key,
    required this.userProfileBannerUrl,
    required this.userProfilePictureUrl,
    required this.userName,
    required this.userBio,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ScrollController _scrollController;
  static const kExpandedHeight = 200.0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (kExpandedHeight - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              BannerAppBar(
                kExpandedHeight: kExpandedHeight,
                isSliverAppBarExpanded: _isSliverAppBarExpanded,
                userProfileBannerUrl: widget.userProfileBannerUrl,
                userProfilePictureUrl: widget.userProfilePictureUrl,
                userName: widget.userName,
                userBio: widget.userBio,
              ),
              const ProfileTabBar(),
            ];
          },
          body: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                TabBarView(
                  children: [
                    PostListView(),
                    Icon(Icons.directions_transit, size: 350),
                  ],
                ),
                Positioned(
                  bottom: 18,
                  left: 18,
                  right: 18,
                  child: BottomNavBar(
                    selections: [false, false, false, true],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return const UserPost(
                userPostImageUrl: "assets/images/gallery_button.jpg",
                userProfilePictureUrl: "assets/images/gallery_button.jpg",
                userName: "snake_hecker",
                createdPostTime: "2 hrs");
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemCount: 10),
    );
  }
}
