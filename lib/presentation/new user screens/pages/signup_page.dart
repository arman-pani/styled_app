import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nst_app/constants/route_constants.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/button1.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/emailtextformfield.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/passwordtextformfield.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/text_divider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  void _handleTermOfServiceTap() {
    // Handle tap on "Term of Service"
    debugPrint('Term of Service');
  }

  void _handlePrivacyPolicyTap() {
    // Handle tap on "Privacy Policy"
    debugPrint('Privacy Policy');
  }

  void _handleSignUpTap() {}

  void _handleSignInTap() {
    context.pushReplacementNamed(RouteConstants.signIn);
  }

  void _handleGoogleLoginTap() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Create your Account'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                EmailTextFormField(controller: _emailController),
                const Spacer(),
                PasswordTextFormField(
                  controller: _passwordController,
                  labelText: "Password*",
                ),
                const Spacer(),
                PasswordTextFormField(
                  controller: _confirmPasswordController,
                  labelText: "Confirm Password*",
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'By Signing up you accept the ',
                    style: const TextStyle(color: Colors.white30),
                    children: [
                      TextSpan(
                        text: 'Term of Service',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _handleTermOfServiceTap,
                      ),
                      const TextSpan(
                        text: ' and the ',
                        style: TextStyle(color: Colors.white30),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _handlePrivacyPolicyTap,
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
                // SignUp button
                Button1(label: "Sign up", onPressed: _handleSignUpTap),
                const Spacer(flex: 2),
                // SignUp divider
                const TextDivider(label: 'or Sign up with'),
                const Spacer(),
                // SignUp other options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: _handleGoogleLoginTap,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: SvgPicture.asset("assets/google_icon.svg"),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: SvgPicture.asset("assets/facebook_icon.svg"),
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: SvgPicture.asset("assets/twitter_icon.svg"),
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: SvgPicture.asset("assets/apple_icon.svg"),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 14),
                // Already have an account? Sign in
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: const TextStyle(color: Colors.white30),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _handleSignInTap,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
