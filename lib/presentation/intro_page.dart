import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nst_app/constants/route_constants.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/button1.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    void handleGuestModeTap() {
      // debugPrint('guestmode');
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool('isLoggedIn', true);

      context.pushNamed(RouteConstants.home);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: RichText(
              text: TextSpan(
                text: "Continue as ",
                style: const TextStyle(color: Colors.white30),
                children: [
                  TextSpan(
                    text: 'guest account',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = handleGuestModeTap,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 20),
              Button1(
                  label: "Create new account",
                  onPressed: () {
                    context.pushNamed(RouteConstants.signUp);
                  }),
              const Spacer(flex: 1),
              Button1(
                  label: "Login with existing account",
                  onPressed: () {
                    context.pushNamed(RouteConstants.signIn);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
