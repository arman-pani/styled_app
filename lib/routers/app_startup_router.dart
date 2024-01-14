import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nst_app/constants/route_constants.dart';
import 'package:nst_app/presentation/camera%20screens/pages/capture_page.dart';
import 'package:nst_app/presentation/camera%20screens/pages/styling_page.dart';
import 'package:nst_app/presentation/intro_page.dart';
import 'package:nst_app/presentation/loading_page.dart';
import 'package:nst_app/presentation/main%20screens/pages/home_page.dart';
import 'package:nst_app/presentation/main%20screens/pages/profile_page.dart';
import 'package:nst_app/presentation/new%20user%20screens/pages/customize_profile_page.dart';
import 'package:nst_app/presentation/new%20user%20screens/pages/email_verification_page.dart';
import 'package:nst_app/presentation/new%20user%20screens/pages/signin_page.dart';
import 'package:nst_app/presentation/new%20user%20screens/pages/signup_page.dart';

bool isLoggedIn = false;

class AppStartupRouter {
  GoRouter router = GoRouter(initialLocation: '/profile', routes: [
    GoRoute(
      name: RouteConstants.loading,
      path: '/',
      pageBuilder: (context, state) {
        // mimics the app loading function
        Future.delayed(const Duration(seconds: 4), () {
          if (!isLoggedIn) {
            GoRouter.of(context).go('/intro');
          } else {
            GoRouter.of(context).go('/home');
          }
        });

        return const MaterialPage(child: LoadingPage());
      },
    ),
    GoRoute(
      name: RouteConstants.intro,
      path: '/intro',
      pageBuilder: (context, state) => const MaterialPage(child: IntroPage()),
    ),
    GoRoute(
      name: RouteConstants.signIn,
      path: '/signin',
      pageBuilder: (context, state) => const MaterialPage(child: SignInPage()),
    ),
    GoRoute(
      name: RouteConstants.signUp,
      path: '/signup',
      pageBuilder: (context, state) => const MaterialPage(child: SignUpPage()),
    ),
    GoRoute(
      name: RouteConstants.verifyEmail,
      path: '/verify-email/:id',
      pageBuilder: (context, state) => MaterialPage(
          child: VerifyEmailPage(
        userEmailID: state.pathParameters['id']!,
      )),
    ),
    GoRoute(
      name: RouteConstants.customizeProfile,
      path: '/customize-profile',
      pageBuilder: (context, state) =>
          const MaterialPage(child: CustomizeProfilePage()),
    ),
    GoRoute(
        name: RouteConstants.capture,
        path: '/capture',
        pageBuilder: (context, state) =>
            const MaterialPage(child: CapturePage()),
        routes: [
          GoRoute(
              name: RouteConstants.styling,
              path: 'capture/styling/:content',
              pageBuilder: (context, state) {
                final content = state.pathParameters['content'];

                return MaterialPage(
                  child: StylingPage(
                    contentImageUrl: content,
                  ),
                );
              })
        ]),
    GoRoute(
      name: RouteConstants.home,
      path: '/home',
      pageBuilder: (context, state) => const MaterialPage(
          child: HomePage(
        userName: "snake_hecker",
      )),
    ),
    GoRoute(
      name: RouteConstants.profile,
      path: '/profile',
      pageBuilder: (context, state) => const MaterialPage(
          child: ProfilePage(
        userBio: "Hello there! this is snake hecker...",
        userName: "snake_hecker",
        userProfileBannerUrl: "assets/images/profile_banner.jpg",
        userProfilePictureUrl: "assets/images/profile_pic.png",
      )),
    ),
  ]);
}
